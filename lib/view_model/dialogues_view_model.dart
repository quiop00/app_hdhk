import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:app_chua/provider/view_state_model.dart';
import 'package:app_chua/config/data.dart' as data;

class ListDialogueViewModel extends ViewStateModel {
  bool isLoading = false;
  List<ResourceModel>? audio = [];
  var selected = -3;
  fetchAudio() async {
    isLoading = true;
    await Future.delayed(Duration(milliseconds: 5000));
    print(data.resource["resource"]);
    audio = data.resource["resource"] == null
        ? []
        : data.resource["resource"]!
            .where((element) => element["type"] == ResourceType.AUDIO)
            .map((e) => ResourceModel.fromJson(e))
            .toList();
    print(audio!.length);
    isLoading = false;
    notifyListeners();
  }

  fetchVideo() async {
    isLoading = true;
    await Future.delayed(Duration(milliseconds: 5000));
    audio = data.resource["resource"]!
        .where((element) => element["type"] == ResourceType.VIDEO)
        .map((e) => ResourceModel.fromJson(e))
        .toList();
    isLoading = false;
    notifyListeners();
  }

  play(index) {
    selected = index;
    notifyListeners();
  }
}
