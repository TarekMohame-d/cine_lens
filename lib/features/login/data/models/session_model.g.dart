// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      success: json['success'] as bool?,
      failure: json['failure'] as bool?,
      sessionId: json['session_id'] as String?,
      statusCode: (json['status_code'] as num?)?.toInt(),
      statusMessage: json['status_message'] as String?,
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'failure': instance.failure,
      'session_id': instance.sessionId,
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
