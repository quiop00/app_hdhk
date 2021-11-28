import 'package:app_chua/model/resource/resource_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:app_chua/config/data.dart' as data;
part 'playlist.g.dart';

@JsonSerializable()
class PlayList {
  late String id;
  late String name;
  late String date;
  late bool bookmark;
  late List<ResourceModel> items;
  PlayList();
  factory PlayList.fromJson(Map<String, dynamic> json) =>
      _$PlayListFromJson(json);
  Map<String, dynamic> toJson() => _$PlayListToJson(this);
  static getPlayLists() {
    List<PlayList> playLists = [];
    playLists = data.playList.map((e) => PlayList.fromJson(e)).toList();
    return playLists;
  }
}
