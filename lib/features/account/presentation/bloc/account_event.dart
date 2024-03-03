// ignore_for_file: public_member_api_docs, sort_constructors_first
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
