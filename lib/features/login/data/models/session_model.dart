// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  bool? success;
  bool? failure;
  @JsonKey(name: 'session_id')
  String? sessionId;
  @JsonKey(name: 'status_code')
  int? statusCode;
  @JsonKey(name: 'status_message')
  String? statusMessage;

  SessionModel({
    this.success,
    this.failure,
    this.sessionId,
    this.statusCode,
    this.statusMessage,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}
