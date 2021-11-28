import 'package:app_chua/model/resource/resource_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'resources_response.g.dart';

@JsonSerializable()
class ResourcesResponse {
  late List<ResourceModel> resources;
  ResourcesResponse();
  factory ResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourcesResponseToJson(this);
}
