import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/model/bloc_status_state.dart';
import '../../../../core/utils/localizations.dart';
import '../../../seat_selection/domain/entities/ticket_entity.dart';
import '../../domain/entities/account_entity.dart';

enum AccountStateStringCode {
  deleteTicketSuccessfully,
  saveAccountSuccessfully,
  changeAvatarSuccessfully,
  logoutSuccessfully;

  void show(BuildContext context) {
    String? message;
    switch (this) {
      case AccountStateStringCode.deleteTicketSuccessfully:
        message = translate(context).deleteTicketSuccessfully;
        break;
      case AccountStateStringCode.saveAccountSuccessfully:
        message = translate(context).saveAccountSuccessfully;
        break;
      case AccountStateStringCode.changeAvatarSuccessfully:
        message = translate(context).changeAvatarSuccessfully;
        break;
      case AccountStateStringCode.logoutSuccessfully:
        break;
    }
    if (message == null) {
      return;
    }
    showOkAlertDialog(
      context: context,
      title: translate(context).inform,
      message: message,
    );
  }
}

class AccountState {
  final BlocStatusState status;
  final List<TicketEntity>? tickets;
  final String? errorMessage;
  final AccountStateStringCode? toastMessage;
  final AccountEntity? accountEntity;
  final AccountEntity? preAccountEntity;

  AccountState({
    required this.status,
    this.tickets,
    this.errorMessage,
    this.toastMessage,
    this.accountEntity,
    this.preAccountEntity,
  });

  AccountState copyWith({
    required BlocStatusState status,
    List<TicketEntity>? tickets,
    String? errorMessage,
    AccountStateStringCode? toastMessage,
    AccountEntity? accountEntity,
    AccountEntity? preAccountEntity,
  }) {
    return AccountState(
      status: status,
      tickets: tickets ?? this.tickets,
      errorMessage: errorMessage,
      toastMessage: toastMessage,
      accountEntity: accountEntity ?? this.accountEntity,
      preAccountEntity: preAccountEntity ?? this.preAccountEntity,
    );
  }
}
