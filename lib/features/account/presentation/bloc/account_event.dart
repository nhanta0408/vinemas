// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import '../../domain/entities/account_entity.dart';

abstract class AccountEvent {}

class AccountFirstGetEvent extends AccountEvent {
  String userId;
  AccountFirstGetEvent({
    required this.userId,
  });
}

class AccountDeleteTicketEvent extends AccountEvent {
  String ticketId;
  AccountDeleteTicketEvent({
    required this.ticketId,
  });
}

class AccountSaveEvent extends AccountEvent {
  AccountEntity account;
  AccountSaveEvent({
    required this.account,
  });
}

class AccountChangeAvatarEvent extends AccountEvent {
  final Uint8List avatarData;
  final String email;
  AccountChangeAvatarEvent({
    required this.avatarData,
    required this.email,
  });
}

class AccountSignoutEvent extends AccountEvent {}
