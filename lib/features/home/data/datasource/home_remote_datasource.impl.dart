import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/utils/dotenv.dart';
import '../model/movie.dart';
import 'home_remote_datasource.dart';

class HomeRemoteDatasourceImplement extends HomeRemoteDatasource {
  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    // return [];
    final apiKey = DotEnvUtils.apiKey;
    final host = DotEnvUtils.hostApi;
    final apiVerion = DotEnvUtils.apiVersion;
    final queryParam = {
      'api_key': apiKey,
    };
    final url = Uri.https(
      host,
      '$apiVerion/movie/now_playing',
      queryParam,
    );
    final response = await http.get(url);
    final json = jsonDecode(response.body) as Map<String, dynamic>?;
    final bodyJson = json?['results'] as List;
    final result =
        bodyJson.whereType<Map<String, dynamic>>().map(Movie.fromJson).toList();
    return result;
  }
}
