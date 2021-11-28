import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
part 'author.g.dart';

@JsonSerializable()
class Author {
  late int id;
  late String name;
  late String type;
  late String? introduction;
  late String? gallery;
  late String image;
  Author();
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
