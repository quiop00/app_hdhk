import 'package:app_chua/network/response/event_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  late bool success;
  late int code;
  late String redirect_to;
  late String message;
  late String redirect;
  late EventResponse data;
  BaseResponse();
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
