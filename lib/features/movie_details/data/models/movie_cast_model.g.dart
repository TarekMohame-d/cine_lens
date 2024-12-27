// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastAndCrewModel _$CastAndCrewModelFromJson(Map<String, dynamic> json) =>
    CastAndCrewModel(
      id: (json['id'] as num?)?.toInt(),
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      adult: json['adult'] as bool?,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
      castId: (json['backdrop_path'] as num?)?.toInt(),
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
      adult: json['adult'] as bool?,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
      creditId: json['credit_id'] as String?,
      department: json['department'] as String?,
      job: json['job'] as String?,
    );
