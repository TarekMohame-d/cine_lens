import 'package:json_annotation/json_annotation.dart';

part 'movie_videos_model.g.dart';

@JsonSerializable(createToJson: false)
class MovieVideoModel {
  final int? id;
  @JsonKey(name: 'results')
  final List<VideoData>? videoData;

  MovieVideoModel({
    this.id,
    this.videoData,
  });

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class VideoData {
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final String? id;

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
}
