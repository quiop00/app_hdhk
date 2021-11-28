import 'package:app_chua/model/author/author.dart';
import 'package:app_chua/model/event/event.dart';
import 'package:app_chua/model/event/slider_event.dart';
import 'package:app_chua/model/exhibition/exhibition.dart';
import 'package:app_chua/model/filter.dart';
import 'package:app_chua/network/api.dart';
import 'package:app_chua/network/response/event_response.dart';
import 'package:app_chua/network/response/exhibition_response.dart';
import 'package:app_chua/provider/view_state_model.dart';
import 'dart:core';
import 'package:app_chua/config/data.dart' as data;
import 'package:app_chua/services/locator.dart';

class ExhibitionViewModel extends ViewStateModel {
  bool isLoading = false;
  bool isLoadingSlider = false;
  bool isLoadingAuthor = false;
  bool onFilterPage = false;
  int? selectedAuthor;
  Author? author;
  List<String> images = [];
  late ExhibitionResponse exhibitionRes;
  late ExhibitionResponse resultFilter;
  late List<Exhibition> relatedExhibition;
  List<Author> filters = [];
  int currentIndex = 0;
  final api = locator<Api>();
  fetchExhibition({type, page = 1}) async {
    isLoadingSlider = true;
    isLoading = true;
    await api.client!
        .getGalleriesByType(type)
        .then((value) => this.images = value);
    isLoadingSlider = false;
    await api.client!.getExhibition({'page': page}).then(
        (value) => this.exhibitionRes = value);

    isLoading = false;
    notifyListeners();
  }

  getRelatedExhibition({exhibitionId, page = 1}) async {
    isLoading = true;
    relatedExhibition = [];
    await api.client!
        .getRelatedExhibition(exhibitionId)
        .then((value) => relatedExhibition = value.data);
    isLoading = false;
    notifyListeners();
  }

  setSelectedAuthor(id) {
    selectedAuthor = id;
    notifyListeners();
  }

  onChangeCarousel(index) {
    currentIndex = index;
    notifyListeners();
  }

  loadExhibitionByAuthor({authorId, page = 1}) async {
    isLoading = true;
    author = this.filters.firstWhere((element) => element.id == authorId);
    await api.client!
        .getExhibition({'character_id': authorId, 'page': page}).then(
            (value) => this.resultFilter = value);
    isLoading = false;
    notifyListeners();
  }

  loadExhibitionAuthor() async {
    isLoadingAuthor = true;
    await api.client!
        .getExhibitionAuthor()
        .then((value) => this.filters = value);
    isLoadingAuthor = false;
    notifyListeners();
  }

  setOnFilterPage(isFilter) {
    onFilterPage = isFilter;
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
