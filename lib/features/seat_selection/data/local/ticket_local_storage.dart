import '../models/ticket_model.dart';

abstract class TicketLocalStorage {
  void initDB();
  Future<List<TicketModel>> readTickets({required String userId});
  Future<void> createTicket(TicketModel ticket);
  Future<TicketModel> updateTicket(TicketModel ticket);
  Future<int?> deleteTicket(String ticketId);
  Future<void> clearData();
}
