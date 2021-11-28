// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..introduction =
        (json['introduction'] == null ? '' : json['introduction'] as String)
    ..gallery = (json['gallery'] == null ? '' : json['gallery'] as String)
    ..image = json['image'] as String;
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'introduction': instance.introduction,
      'gallery': instance.gallery,
      'image': instance.image,
    };
