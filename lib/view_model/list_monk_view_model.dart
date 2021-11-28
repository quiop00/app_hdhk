import 'package:app_chua/model/monk/monk.dart';
import 'package:app_chua/model/monk/monk_model.dart';
import 'package:app_chua/provider/view_state_model.dart';
import 'package:flutter/material.dart';
import 'package:app_chua/config/data.dart' as data;

class ListMonkViewModel extends ViewStateModel {
  List<Monk> monks = [];
  bool isLoading = false;
  fetchData() async {
    isLoading = true;
    monks = data.monks["monks"] == null
        ? []
        : data.monks["monks"]!.map((e) => Monk.fromJson(e)).toList();
    await Future.delayed(Duration(milliseconds: 5000));
    isLoading = false;
    notifyListeners();
  }
}
