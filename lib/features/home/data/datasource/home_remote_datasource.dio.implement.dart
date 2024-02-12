import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/utils/dotenv.dart';
import '../model/movie.dart';
import 'home_remote_datasource.dart';

class HomeRemoteDatasourceDioImplement extends HomeRemoteDatasource {
  final Dio dio;

  HomeRemoteDatasourceDioImplement({required this.dio});

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final result = await dio.get(
      '/movie/now_playing',
    );
    print(result.data['results']);
    return []; // final apiKey = DotEnvUtils.apiKey;
    // final host = DotEnvUtils.hostApi;
    // final apiVerion = DotEnvUtils.apiVersion;
    // final queryParam = {
    //   'api_key': apiKey,
    // };
    // final url = Uri.https(
    //   host,
    //   '$apiVerion/movie/now_playing',
    //   queryParam,
    // );
    // final response = await http.get(url);
    // final json = jsonDecode(response.body) as Map<String, dynamic>?;
    // final bodyJson = json?['results'] as List;
    // final result =
    //     bodyJson.whereType<Map<String, dynamic>>().map(Movie.fromJson).toList();
    // return result;
  }
}
