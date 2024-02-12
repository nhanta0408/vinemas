import '../../data/model/movie.dart';
import '../repo/home_repository.dart';
import '../repo/home_repository.implement.dart';
import 'home_usecase.dart';

class HomeUsecaseImplement extends HomeUsecase {
  final HomeRepository _homeRepository = HomeRepositoryImplement();
  @override
  Future<List<Movie>?> getNowPlayingMovie() async {
    return (await _homeRepository.getNowPlayingMovie()).results;
  }
}
