// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagoda.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagoda _$PagodaFromJson(Map<String, dynamic> json) {
  return Pagoda()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..image = (json['image'] == null ? '' : json['image'] as String)
    ..date = (json['date'] == null ? '' : json['date'] as String);
}

Map<String, dynamic> _$PagodaToJson(Pagoda instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'date': instance.date,
      'character_id': instance.character_id,
    };
