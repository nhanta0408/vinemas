import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/model/bloc_status_state.dart';
import '../../domain/usecase/seat_selection_usecase.dart';
import 'seat_selection_event.dart';
import 'seat_selection_state.dart';

class SeatSelectionBloc extends Bloc<SeatSelectionEvent, SeatSelectionState> {
  final SeatSelectionUsecase _usecases;
  SeatSelectionBloc(this._usecases)
      : super(SeatSelectionState(status: BlocStatusState.initial)) {
    on<SeatSelectionCreateTicketEvent>(_onSeatSelectionCreateTicketEvent);
  }
  FutureOr<void> _onSeatSelectionCreateTicketEvent(
    SeatSelectionCreateTicketEvent event,
    Emitter<SeatSelectionState> emit,
  ) async {
    emit(SeatSelectionState(status: BlocStatusState.loading));
    try {
      await _usecases.createTicket(event.ticket);
      final listTicket = await _usecases.getTickets(
        userId: FirebaseAuth.instance.currentUser?.uid ?? '--',
      );
      emit(SeatSelectionState(status: BlocStatusState.success));
    } catch (e) {
      emit(
        SeatSelectionState(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
