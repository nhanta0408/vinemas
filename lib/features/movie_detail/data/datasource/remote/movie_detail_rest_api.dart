import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/movie_detail_model.dart';
import '../../models/video_movie_model.dart';
import '../../models/video_movie_response.dart';

part 'movie_detail_rest_api.g.dart';

@RestApi()
abstract class MovieDetailRestApi {
  factory MovieDetailRestApi(Dio dio, {String baseUrl}) = _MovieDetailRestApi;

  @GET('/movie/{id}')
  Future<MovieDetailModel> getMovieDetail(@Path('id') String id);

  @GET('/movie/{id}/videos')
  Future<VideoMovieResponse> getVideoMovie(@Path('id') String id);
}
