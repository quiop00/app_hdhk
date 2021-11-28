import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'poetry_model.g.dart';

@JsonSerializable()
class PoetryModel {
  late String author;
  late String id;
  late String authorId;
  late bool bookmark;
  late String imagePath;
  late String title;
  late String content;
  late List<String> tags;
  PoetryModel();
  factory PoetryModel.fromJson(Map<String, dynamic> json) =>
      _$PoetryModelFromJson(json);
  Map<String, dynamic> toJson() => _$PoetryModelToJson(this);
}
