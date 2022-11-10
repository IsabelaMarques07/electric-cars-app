
import 'package:stellantis/database/database_manager.dart';
import 'package:stellantis/models/reservation.dart';

class ReservationRepository {
  Future<List<Reservation>> listarReservas() async {
    final db = await DatabaseManager().getDatabase();
    final List<Map<String, dynamic>> rows = await db.rawQuery('''
          SELECT 
            reservations.id, 
            reservations.name,
            reservations.dateReservation,
            reservations.hour, 
            reservations.spot
          FROM reservations
''');
    return rows
        .map(
          (row) => Reservation(
            id: row['id'],
            name: row['name'],
            hour: row['hour'],
            spot: row['spot'],
            dateReservation: DateTime.fromMillisecondsSinceEpoch(row['dateReservation']),
          ),
        )
        .toList();
  }

  Future<void> cadastrarReserva(Reservation reservation) async {
    final db = await DatabaseManager().getDatabase();

    db.insert("reservations", {
      "id": reservation.id,
      "name": reservation.name,
      "hour": reservation.hour,
      "dateReservation": reservation.dateReservation?.millisecondsSinceEpoch,
      "spot": reservation.spot,
    });
  }

  Future<void> removerReserva(int id) async {
    final db = await DatabaseManager().getDatabase();
    await db.delete('reservations', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> editarReserva(Reservation reservation) async {
    final db = await DatabaseManager().getDatabase();
    return db.update(
        'reservations',
        {
          "id": reservation.id,
          "name": reservation.name,
          "hour": reservation.hour,
          "dateReservation": reservation.dateReservation?.millisecondsSinceEpoch,
          "spot": reservation.spot,
        },
        where: 'id = ?',
        whereArgs: [reservation.id]);
  }
}
