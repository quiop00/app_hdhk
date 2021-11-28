import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'scripture_model.g.dart';

@JsonSerializable()
class ScriptureModel {
  late String id;
  late String authorId;
  late String author;
  late String createdAt;
  late bool bookmark;
  late String imagePath;
  late String title;
  late String content;
  late List<String> tags;
  ScriptureModel();
  factory ScriptureModel.fromJson(Map<String, dynamic> json) =>
      _$ScriptureModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScriptureModelToJson(this);
}
