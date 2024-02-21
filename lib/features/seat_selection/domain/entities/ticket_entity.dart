import '../../../movie_detail/data/models/session_model.dart';
import '../../../movie_detail/domain/entities/movie_detail_entity.dart';
import 'seat_theater_entity.dart';

class TicketEntity {
  MovieDetailEntity? movie;
  SessionModel? session;
  List<SeatTheaterEntity>? seats;
  double? totalAmount;
  DateTime? createdAt;
}
