import 'package:json_annotation/json_annotation.dart';

part 'belongs_to_collection_model.g.dart';

@JsonSerializable()
class BelongsToCollectionModel {
  int? id;
  String? name;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  BelongsToCollectionModel({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionModelToJson(this);
}
