import 'package:json_annotation/json_annotation.dart';
part 'movie_cast_model.g.dart';

@JsonSerializable()
class CastModel {
  int? id;
  List<Cast>? cast;
  List<Crew>? crew;

  CastModel({
    this.id,
    this.cast,
    this.crew,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);
  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}

@JsonSerializable()
class Cast {
  bool? adult;
  int? gender;
  int? id;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  String? name;
  @JsonKey(name: 'original_name')
  String? originalName;
  double? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'backdrop_path')
  int? castId;
  String? character;
  @JsonKey(name: 'credit_id')
  String? creditId;
  int? order;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable()
class Crew {
  bool? adult;
  int? gender;
  int? id;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  String? name;
  @JsonKey(name: 'original_name')
  String? originalName;
  double? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'credit_id')
  String? creditId;
  String? department;
  String? job;

  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
