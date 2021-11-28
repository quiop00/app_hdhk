import 'package:app_chua/enums/view_state.dart';
import 'package:app_chua/provider/view_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ViewStateModel with ChangeNotifier {
  bool _dispose = false;
  late ViewState _viewState;
  ViewStateError? _viewStateError;
  ViewStateModel({ViewState viewState = ViewState.idle})
      : _viewState = viewState;
  ViewState get viewState => _viewState;
  ViewStateError? get viewStateError => _viewStateError;
  set viewState(ViewState viewState) {
    _viewStateError = null;
    _viewState = viewState;
    notifyListeners();
  }

  bool get isBusy => viewState == ViewState.busy;
  bool get isIdle => viewState == ViewState.idle;
  bool get isEmpty => viewState == ViewState.empty;
  bool get isError => viewState == ViewState.error;

  void setIdle() {
    viewState = ViewState.idle;
  }

  void setBusy() {
    viewState = ViewState.busy;
  }

  void setEmpty() {
    viewState = ViewState.empty;
  }

  void setError(e, stackTrace, {String? message}) {
    ViewStateErrorType errorType = ViewStateErrorType.defaultError;
    if (e is DioError) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        errorType = ViewStateErrorType.networkError;
        message = e.error;
      } else if (e.type == DioErrorType.response) {
        message = e.error;
      } else if (e.type == DioErrorType.cancel) {
        message = e.error;
      }
    }
    viewState = ViewState.error;
    _viewStateError = ViewStateError(errorType, message: message ?? "");
    onError(viewStateError!);
  }

  void onError(ViewStateError viewStateError) {}
  showErrorMessage(context, {String? message}) {
    if (viewStateError != null || message != null) {
      message ??= viewStateError!.message;
    }
    Future.microtask(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message!),
      ));
    });
  }

  @override
  void notifyListeners() {
    if (!_dispose) super.notifyListeners();
  }

  @override
  void dispose() {
    _dispose = true;
    super.dispose();
  }
}
