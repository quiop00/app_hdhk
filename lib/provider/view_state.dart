import 'package:app_chua/enums/view_state.dart';

class ViewStateError {
  ViewStateErrorType? _errorType;
  String message;
  ViewStateError(this._errorType, {required this.message}) {
    _errorType ??= ViewStateErrorType.defaultError;
  }
  ViewStateErrorType? get errorType => _errorType;
  get isDefaultError => _errorType == ViewStateErrorType.defaultError;
  get isNetworkError => _errorType == ViewStateErrorType.networkError;
  get isUnAuthorizedError => _errorType == ViewStateErrorType.unauthorizedError;
  @override
  String toString() {
    return 'View state error $errorType';
  }
}
