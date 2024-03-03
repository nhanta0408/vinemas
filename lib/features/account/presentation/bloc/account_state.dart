import '../../../../core/common/model/bloc_status_state.dart';
import '../../../seat_selection/domain/entities/ticket_entity.dart';

enum AccountStateStringCode {
  deleteTicketSuccessfully,
}

class AccountState {
  final BlocStatusState status;
  final List<TicketEntity>? tickets;
  final String? errorMessage;
  final AccountStateStringCode? toastMessage;

  AccountState({
    required this.status,
    this.tickets,
    this.errorMessage,
    this.toastMessage,
  });

  AccountState copyWith({
    required BlocStatusState status,
    List<TicketEntity>? tickets,
    String? errorMessage,
    AccountStateStringCode? toastMessage,
  }) {
    return AccountState(
      status: status,
      tickets: tickets ?? this.tickets,
      errorMessage: errorMessage,
      toastMessage: toastMessage,
    );
  }
}
