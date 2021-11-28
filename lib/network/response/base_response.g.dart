// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse()
    ..success = json['success'] as bool
    ..code = json['code'] as int
    ..redirect_to = json['redirect_to'] as String
    ..message = json['message'] as String
    ..redirect = json['redirect'] as String
    ..data = EventResponse.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'redirect_to': instance.redirect_to,
      'message': instance.message,
      'redirect': instance.redirect,
      'data': instance.data,
    };
