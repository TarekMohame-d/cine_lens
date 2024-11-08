// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccountDetailsModel _$UserAccountDetailsModelFromJson(
        Map<String, dynamic> json) =>
    UserAccountDetailsModel(
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      iso6391: json['iso_639_1'] as String?,
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
      includeAdult: json['include_adult'] as bool?,
      userName: json['username'] as String?,
    );

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      gravatar: json['gravatar'] == null
          ? null
          : Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
      tmdb: json['tmdb'] == null
          ? null
          : Tmdb.fromJson(json['tmdb'] as Map<String, dynamic>),
    );

Gravatar _$GravatarFromJson(Map<String, dynamic> json) => Gravatar(
      hash: json['hash'] as String?,
    );

Tmdb _$TmdbFromJson(Map<String, dynamic> json) => Tmdb(
      avatarPath: json['avatar_path'] as String?,
    );
