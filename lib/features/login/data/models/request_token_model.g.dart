// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTokenModel _$RequestTokenModelFromJson(Map<String, dynamic> json) =>
    RequestTokenModel(
      success: json['success'] as bool?,
      expiresAt: json['expires_at'] as String?,
      requestToken: json['request_token'] as String?,
    );

Map<String, dynamic> _$RequestTokenModelToJson(RequestTokenModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'expires_at': instance.expiresAt,
      'request_token': instance.requestToken,
    };
