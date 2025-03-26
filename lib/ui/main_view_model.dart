import 'package:check_home_app/ui/screens/use_case/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../config/t_key.dart';
import '../main.dart';

class MainViewModel extends BaseViewModel {
  static const storage = FlutterSecureStorage();

  String _signStatus = '';

  String get signStatus => _signStatus;

  DateTime? currentBackPressTime;

  // 선택한 운동
  String _chosenExercise = '';

  String get chosenExercise => _chosenExercise;

  /// 하단 뒤로 가기 버튼 더블 클릭 시 앱 종료
  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      final msg = '더블뒤로가기이이이';
      final snackBar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return Future.value(false);
    }
    return Future.value(true);
  }

  // /// 토큰 재발급 체크
  // Future<Object> checkTokenExpiration(AuthViewModel authViewModel) async {
  //   logger.i('autoLogin()');
  //
  //   const storage = FlutterSecureStorage();
  //   String? token = "";
  //   String? tokenDate = "";
  //
  //   token = await storage.read(key: Constant.storageTokenKey);
  //   tokenDate = await storage.read(key: Constant.storageTokenExpiredDtKey);
  //   String storageRefreshToken =
  //       await storage.read(key: Constant.storageRefreshTokenKey) ?? "";
  //   var formatDate = DateTime.now().millisecondsSinceEpoch.toString();
  //   var timeDiff = 0;
  //   if (tokenDate != null) {
  //     var tokenDateInt = int.parse(tokenDate);
  //     var formatDateInt = int.parse(formatDate);
  //     timeDiff = tokenDateInt - formatDateInt;
  //   }
  //   logger.d(
  //       'mainViewModel checkTokenExpiration() token: $token tokenExpiredDt: $tokenDate nowDate: $formatDate timeDiff: $timeDiff');
  //   // token 유효성 검사에 따른 화면 이동 및 api 호출
  //   if (token == null) {
  //     // 토큰이 없는 경우
  //     return true;
  //   } else {
  //     // 토큰 만료 시
  //     if (timeDiff <= 0) {
  //       TokenRefreshReq req = TokenRefreshReq(storageRefreshToken);
  //       await authViewModel.tokenRefresh(req).then((value) {
  //         logger.d('authViewModel.tokenRefresh() result $value');
  //         if (value == true) {
  //           return true;
  //         } else {
  //           return value.toString();
  //         }
  //       });
  //     } else {
  //       // 재발급이 필요 없는 경우
  //       return true;
  //     }
  //     return true;
  //   }
  // }

  /// 상태 변경
  inputLoginStatus(String status) {
    _signStatus = status;
    notifyListeners();
  }

  /// 로그 아웃
  void logout() async {
    logger.d('logout()');

    // await storage.delete(key: Constant.storageSignInStatus);
    // await storage.delete(key: Constant.storageTokenKey);
    // await storage.delete(key: Constant.storageTokenExpiredDtKey);
    // await storage.delete(key: Constant.storageRefreshTokenKey);
    // await storage.delete(key: Constant.storageRefreshTokenExpiredDtKey);
    inputLoginStatus('');
  }
}
