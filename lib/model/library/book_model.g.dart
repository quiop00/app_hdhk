// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return BookModel()
    ..author = json['author'] as String
    ..id = json['id'] as String
    ..authorId = json['authorId'] as int
    ..bookmark = json['bookmark'] as bool
    ..imagePath = json['imagePath'] as String
    ..title = json['title'] as String
    ..content = json['content'] as String
    ..description = json['description'] as String
    ..tags = (json['tags'] as List<dynamic>).map((e) => e as String).toList();
}

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'author': instance.author,
      'id': instance.id,
      'authorId': instance.authorId,
      'bookmark': instance.bookmark,
      'imagePath': instance.imagePath,
      'title': instance.title,
      'content': instance.content,
      'description': instance.description,
      'tags': instance.tags,
    };
