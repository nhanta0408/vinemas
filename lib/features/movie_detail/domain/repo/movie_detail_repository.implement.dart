import '../../data/datasource/remote/movie_detail_rest_api.dart';
import '../../data/datasource/remote/session_rest_api.dart';
import '../../data/models/movie_detail_model.dart';
import '../../data/models/session_model.dart';
import '../../data/models/video_movie_model.dart';
import '../../data/models/video_movie_response.dart';
import 'movie_detail_repository.dart';

class MovieDetailRepositoryImplement extends MovieDetailRepository {
  final MovieDetailRestApi _movieDetailRestApi;
  final SessionRestApi _sessionRestApi;

  MovieDetailRepositoryImplement(
    this._movieDetailRestApi,
    this._sessionRestApi,
  );

  @override
  Future<MovieDetailModel> getMovieDetail(String id) {
    return _movieDetailRestApi.getMovieDetail(id);
  }

  @override
  Future<VideoMovieResponse> getVideoMovie(String id) {
    return _movieDetailRestApi.getVideoMovie(id);
  }

  @override
  Future<List<SessionModel>?> getMovieSessions(String id, DateTime dateTime) {
    return _sessionRestApi.getMovieSession(id, dateTime);
  }
}
