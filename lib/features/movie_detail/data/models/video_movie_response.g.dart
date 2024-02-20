// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoMovieResponse _$VideoMovieResponseFromJson(Map<String, dynamic> json) =>
    VideoMovieResponse(
      id: json['id'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => VideoMovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoMovieResponseToJson(VideoMovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
