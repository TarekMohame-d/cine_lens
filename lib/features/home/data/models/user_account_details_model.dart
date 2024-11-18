import 'package:json_annotation/json_annotation.dart';

part 'user_account_details_model.g.dart';


@JsonSerializable(createToJson: false)
class UserAccountDetailsModel {
  final Avatar? avatar;
  final int? id;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;
  @JsonKey(name: 'include_adult')
  final bool? includeAdult;
  @JsonKey(name: 'username')
  final String? userName;

  UserAccountDetailsModel({
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.userName,
  });

  factory UserAccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountDetailsModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Avatar {
  final Gravatar? gravatar;
  final Tmdb? tmdb;

  Avatar({this.gravatar, this.tmdb});

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}

@JsonSerializable(createToJson: false)
class Gravatar {
  final String? hash;

  Gravatar({this.hash});

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
}

@JsonSerializable(createToJson: false)
class Tmdb {
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;

  Tmdb({this.avatarPath});

  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);
}
