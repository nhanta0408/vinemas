// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class MovieDetailEvent {}

class GetMovieDetailEvent extends MovieDetailEvent {
  final String id;
  final String languageCode;
  GetMovieDetailEvent({
    required this.id,
    required this.languageCode,
  });
}

class GetMovieSessionsEvent extends MovieDetailEvent {
  final String id;
  final DateTime dateTime;
  GetMovieSessionsEvent({
    required this.id,
    required this.dateTime,
  });
}
