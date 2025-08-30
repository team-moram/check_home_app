import '../core/utils/localization.dart';

enum TKeys {
  ok,
  cancel,
  loginComment1,
  loginComment2,
  loginKakao,
  loginGoogle,
  loginEmail,
  askSignUpText,
  join,
  loginToEmail,
  inputEmailComment,
  inputPasswordComment,
  emailLogin,
  resetPassword,
  joinMembership,
  emailEmptyError,
  passwordEmptyError,
  emailValidError,
  passwordValidError,
  termComment,
  agreeAll,
  ageAgree,
  useAgree,
  personalAgree,
  agreeToStart,
  joinTitle,
  email,
  inputEmail,
  emailValid,
  password,
  inputPassword,
  passwordValid,
  checkPassword,
  samePassword,
  nickname,
  nicknameValid,
  nicknameError,
  usableNickname,
  nicknameNull,
  checkNickname
}

//TKeys
extension TKeysExtention on TKeys {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return Localization.of(context).translate(_string) ?? '';
  }
}
