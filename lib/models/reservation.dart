class Reservation {
  int? id;
  String name;
  DateTime dateReservation;
  String hour;
  String spot;

  Reservation({
    this.id,
    required this.name,
    required this.dateReservation,
    required this.hour,
    required this.spot,
  });
}
