import 'package:app_chua/enums/monk_view_type.dart';
import 'package:app_chua/model/monk/monk_model.dart';
import 'package:app_chua/provider/view_state_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MonkViewModel extends ViewStateModel {
  MonkModel monkModel = MonkModel();
  MonkViewType viewType = MonkViewType.information;
  changeType(type) {
    viewType = type;
    notifyListeners();
  }

  getInfo(id) async {
    monkModel = MonkModel();
    notifyListeners();
  }
}
