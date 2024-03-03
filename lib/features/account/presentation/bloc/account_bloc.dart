import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/model/bloc_status_state.dart';
import '../../../seat_selection/domain/entities/ticket_entity.dart';
import '../../../seat_selection/domain/usecase/seat_selection_usecase.dart';
import '../../domain/usecases/account_usecase.dart';
import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountUsecase _accountUsecases;
  final SeatSelectionUsecase _seatSelectionUsecase;
  AccountBloc(this._accountUsecases, this._seatSelectionUsecase)
      : super(AccountState(status: BlocStatusState.initial)) {
    on<AccountFirstGetEvent>(_onAccountFirstGetEvent);
    on<AccountDeleteTicketEvent>(_onAccountDeleteTicketEvent);
  }
  FutureOr<void> _onAccountFirstGetEvent(
    AccountFirstGetEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountState(status: BlocStatusState.loading));
    try {
      final tickets =
          await _seatSelectionUsecase.getTickets(userId: event.userId);
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          tickets: tickets,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onAccountDeleteTicketEvent(
    AccountDeleteTicketEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final numberOfDeleteTicket =
          await _seatSelectionUsecase.deleteTicket(event.ticketId);
      if (numberOfDeleteTicket != 0) {
        List<TicketEntity> newTickets;
        newTickets = [...state.tickets ?? []]
          ..removeWhere((element) => element.id == event.ticketId);
        emit(
          state.copyWith(
            tickets: newTickets,
            status: BlocStatusState.success,
            toastMessage: AccountStateStringCode.deleteTicketSuccessfully,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
