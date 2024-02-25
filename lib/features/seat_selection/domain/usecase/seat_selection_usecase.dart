import '../entities/ticket_entity.dart';

abstract class SeatSelectionUsecase {
  Future<List<TicketEntity>> getTickets({required String userId});
  Future<void> createTicket(TicketEntity ticket);
}
