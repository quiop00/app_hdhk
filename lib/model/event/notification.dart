import 'package:json_annotation/json_annotation.dart';
part 'notification.g.dart';

@JsonSerializable()
class Notification {
  late String time;
  late String date;
  Notification();
  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
