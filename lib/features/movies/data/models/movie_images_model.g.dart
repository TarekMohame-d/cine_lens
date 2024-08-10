// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieImagesModel _$MovieImagesModelFromJson(Map<String, dynamic> json) =>
    MovieImagesModel(
      backdrops: (json['backdrops'] as List<dynamic>?)
          ?.map((e) => Backdrops.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      logos: (json['logos'] as List<dynamic>?)
          ?.map((e) => Backdrops.fromJson(e as Map<String, dynamic>))
          .toList(),
      posters: (json['posters'] as List<dynamic>?)
          ?.map((e) => Backdrops.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieImagesModelToJson(MovieImagesModel instance) =>
    <String, dynamic>{
      'backdrops': instance.backdrops,
      'id': instance.id,
      'logos': instance.logos,
      'posters': instance.posters,
    };

Backdrops _$BackdropsFromJson(Map<String, dynamic> json) => Backdrops(
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toInt(),
      iso6391: json['iso_639_1'] as String?,
      filePath: json['file_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BackdropsToJson(Backdrops instance) => <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'height': instance.height,
      'iso_639_1': instance.iso6391,
      'file_path': instance.filePath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
