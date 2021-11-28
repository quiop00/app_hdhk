// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventResponse _$EventResponseFromJson(Map<String, dynamic> json) {
  return EventResponse()
    ..current_page = json['current_page'] as int
    ..data = (json['data'] as List<dynamic>)
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$EventResponseToJson(EventResponse instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
    };
