import 'package:app_chua/enums/resource_type.dart';

class ResourceModel {
  ResourceType? type;
  int? id;
  String? title;
  String? url;
  String? place;
  String? description;
  bool? bookmark;
  String? author;
  int? currentTrackIndex;
  ResourceModel();
  factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..url = json['url'] as String
    ..place = json['place'] as String
    ..description = json['description'] as String
    ..bookmark = json['bookmark'] ?? false
    ..author = json["author"] as String
    ..type = json['type'] as ResourceType;
  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": this.id,
        "title": this.title,
        "place": this.place,
      };
}
