import 'base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  // 이메일 로그인 상태 관리
  bool _emailInput = false;
  bool get emailInput => _emailInput;
  bool _passwordInput = false;
  bool get passwordInput => _passwordInput;

  emailInputStatus(bool status) {
    _emailInput = status;
    notifyListeners();
  }

  passwordInputStatus(bool status) {
    _passwordInput = status;
    notifyListeners();
  }
}
