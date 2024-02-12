import '../model/movie.dart';

abstract class HomeRemoteDatasource {
  Future<List<Movie>> getNowPlayingMovies();
}
