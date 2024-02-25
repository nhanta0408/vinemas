// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/entities/ticket_entity.dart';

abstract class SeatSelectionEvent {}

class SeatSelectionCreateTicketEvent extends SeatSelectionEvent {
  final TicketEntity ticket;
  SeatSelectionCreateTicketEvent({
    required this.ticket,
  });
}
