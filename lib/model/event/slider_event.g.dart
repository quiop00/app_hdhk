// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderEvent _$SliderEventFromJson(Map<String, dynamic> json) {
  return SliderEvent()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..image = json['image'] as String;
}

Map<String, dynamic> _$SliderEventToJson(SliderEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
