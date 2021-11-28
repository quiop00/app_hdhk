// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scripture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScriptureModel _$ScriptureModelFromJson(Map<String, dynamic> json) {
  return ScriptureModel()
    ..id = json['id'] as String
    ..authorId = json['authorId'] as String
    ..author = json['author'] as String
    ..createdAt = json['createdAt'] as String
    ..bookmark = json['bookmark'] as bool
    ..imagePath = json['imagePath'] as String
    ..title = json['title'] as String
    ..content = json['content'] as String
    ..tags = (json['tags'] as List<dynamic>).map((e) => e as String).toList();
}

Map<String, dynamic> _$ScriptureModelToJson(ScriptureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'author': instance.author,
      'createdAt': instance.createdAt,
      'bookmark': instance.bookmark,
      'imagePath': instance.imagePath,
      'title': instance.title,
      'content': instance.content,
      'tags': instance.tags,
    };
