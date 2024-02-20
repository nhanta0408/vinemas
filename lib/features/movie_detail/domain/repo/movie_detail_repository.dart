import '../../data/models/movie_detail_model.dart';
import '../../data/models/session_model.dart';
import '../../data/models/video_movie_response.dart';

abstract class MovieDetailRepository {
  Future<MovieDetailModel> getMovieDetail(String id);
  Future<VideoMovieResponse> getVideoMovie(String id);
  Future<List<SessionModel>?> getMovieSessions(String id, DateTime dateTime);
}
