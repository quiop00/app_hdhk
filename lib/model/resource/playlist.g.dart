// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayList _$PlayListFromJson(Map<String, dynamic> json) {
  return PlayList()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..date = json['date'] as String
    ..bookmark = json['bookmark'] as bool
    ..items = (json['items'] as List<dynamic>)
        .map((e) => ResourceModel.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$PlayListToJson(PlayList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'bookmark': instance.bookmark,
      'items': instance.items,
    };
