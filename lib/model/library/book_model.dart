import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  late String author;
  late String id;
  late int authorId;
  late bool bookmark;
  late String imagePath;
  late String title;
  late String content;
  late String description;
  late List<String> tags;
  BookModel();
  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
