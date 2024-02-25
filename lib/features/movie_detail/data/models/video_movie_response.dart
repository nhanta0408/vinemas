// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/common/model/dates.dart';
import 'video_movie_model.dart';

part 'video_movie_response.g.dart';

@JsonSerializable()
class VideoMovieResponse {
  final int? id;
  final List<VideoMovieModel>? results;
  VideoMovieResponse({
    this.id,
    this.results,
  });

  factory VideoMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoMovieResponseToJson(this);
}
