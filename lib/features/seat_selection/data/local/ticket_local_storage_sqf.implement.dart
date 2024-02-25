import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/ticket_model.dart';
import 'ticket_local_storage.dart';

class TicketLocalStorageSqfImplement extends TicketLocalStorage {
  static Database? _database;
  TicketLocalStorageSqfImplement();

  @override
  Future<void> initDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'vinemas.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          '''
CREATE TABLE tickets(
  id TEXT PRIMARY KEY, 
  title TEXT, 
  theater_name TEXT, 
  run_time TEXT, 
  seats TEXT, 
  amount_per_seat REAL, 
  total_amount REAL, 
  created_at TEXT, 
  user_id TEXT)
          ''',
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> createTicket(TicketModel ticket) async {
    final db = _database;
    await db?.insert('tickets', ticket.toJson());
  }

  @override
  Future<List<TicketModel>> readTickets({required String userId}) async {
    final db = _database;
    final result = await db?.query('tickets');
    return result?.map(TicketModel.fromJson).toList() ?? [];
  }

  @override
  Future<TicketModel> updateTicket(TicketModel ticket) {
    // TODO: implement updateTicket
    throw UnimplementedError();
  }

  @override
  Future<int?> deleteTicket(String ticketId) async {
    final result = await _database
        ?.delete('tickets', where: 'id = ?', whereArgs: [ticketId]);
    return result;
  }

  @override
  Future<void> clearData() async {
    await _database?.delete('tickets');
  }
}
