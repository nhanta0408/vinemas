import '../../data/models/movie_detail_model.dart';
import '../../data/models/session_model.dart';
import '../entities/movie_detail_entity.dart';

abstract class MovieDetailUsecases {
  Future<MovieDetailEntity> getMovieDetail({
    required String id,
    required String languageCode,
  });

  Future<List<SessionModel>?> getMovieSession(String id, DateTime dateTime);
}
