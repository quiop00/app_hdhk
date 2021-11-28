import 'package:app_chua/provider/view_state_model.dart';

abstract class ViewStateListModel<T> extends ViewStateModel {
  List<T> list = [];

  ViewStateListModel() : super();
  initData() async {
    setBusy();
    await refresh(init: true);
  }

  Future<List<T>> loadData();
  onCompleted(List<T> data) {}
  refresh({bool init = false}) async {
    try {
      List<T> data = await loadData();
      if (data.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        list.clear();
        list.addAll(data);
        setIdle();
      }
    } catch (e, s) {
      if (init) list.clear();
      setError(e, s);
    }
  }
}
