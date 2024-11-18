// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_videos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideoModel _$MovieVideoModelFromJson(Map<String, dynamic> json) =>
    MovieVideoModel(
      id: (json['id'] as num?)?.toInt(),
      videoData: (json['results'] as List<dynamic>?)
          ?.map((e) => VideoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

VideoData _$VideoDataFromJson(Map<String, dynamic> json) => VideoData(
      iso6391: json['iso_639_1'] as String?,
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      official: json['official'] as bool?,
      publishedAt: json['published_at'] as String?,
      id: json['id'] as String?,
    );
