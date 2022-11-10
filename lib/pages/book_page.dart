import 'package:flutter/material.dart';
import 'package:stellantis/components/reservation_list_item.dart';
import 'package:stellantis/models/reservation.dart';
import 'package:stellantis/pages/register_page.dart';
import 'package:stellantis/repository/reservation_repository.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final _reservationRepository = ReservationRepository();
  late Future<List<Reservation>> _futureReservations;

  @override
  void initState() {
    carregarReservas();
    super.initState();
  }

  void carregarReservas() {
    _futureReservations = _reservationRepository.listarReservas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 227, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              const Text(
                "Agendamento de vagas em eletropostos",
                style: TextStyle(
                  color: const Color.fromRGBO(24, 19, 31, 1),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FutureBuilder<List<Reservation>>(
                future: _futureReservations,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    final reservations = snapshot.data ?? [];
                    return Expanded(
                      child: ListView.builder(
                        itemCount: reservations.length,
                        itemBuilder: (context, index) {
                          final reservation = reservations[index];
                          void remover() async {
                            await _reservationRepository
                                .removerReserva(reservation.id!);

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Reserva cancelada com sucesso')));

                            setState(() {
                              reservations.removeAt(index);
                            });
                          }

                          void editar() async {
                            var success = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => RegisterPage(
                                  reservaParaEdicao: reservation,
                                ),
                              ),
                            ) as bool?;

                            if (success != null && success) {
                              setState(() {
                                carregarReservas();
                              });
                            }
                          }

                          return ReservationListItem(
                              reservation: reservation,
                              remover: remover,
                              editar: editar);
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? agendamentoCadastrado =
              await Navigator.of(context).pushNamed('/register') as bool?;

          if (agendamentoCadastrado != null && agendamentoCadastrado) {
            setState(() {
              carregarReservas();
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
