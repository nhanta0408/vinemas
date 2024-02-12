import '../../../../main.dart';
import '../../data/datasource/remote/home_rest_api.dart';
import '../../data/model/movie_list_response.dart';
import 'home_repository.dart';

class HomeRepositoryImplement extends HomeRepository {
  final HomeRestApi _homeRestApi = HomeRestApi(dioClient.dio);
  @override
  Future<MovieListResponse> getNowPlayingMovie() {
    return _homeRestApi.getNowPlayingMovies();
  }
}
