import 'package:json_annotation/json_annotation.dart';

part 'movie_videos_model.g.dart';

@JsonSerializable()
class MovieVideoModel {
  int? id;
  @JsonKey(name: 'results')
  List<VideoData>? videoData;

  MovieVideoModel({
    this.id,
    this.videoData,
  });

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVideoModelToJson(this);
}

@JsonSerializable()
class VideoData {
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  @JsonKey(name: 'published_at')
  String? publishedAt;
  String? id;

  VideoData({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) =>
      _$VideoDataFromJson(json);
  Map<String, dynamic> toJson() => _$VideoDataToJson(this);
}
