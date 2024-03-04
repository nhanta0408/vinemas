import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/constants/app_constants.dart';
import '../../../../core/common/enums/gender.dart';
import '../../../../core/common/model/bloc_status_state.dart';
import '../../../seat_selection/domain/entities/ticket_entity.dart';
import '../../../seat_selection/domain/usecase/seat_selection_usecase.dart';
import '../../domain/entities/account_entity.dart';
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
    on<AccountSaveEvent>(_onAccountSaveEvent);
    on<AccountChangeAvatarEvent>(_onAccountChangeAvatarEvent);
  }
  FutureOr<void> _onAccountFirstGetEvent(
    AccountFirstGetEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountState(status: BlocStatusState.loading));
    final defaultAccountData = AccountEntity(
      id: FirebaseAuth.instance.currentUser?.uid,
      fullName: null,
      avatarUrl: null,
      phoneNumber: null,
      email: FirebaseAuth.instance.currentUser?.email,
      gender: Gender.male,
      city: cities.first,
      dateOfBirth: DateTime(DateTime.now().year - 18),
    );
    try {
      final tickets =
          await _seatSelectionUsecase.getTickets(userId: event.userId);
      final account = await _accountUsecases.getAccountData(event.userId) ??
          defaultAccountData;
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          tickets: tickets,
          accountEntity: account,
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

  FutureOr<void> _onAccountSaveEvent(
    AccountSaveEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(
      state.copyWith(
        status: BlocStatusState.loading,
      ),
    );
    try {
      await _accountUsecases.setAccountData(event.account);

      emit(
        state.copyWith(
          status: BlocStatusState.success,
          accountEntity: event.account,
          toastMessage: AccountStateStringCode.saveAccountSuccessfully,
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

  FutureOr<void> _onAccountChangeAvatarEvent(
    AccountChangeAvatarEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(
      state.copyWith(
        status: BlocStatusState.loading,
      ),
    );
    try {
      await _accountUsecases.changedAvatar(
        avatarData: event.avatarData,
        email: event.email,
        accountData: state.accountEntity ?? AccountEntity(),
      );
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          toastMessage: AccountStateStringCode.changeAvatarSuccessfully,
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
}
