import '../../../../main.dart';
import '../../data/datasource/remote/home_rest_api.dart';
import '../../data/model/movie_list_response.dart';
import '../usecases/home_usecase.impl.dart';
import 'home_repository.dart';

class HomeRepositoryImplement extends HomeRepository {
  final HomeRestApi _homeRestApi;
  HomeRepositoryImplement(this._homeRestApi);
  @override
  Future<MovieListResponse> getNowPlayingMovie(String? languageCode) {
    return _homeRestApi.getNowPlayingMovies(languageCode);
  }
}
