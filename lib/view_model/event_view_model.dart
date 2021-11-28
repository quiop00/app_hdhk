import 'package:app_chua/model/event/event.dart';
import 'package:app_chua/model/event/slider_event.dart';
import 'package:app_chua/model/filter.dart';
import 'package:app_chua/network/api.dart';
import 'package:app_chua/network/response/event_response.dart';
import 'package:app_chua/provider/view_state_model.dart';
import 'dart:core';
import 'package:app_chua/config/data.dart' as data;
import 'package:app_chua/services/locator.dart';

class EventViewModel extends ViewStateModel {
  bool isLoading = false;
  bool isLoadingSlider = false;
  List<SliderEvent> pagodas = [];
  late EventResponse eventRes;
  late List<Event> relatedEvent;
  List<Filter> filters = [];
  int currentIndex = 0;
  final api = locator<Api>();
  fetchEvents({idPagoda, idCategory, page = 1}) async {
    isLoadingSlider = true;
    isLoading = true;
    await api.client!.getPagodas().then((value) => this.pagodas = value);
    isLoadingSlider = false;
    await api.client!
        .getEvents({'page': page}).then((value) => this.eventRes = value);
    await api.client!.getFilterEvent().then((value) => this.filters = value);
    isLoading = false;
    notifyListeners();
  }

  loadEventByPagoda({index, page = 1}) async {
    isLoading = true;
    var pagodaId = pagodas[index].id;
    await api.client!.getEvents({'pagoda_id': pagodaId, 'page': page}).then(
        (value) => this.eventRes = value);
    isLoading = false;
    currentIndex = index;
    notifyListeners();
  }

  loadEventByCategory({categoryId, page = 1}) async {
    isLoading = true;
    var pagodaId = pagodas[currentIndex].id;
    await api.client!.getEvents({'category_id': categoryId, 'page': page}).then(
        (value) => this.eventRes = value);
    isLoading = false;
    notifyListeners();
  }

  getRelatedEvents({eventId}) async {
    isLoading = true;
    relatedEvent = [];
    await api.client!
        .getRelatedEvent(eventId)
        .then((value) => relatedEvent = value.data);
    print(relatedEvent.length);
    isLoading = false;
    notifyListeners();
  }

  setNotify(idEvent, data) async {
    notifyListeners();
  }

  removeNotify(idEvent) async {
    //events.removeWhere((element) => element.id == idEvent);
    notifyListeners();
  }
}
