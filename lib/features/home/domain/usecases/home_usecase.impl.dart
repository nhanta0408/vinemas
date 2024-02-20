import '../../data/model/movie.dart';
import '../repo/home_repository.dart';
import '../repo/home_repository.implement.dart';
import 'home_usecase.dart';

class HomeUsecaseImplement extends HomeUsecase {
  final HomeRepository _homeRepository;
  HomeUsecaseImplement(this._homeRepository);
  @override
  Future<List<Movie>?> getNowPlayingMovie(String? languageCode) async {
    return (await _homeRepository.getNowPlayingMovie(languageCode)).results;
  }
}
