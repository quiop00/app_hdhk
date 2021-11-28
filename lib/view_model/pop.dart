import 'package:app_chua/provider/view_state_model.dart';

class Pop extends ViewStateModel {
  late Function onBack;
  setOnBack(onBack) {
    this.onBack = onBack;
    notifyListeners();
  }
}
