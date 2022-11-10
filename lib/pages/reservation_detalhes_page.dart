import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stellantis/models/reservation.dart';

class ReservationDetalhesPage extends StatelessWidget {
  const ReservationDetalhesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reservation = ModalRoute.of(context)!.settings.arguments as Reservation;

    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237 , 227, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 237 , 227, 1),
        shadowColor: null,
        foregroundColor: const Color.fromRGBO(24, 19 , 31, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16,),
            const Text("Detalhes da vaga reservada", 
              style: TextStyle(
                color: const Color.fromRGBO(24, 19 , 31, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),),
            ListTile(
              title: const Text('Nome do posto'),
              subtitle: Text(reservation.name),
            ),
            ListTile(
              title: const Text('Data da reserva'),
              subtitle: Text(DateFormat('MM/dd/yyyy').format(reservation.dateReservation)),
            ),
            ListTile(
              title: const Text('Horário'),
              subtitle: Text(reservation.hour),
            ),
            ListTile(
              title: const Text('Código da vaga'),
              subtitle: Text(reservation.spot),
            ),
          ],
        ),
      ),
    );
  }
}
