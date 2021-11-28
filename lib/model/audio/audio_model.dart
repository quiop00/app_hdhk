import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/resource/resource_model.dart';

class AudioModel extends ResourceModel {
  AudioModel();
  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel()
    ..id = json['id'] as int
    ..author = json["author"] as String
    ..title = json['title'] as String
    ..url = json['url'] as String
    ..place = json['place'] as String
    ..description = json['description'] as String
    ..bookmark = json['bookmark'] as bool
    ..type = ResourceType.AUDIO;
}
