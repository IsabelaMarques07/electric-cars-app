import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'stellantis.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_reservations);
  //   await db.insert('reservations', {
  //     'name': 'Posto Ipiranga',
  //     'hour': '12:03 AM',
  //     'spot': 'A786'
  //   });
  //   await db.insert('reservations', {
  //     'name': 'Posto Shell',
  //     'hour': '3:03 PM',
  //     'spot': 'L75'
  //   });
  //   await db.insert('reservations', {
  //     'name': 'Posto ABC',
  //     'hour': '9:03 AM',
  //     'spot': 'D452'
  //   });
  }

    String get _reservations => '''
    CREATE TABLE IF NOT EXISTS reservations (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      dateReservation INTEGER,
      hour TEXT,
      spot TEXT
    );
  ''';
}
