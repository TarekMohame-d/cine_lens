// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'session_model.g.dart';

@JsonSerializable(createToJson: false)
class SessionModel {
  final bool? success;
  final bool? failure;
  @JsonKey(name: 'session_id')
  final String? sessionId;
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'status_message')
  final String? statusMessage;

  SessionModel({
    this.success,
    this.failure,
    this.sessionId,
    this.statusCode,
    this.statusMessage,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
}
