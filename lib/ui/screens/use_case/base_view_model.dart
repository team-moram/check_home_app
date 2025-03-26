import 'package:flutter/material.dart';

import '../../../main.dart';

class BaseViewModel with ChangeNotifier {
  bool _disposed = false;
  bool _isLoading = false;
  bool _isWidgetLoading = false;

  // 로그인 상태
  bool _isLogin = false;

  bool isLoading() {
    return _isLoading;
  }

  void setLoading(bool isLoading) {
    if (_isLoading != isLoading) {
      _isLoading = isLoading;
      logger.d('setLoading() isLoading : $_isLoading');
      notifyListeners();
    }
  }

  bool isWidgetLoading() {
    return _isWidgetLoading;
  }

  void setWidgetLoading(bool isWidgetLoading) {
    if (_isWidgetLoading != isWidgetLoading) {
      _isWidgetLoading = isWidgetLoading;
      logger.d('setWidgetLoading() widgetIsLoading : $_isWidgetLoading');
      notifyListeners();
    }
  }



  bool isLogin() {
    return _isLogin;
  }

  void setLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (_disposed) {
      return;
    }
    super.notifyListeners();
  }
}
