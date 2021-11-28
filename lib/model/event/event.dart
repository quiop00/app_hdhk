import 'package:app_chua/model/author/author.dart';
import 'package:app_chua/model/category/category.dart';
import 'package:app_chua/model/event/notification.dart';
import 'package:app_chua/model/image.dart';
import 'package:app_chua/model/pagoda/pagoda.dart';
import 'package:json_annotation/json_annotation.dart';
part 'event.g.dart';

@JsonSerializable()
class Event {
  late int id;
  late String title;
  late String date;
  late String content;
  late Category category;
  late Pagoda pagoda;
  late Author author;
  late String image;
  late bool? isSetNotify;
  Notification? notification;
  Event();
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
