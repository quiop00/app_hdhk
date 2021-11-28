// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourcesResponse _$ResourcesResponseFromJson(Map<String, dynamic> json) {
  return ResourcesResponse()
    ..resources = (json['resources'] as List<dynamic>)
        .map((e) => ResourceModel.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$ResourcesResponseToJson(ResourcesResponse instance) =>
    <String, dynamic>{
      'resources': instance.resources,
    };
