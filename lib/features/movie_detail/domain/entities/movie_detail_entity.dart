import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieDetailEntity {
  String? title;
  String? description;
  String? tagline;
  double? budget;
  String? genre;
  DateTime? releaseDate;
  double? revenue;
  double? voteAverage;
  int? voteCount;
  double? runtime;
  List<String>? countries;
  String? youtubeName;
  String? youtubeUrl;
  MovieDetailEntity({
    this.title,
    this.description,
    this.tagline,
    this.budget,
    this.genre,
    this.releaseDate,
    this.revenue,
    this.voteAverage,
    this.voteCount,
    this.runtime,
    this.countries,
    this.youtubeName,
    this.youtubeUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'tagline': tagline,
      'budget': budget,
      'genre': genre,
      'releaseDate': releaseDate?.millisecondsSinceEpoch,
      'revenue': revenue,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'runtime': runtime,
      'countries': countries,
      'youtubeName': youtubeName,
      'youtubeUrl': youtubeUrl,
    };
  }

  factory MovieDetailEntity.fromMap(Map<String, dynamic> map) {
    return MovieDetailEntity(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      tagline: map['tagline'] != null ? map['tagline'] as String : null,
      budget: map['budget'] != null ? map['budget'] as double : null,
      genre: map['genre'] != null ? map['genre'] as String : null,
      releaseDate: map['releaseDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['releaseDate'] as int)
          : null,
      revenue: map['revenue'] != null ? map['revenue'] as double : null,
      voteAverage:
          map['voteAverage'] != null ? map['voteAverage'] as double : null,
      voteCount: map['voteCount'] != null ? map['voteCount'] as int : null,
      runtime: map['runtime'] != null ? map['runtime'] as double : null,
      countries: map['countries'] != null
          ? List<String>.from(map['countries'] as List<String>)
          : null,
      youtubeName:
          map['youtubeName'] != null ? map['youtubeName'] as String : null,
      youtubeUrl:
          map['youtubeUrl'] != null ? map['youtubeUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailEntity.fromJson(String source) =>
      MovieDetailEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
