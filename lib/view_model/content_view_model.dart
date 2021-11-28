import 'dart:math';

import 'package:app_chua/model/content.dart';
import 'package:app_chua/provider/view_state_model.dart';
import 'package:app_chua/config/data.dart' as data;

class ContentViewModel extends ViewStateModel {
  List<Content> contents = [];
  String? author;
  int? index;
  late String pathAudio;
  fetchContent() async {
    setBusy();
    contents = data.contents.map((e) => Content.fromJson(e)).toList();
    List<String> audios = data.assetAudios;
    final _random = new Random();
    pathAudio = audios[_random.nextInt(audios.length)];
    print(pathAudio);
    author = contents[0].author;
    index = 0;
    setIdle();
    notifyListeners();
  }

  onChange(index) {
    author = contents[index].author;
    this.index = index;
    notifyListeners();
  }
}
