import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/resource/resource_model.dart';

class VideoModel extends ResourceModel {
  VideoModel();
  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..url = json['url'] as String
    ..place = json['place'] as String
    ..description = json['description'] as String
    ..bookmark = json['bookmark'] as bool
    ..type = ResourceType.VIDEO;
}
