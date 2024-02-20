import 'package:json_annotation/json_annotation.dart';

part 'video_movie_model.g.dart';

@JsonSerializable()
class VideoMovieModel {
  @JsonKey(name: 'iso_639_1')
  String iso6391;

  @JsonKey(name: 'iso_3166_1')
  String iso31661;

  String name;
  String key;
  String site;
  int size;
  String type;

  @JsonKey(name: 'official')
  bool isOfficial;

  @JsonKey(name: 'published_at')
  String publishedAt;

  String id;

  VideoMovieModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.isOfficial,
    required this.publishedAt,
    required this.id,
  });

  factory VideoMovieModel.fromJson(Map<String, dynamic> json) =>
      _$VideoMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoMovieModelToJson(this);
}
