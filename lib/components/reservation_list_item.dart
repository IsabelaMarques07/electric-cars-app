import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stellantis/models/reservation.dart';

class ReservationListItem extends StatelessWidget {
  final Reservation reservation;
  final Function remover;
  final Function editar;

  const ReservationListItem(
      {Key? key,
      required this.reservation,
      required this.remover,
      required this.editar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            )
          ]),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    reservation.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 8, top: 6, right: 8, bottom: 6),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(237, 237, 227, 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            reservation.hour,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8, top: 6, right: 8, bottom: 6),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(237, 237, 227, 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          DateFormat('MM/dd/yyyy')
                              .format(reservation.dateReservation),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, top: 8, right: 10, bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(108, 99, 255, 0.4),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Vaga",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          reservation.spot,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            editar();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blueAccent,
                          )),
                      IconButton(
                          onPressed: () {
                            remover();
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ))
                    ],
                  )
                ],
              )
            ],
          )),
      onTap: () {
        Navigator.pushNamed(context, '/reservation-detalhes',
            arguments: reservation);
      },
    );
  }
}
