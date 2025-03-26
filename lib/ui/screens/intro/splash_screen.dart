import 'dart:io';

import 'package:check_home_app/config/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import '../../../main.dart';
import '../../main_view_model.dart';
import '../use_case/auth_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String os = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 135.w,
              child: Icon(Icons.stacked_line_chart)
            ),
          ),
          Positioned(
            bottom: 36.h,
            child: SizedBox(
              width: 230.w,
              child: Text(
                "어쩌고저쩌고",
                style: TextStyle(color: colorFFFFFF, fontSize: 12.sp),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textScaler: TextScaler.noScaling,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      FlutterNativeSplash.remove();
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      final mainViewModel = Provider.of<MainViewModel>(context, listen: false);
      if (Platform.isAndroid) {
        os = 'AOS';
      } else if (Platform.isIOS) {
        os = 'IOS';
      } else {
        os = 'AOS';
      }
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      logger.d('initState() version $version');

      context.goNamed(Constant.routeRoot);

      //     authViewModel.versionCheck(os, version).then((value) {
      //       logger.d('authViewModel.versionCheck() result $value');
      //       if (value == true) {
      //         if (authViewModel.versionInfo?.update == true) {
      //           if (authViewModel.versionInfo?.force == true) {
      //             // 강제 이동
      //             showDialog(
      //                 context: context,
      //                 barrierDismissible: false,
      //                 builder: (BuildContext context) => CupertinoAlertDialog(
      //                       title: const Text('최신 버전 업데이트',
      //                           style: TextStyle(color: ColorStyle.color0d2c43)),
      //                       content: const Text('최신버전의 앱으로 업데이트를 위해 스토어로 이동합니다.',
      //                           style: TextStyle(color: ColorStyle.color0d2c43)),
      //                       actions: [
      //                         CupertinoDialogAction(
      //                           onPressed: () {
      //                             // 스토어 이동
      //                             goMarket().then((value) {
      //                               if (Platform.isIOS) {
      //                                 exit(0);
      //                               } else {
      //                                 SystemNavigator.pop();
      //                               }
      //                             });
      //                           },
      //                           child: Text(TKeys.ok.translate(context)),
      //                         ),
      //                       ],
      //                     ));
      //           } else {
      //             showDialog(
      //                 context: context,
      //                 barrierDismissible: false,
      //                 builder: (BuildContext context) => CupertinoAlertDialog(
      //                       title: const Text('최신 버전 업데이트',
      //                           style: TextStyle(color: ColorStyle.color0d2c43)),
      //                       content: const Text('최신버전의 앱으로 업데이트를 위해 스토어로 이동하시겠습니까?',
      //                           style: TextStyle(color: ColorStyle.color0d2c43)),
      //                       actions: [
      //                         CupertinoDialogAction(
      //                           onPressed: () {
      //                             // 스토어 이동
      //                             goMarket().then((value) {
      //                               if (Platform.isIOS) {
      //                                 exit(0);
      //                               } else {
      //                                 SystemNavigator.pop();
      //                               }
      //                             });
      //                           },
      //                           child: Text(TKeys.ok.translate(context)),
      //                         ),
      //                         CupertinoDialogAction(
      //                           onPressed: () {
      //                             // 토큰 체크 후 홈으로 이동
      //                             tokenCheck(mainViewModel, authViewModel);
      //                           },
      //                           child: Text(TKeys.cancel.translate(context)),
      //                         ),
      //                       ],
      //                     ));
      //           }
      //         } else {
      //           tokenCheck(mainViewModel, authViewModel);
      //         }
      //       } else {
      //         showDialog(
      //             context: context,
      //             builder: (BuildContext context) =>
      //                 confirmPopup(value.toString(), context: context));
      //       }
      //
      //       setState(() {});
      //     });
      //   });
      // }
      //
      // tokenCheck(MainViewModel mainViewModel, AuthViewModel authViewModel) {
      //   mainViewModel.checkTokenExpiration(authViewModel).then((value) {
      //     if (value == true) {
      //       context.goNamed(Constant.routeRoot);
      //     } else {
      //       if (value.toString().startsWith('440')) {
      //         mainViewModel.setLogin(false);
      //         mainViewModel.logout();
      //         context.goNamed(Constant.routeRoot);
      //       } else {
      //         showDialog(
      //             context: context,
      //             builder: (BuildContext context) =>
      //                 confirmPopup(value.toString(), context: context));
      //       }
      //     }
      //   });
      // }
      //
      // Future<void> goMarket() async {
      //   logger.d('goMarket()');
      //   final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
      //   String packageName = packageInfo.packageName;
      //   String appName = packageInfo.appName;
      //   logger.d('goMarket() packageName : $packageName, appName : $appName');
      //
      //   if (Platform.isAndroid) {
      //     // 안드로이드
      //     try {
      //       // await launchUrl(
      //       //     Uri.parse("market://details?id=$packageName"));
      //       await launchUrl(Uri.parse(
      //           " ${authViewModel.versionInfo?.url ?? 'market://details?id=com.sfull.forward.golf'}"));
      //     } catch (error) {
      //       // await launchUrl(
      //       //     Uri.parse("https://play.google.com/store/apps/details?id=$packageName"));
      //       await launchUrl(Uri.parse("${authViewModel.versionInfo?.url}"));
      //     }
      //   } else if (Platform.isIOS) {
      //     // IOS
      //     // await launchUrl(Uri.parse("https://apps.apple.com/kr/app/$appName/id$appName"));
      //     await launchUrl(Uri.parse("${authViewModel.versionInfo?.url}"));
      //   }
      // }
    });
  }
}
