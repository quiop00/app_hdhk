import 'package:app_chua/provider/view_state_list_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ViewStateRefreshListModel<T> extends ViewStateListModel<T> {
  static const int pageFirst = 0;
  static const int pageSize = 15;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;
  int _currentPage = pageFirst;
  Future<List<T>?> refresh({bool init = false}) async {
    try {
      _currentPage = pageFirst;
      var data = await loadData(page: _currentPage);
      if (data.isEmpty) {
        refreshController.refreshCompleted();
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        refreshController.refreshCompleted();
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        setIdle();
      }
      return data;
    } catch (e, s) {
      if (init) list.clear();
      refreshController.refreshFailed();
      setError(e, s);
      return null;
    }
  }

  Future<List<T>?> loadMore() async {
    try {
      var data = await loadData(page: ++_currentPage);
      if (data.isEmpty) {
        _currentPage--;
        refreshController.loadNoData();
      } else {
        onCompleted(data);
        list.addAll(data);
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        notifyListeners();
      }
      return data;
    } catch (e, s) {
      _currentPage--;
      refreshController.loadFailed();
      return null;
    }
  }

  Future<List<T>> loadData({int page});
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
