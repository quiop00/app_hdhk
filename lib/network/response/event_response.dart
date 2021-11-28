import 'package:app_chua/model/event/event.dart';
import 'package:json_annotation/json_annotation.dart';
part 'event_response.g.dart';

@JsonSerializable()
class EventResponse {
  late int current_page;
  late List<Event> data;
  EventResponse();
  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EventResponseToJson(this);
}
