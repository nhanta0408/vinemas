// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data/local/ticket_local_storage.dart';
import '../../data/models/ticket_model.dart';
import 'seat_selection_repository.dart';

class SeatSelectionRepositoryImplement extends SeatSelectionRepository {
  final TicketLocalStorage datasource;
  SeatSelectionRepositoryImplement(
    this.datasource,
  );
  @override
  Future<void> createTicket(TicketModel ticket) {
    return datasource.createTicket(ticket);
  }

  @override
  Future<List<TicketModel>> getTickets({required String userId}) {
    return datasource.readTickets(userId: userId);
  }

  @override
  Future<int?> deleteTicket(String ticketId) {
    return datasource.deleteTicket(ticketId);
  }
}
