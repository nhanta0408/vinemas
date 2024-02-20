import '../../data/model/movie.dart';
import '../../data/model/movie_list_response.dart';

abstract class HomeRepository {
  Future<MovieListResponse> getNowPlayingMovie(String? languageCode);
}
