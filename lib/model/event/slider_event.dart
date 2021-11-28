import 'package:app_chua/model/event/event.dart';
import 'package:json_annotation/json_annotation.dart';
part 'slider_event.g.dart';

@JsonSerializable()
class SliderEvent {
  late int id;
  late String name;
  late String image;
  SliderEvent();
  factory SliderEvent.fromJson(Map<String, dynamic> json) =>
      _$SliderEventFromJson(json);
  Map<String, dynamic> toJson() => _$SliderEventToJson(this);
}
