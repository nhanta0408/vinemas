import '../../data/models/ticket_model.dart';

abstract class SeatSelectionRepository {
  Future<List<TicketModel>> getTickets({required String userId});
  Future<void> createTicket(TicketModel ticket);
  Future<int?> deleteTicket(String ticketId);
}
