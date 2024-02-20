// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/common/model/bloc_status_state.dart';
import '../../data/models/movie_detail_model.dart';
import '../../data/models/session_model.dart';
import '../../domain/entities/movie_detail_entity.dart';

class MovieDetailState {
  final BlocStatusState status;
  final MovieDetailEntity? movieDetail;
  final List<SessionModel>? sessions;
  final String? errorMessage;
  final String? toastMessage;

  MovieDetailState({
    required this.status,
    this.movieDetail,
    this.sessions,
    this.errorMessage,
    this.toastMessage,
  });

  MovieDetailState copyWith({
    required BlocStatusState status,
    MovieDetailEntity? movieDetail,
    List<SessionModel>? sessions,
    String? errorMessage,
    String? toastMessage,
  }) {
    return MovieDetailState(
      status: status,
      movieDetail: movieDetail ?? this.movieDetail,
      sessions: sessions ?? this.sessions,
      errorMessage: errorMessage,
      toastMessage: toastMessage,
    );
  }
}
