// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'request_token_model.g.dart';

@JsonSerializable(createToJson: false)
class RequestTokenModel {
  final bool? success;
  @JsonKey(name: 'expires_at')
  final String? expiresAt;
  @JsonKey(name: 'request_token')
  final String? requestToken;

  RequestTokenModel({
    this.success,
    this.expiresAt,
    this.requestToken,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenModelFromJson(json);
}
