import '../../data/model/movie.dart';

abstract class HomeUsecase {
  Future<List<Movie>?> getNowPlayingMovie(String? languageCode);
}
