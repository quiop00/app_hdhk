// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poetry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoetryModel _$PoetryModelFromJson(Map<String, dynamic> json) {
  return PoetryModel()
    ..author = json['author'] as String
    ..id = json['id'] as String
    ..authorId = json['authorId'] as String
    ..bookmark = json['bookmark'] as bool
    ..imagePath = json['imagePath'] as String
    ..title = json['title'] as String
    ..content = json['content'] as String
    ..tags = (json['tags'] as List<dynamic>).map((e) => e as String).toList();
}

Map<String, dynamic> _$PoetryModelToJson(PoetryModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'id': instance.id,
      'authorId': instance.authorId,
      'bookmark': instance.bookmark,
      'imagePath': instance.imagePath,
      'title': instance.title,
      'content': instance.content,
      'tags': instance.tags,
    };
