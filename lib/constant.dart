class Constant {
  // navigation path
  static const routeSplashPath = "/splash";
  static const routeRootPath = "/home";
  static const routeMyInfoPath = "myInfo";
  static const routeMorePath = "/more";
  static const routeLoginPath = "/login";
  static const routeJoinPath = "join";
  static const routeLoginWithEmailPath = "email";

  // navigation name
  static const routeSplash = "splash";
  static const routeRoot = "home";
  static const routeMyInfo = "myInfo";
  static const routeMore = "more";
  static const routeLogin = "login";
  static const routeJoin = "join";
  static const routeLoginWithEmail = "email";

  // login
  static const emailRegexStr =
      "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+";
  static const passwordRegexStr =
      r"^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*#?&]).{7,15}.$";
}