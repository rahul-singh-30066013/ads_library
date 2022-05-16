import 'package:flutter/cupertino.dart';

enum ViewState { none, loading, success, error }

class BaseViewModel extends ADBaseViewModel {
  ViewState _state = ViewState.none;

  ViewState get state => _state;

  void updateState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}

class ADBaseViewModel with ChangeNotifier {
  String error = '';
  bool disposed = false;

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}