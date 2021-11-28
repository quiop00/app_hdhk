import 'package:json_annotation/json_annotation.dart';
part 'pagoda.g.dart';

@JsonSerializable()
class Pagoda {
  late int id;
  late String name;
  String? description;
  late String image;
  String? date;
  late String character_id;
  Pagoda();
  factory Pagoda.fromJson(Map<String, dynamic> json) => _$PagodaFromJson(json);
  Map<String, dynamic> toJson() => _$PagodaToJson(this);
}
