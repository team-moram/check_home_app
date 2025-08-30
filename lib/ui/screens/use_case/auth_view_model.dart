import 'base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  // 이메일 로그인 상태 관리
  bool _emailInput = false;
  bool get emailInput => _emailInput;
  bool _passwordInput = false;
  bool get passwordInput => _passwordInput;

  // 회원가입 상태 관리
  bool _joinEmailInput = false;
  bool get joinEmailInput => _joinEmailInput;
  bool _joinPasswordInput = false;
  bool get joinPasswordInput => _joinPasswordInput;
  bool _joinPasswordCheckInput = false;
  bool get joinPasswordCheckInput => _joinPasswordCheckInput;
  bool _joinNicknameInput = false;
  bool get joinNicknameInput => _joinNicknameInput;

  // 이메일 로그인 - 이메일 입력
  emailInputStatus(bool status) {
    _emailInput = status;
    notifyListeners();
  }

  // 이메일 로그인 - 비밀번호 입력
  passwordInputStatus(bool status) {
    _passwordInput = status;
    notifyListeners();
  }

  // 회원가입 - 이메일 입력
  joinEmailInputStatus(bool status) {
    _joinEmailInput = status;
    notifyListeners();
  }

  // 회원가입 - 비밀번호 입력
  joinPasswordInputStatus(bool status) {
    _joinPasswordInput = status;
    notifyListeners();
  }

  // 회원가입 - 비밀번호 확인 입력
  joinPasswordCheckInputStatus(bool status) {
    _joinPasswordCheckInput = status;
    notifyListeners();
  }

  // 회원가입 - 닉네임 입력
  joinNicknameInputStatus(bool status) {
    _joinNicknameInput = status;
    notifyListeners();
  }
}
