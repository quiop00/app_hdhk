// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..date = json['date'] as String
    ..content = json['content'] as String
    ..image = json['image'] as String
    ..category = Category.fromJson(json['category'] as Map<String, dynamic>)
    ..pagoda = Pagoda.fromJson(json['pagoda'] as Map<String, dynamic>)
    ..author = Author.fromJson(json['author'] as Map<String, dynamic>)
    ..isSetNotify = json['isSetNotify'] as bool?
    ..notification = json['notification'] == null
        ? null
        : Notification.fromJson(json['notification'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'content': instance.content,
      'image': instance.image,
      'isSetNotify': instance.isSetNotify,
      'notification': instance.notification,
    };
