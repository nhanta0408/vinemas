import '../../../../core/common/model/bloc_status_state.dart';
import '../../domain/entities/ticket_entity.dart';

class SeatSelectionState {
  final BlocStatusState status;
  final TicketEntity? ticket;
  final String? errorMessage;
  final String? toastMessage;

  SeatSelectionState({
    required this.status,
    this.ticket,
    this.errorMessage,
    this.toastMessage,
  });

  SeatSelectionState copyWith({
    required BlocStatusState status,
    TicketEntity? ticket,
    String? errorMessage,
    String? toastMessage,
  }) {
    return SeatSelectionState(
      status: status,
      ticket: ticket ?? this.ticket,
      errorMessage: errorMessage,
      toastMessage: toastMessage,
    );
  }
}
