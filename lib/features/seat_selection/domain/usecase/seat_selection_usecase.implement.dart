import '../../data/models/ticket_model.dart';
import '../entities/ticket_entity.dart';
import '../repository/seat_selection_repository.dart';
import 'seat_selection_usecase.dart';

class SeatSelectionUsecaseImplement extends SeatSelectionUsecase {
  final SeatSelectionRepository repo;

  SeatSelectionUsecaseImplement(this.repo);
  @override
  Future<void> createTicket(TicketEntity ticket) {
    final ticketModel = TicketModel.fromEntity(ticket);
    return repo.createTicket(ticketModel);
  }

  @override
  Future<List<TicketEntity>> getTickets({required String userId}) async {
    final results = await repo.getTickets(userId: userId);
    return results.map((e) => e.convertToEntity()).toList();
  }
}
