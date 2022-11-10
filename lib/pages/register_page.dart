import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:stellantis/models/reservation.dart';
import 'package:stellantis/repository/reservation_repository.dart';

class RegisterPage extends StatefulWidget {
  Reservation? reservaParaEdicao;
  RegisterPage({Key? key, this.reservaParaEdicao}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _reservationRepository = ReservationRepository();
  final _nomeDoPostoController = TextEditingController();
  final _dataController = TextEditingController();
  final _horaController = TextEditingController();
  final _vagaController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final reservation = widget.reservaParaEdicao;
    if (reservation != null) {
      _nomeDoPostoController.text = reservation.name;
      _horaController.text = reservation.hour;
      _vagaController.text = reservation.spot;
      _dataController.text = DateFormat('MM/dd/yyyy').format(reservation.dateReservation!);
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(237, 237 , 227, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
              const Text("Cadastro de vagas", 
              style: TextStyle(
                color: const Color.fromRGBO(24, 19 , 31, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
                  const SizedBox(height: 20,),
                  Image.asset('assets/images/register.png', 
                  height: MediaQuery.of(context).size.height*0.2,),
                  const SizedBox(height: 20,),
                  _buildNomeDoPosto(),
                  const SizedBox(height: 20,),
                  _buildData(),
                  const SizedBox(height: 20,),
                  _buildHora(),
                  const SizedBox(height: 20,),
                  _buildVaga(),
                  const SizedBox(height: 20,),
                _buildButton(),
                ],
              ),
              )
          ),
        ),
      ),
    );
  }

    TextFormField _buildNomeDoPosto() {
    return TextFormField(
      controller: _nomeDoPostoController,
      decoration: const InputDecoration(
        hintText: 'Informe o nome do posto',
        labelText: 'Nome do Posto',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe o nome do posto';
        }
        if (value.length < 5 || value.length > 30) {
          return 'O nome deve ter entre 5 e 30 caracteres';
        }
        return null;
      },
    );
  }
    TextFormField _buildData() {
    return TextFormField(
      controller: _dataController,
      decoration: const InputDecoration(
        hintText: 'Informe uma Data',
        labelText: 'Data',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.calendar_month),
      ),
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());

        DateTime? dataSelecionada = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (dataSelecionada != null) {
          _dataController.text =
              DateFormat('dd/MM/yyyy').format(dataSelecionada);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe uma Data';
        }

        try {
          DateFormat('dd/MM/yyyy').parse(value);
        } on FormatException {
          return 'Formato de data inválida';
        }

        return null;
      },
    );
  }

      TextFormField _buildHora() {
    return TextFormField(
      controller: _horaController,
      decoration: const InputDecoration(
        hintText: 'Informe uma Data',
        labelText: 'Data',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.calendar_month),
      ),
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());

        final TimeOfDay? horaSelecionada = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: 00, minute: 00),
        );
        

        if (horaSelecionada != null) {
          String _hour, _minute, _time;
        _hour = horaSelecionada.hour.toString();
        _minute = horaSelecionada.minute.toString();
        _time = _hour + ' : ' + _minute;
        _horaController.text = _hour;
        _horaController.text = formatDate(
            DateTime(2019, 08, 1, horaSelecionada.hour, horaSelecionada.minute),
            [hh, ':', nn, " ", am]).toString();
      }
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe uma Data';
        }

        try {
          DateFormat('Hms', 'en_US').parse(value);
        } on FormatException {
          return 'Formato de data inválida';
        }

        return null;
      };
      });
  }

      TextFormField _buildVaga() {
    return TextFormField(
      controller: _vagaController,
      decoration: const InputDecoration(
        hintText: 'Informe a vaga',
        labelText: 'Código da vaga',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informeo código da vaga';
        }
        if (value.length < 5 || value.length > 30) {
          return 'O código deve ter entre 5 e 30 caracteres';
        }
        return null;
      },
    );
  }


  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Reservar vaga'),
        ),
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            final name = _nomeDoPostoController.text;
            final hour = _horaController.text;
            final spot = _vagaController.text;
            final date = DateFormat('dd/MM/yyyy').parse(_dataController.text);

            final reservation = Reservation(
              name: name,
              hour: hour,
              spot: spot,
              dateReservation: date
            );

            try {
              if (widget.reservaParaEdicao != null) {
                reservation.id = widget.reservaParaEdicao!.id;
                await _reservationRepository.editarReserva(reservation);
              } else {
                await _reservationRepository.cadastrarReserva(reservation);
              }

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Reserva cadastrada com sucesso'),
              ));

              Navigator.of(context).pop(true);
            } catch (e) {
              Navigator.of(context).pop(false);
            }
          }
        },
      ),
    );
  }

}