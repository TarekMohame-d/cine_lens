import 'package:json_annotation/json_annotation.dart';
part 'movie_images_model.g.dart';

@JsonSerializable()
class MovieImagesModel {
  List<Backdrops>? backdrops;
  int? id;
  List<Backdrops>? logos;
  List<Backdrops>? posters;

  MovieImagesModel({
    this.backdrops,
    this.id,
    this.logos,
    this.posters,
  });

  factory MovieImagesModel.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieImagesModelToJson(this);
}

@JsonSerializable()
class Backdrops {
  @JsonKey(name: 'aspect_ratio')
  double? aspectRatio;
  int? height;
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  @JsonKey(name: 'file_path')
  String? filePath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  int? width;

  Backdrops({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Backdrops.fromJson(Map<String, dynamic> json) =>
      _$BackdropsFromJson(json);
  Map<String, dynamic> toJson() => _$BackdropsToJson(this);
}
