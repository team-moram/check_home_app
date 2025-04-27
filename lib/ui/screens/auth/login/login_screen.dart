import 'package:check_home_app/config/t_key.dart';
import 'package:check_home_app/config/theme/colors.dart';
import 'package:check_home_app/constant.dart';
import 'package:check_home_app/ui/common/custom_bar.dart';
import 'package:check_home_app/ui/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/auth/term_modal_widget.dart';

/// 로그인 화면
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorFFFFFF,
      appBar: customBar(null, false, context),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: 393.w,
          height: MediaQuery.of(context).size.height - 54.h,
          color: colorFFFFFF,
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 224.w, height: 171.w, color: Colors.grey),
              Padding(padding: EdgeInsets.only(bottom: 24.h)),
              Column(
                children: [
                  SizedBox(
                    width: 270.w,
                    child: Text(
                      TKeys.loginComment1.translate(context),
                      style: TextStyle(
                        color: color000000,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textScaler: TextScaler.noScaling,
                    ),
                  ),
                  SizedBox(
                    width: 270.w,
                    child: Text(
                      TKeys.loginComment2.translate(context),
                      style: TextStyle(
                        color: color000000,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textScaler: TextScaler.noScaling,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 32.h)),

                  /// Kakao 로그인
                  SizedBox(
                    width: 353.w,
                    height: 50.h,
                    child: InkWell(
                      onTap: () {},
                      onDoubleTap: () {},
                      child: customImageButton(
                        8.r,
                        TKeys.loginKakao.translate(context),
                        colorFEE500,
                        color212121,
                        FontWeight.w600,
                        15.sp,
                        "assets/images/ic_kakao_logo.png",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16.h)),

                  /// Google 로그인
                  SizedBox(
                    width: 353.w,
                    height: 50.h,
                    child: InkWell(
                      onTap: () {},
                      onDoubleTap: () {},
                      child: customImageButton(
                        8.r,
                        TKeys.loginKakao.translate(context),
                        colorF5F5F5,
                        color212121,
                        FontWeight.w600,
                        15.sp,
                        "assets/images/ic_google_logo.png",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16.h)),

                  /// 이메일 로그인
                  SizedBox(
                    width: 353.w,
                    height: 50.h,
                    child: InkWell(
                      onTap: () {
                        // 이메일 로그인 화면 으로 이동
                        context.pushNamed(Constant.routeLoginWithEmail);
                      },
                      onDoubleTap: () {},
                      child: customLineButton(
                        8.r,
                        TKeys.loginEmail.translate(context),
                        colorFFFFFF,
                        colorEAEAEA,
                        color212121,
                        FontWeight.w600,
                        15.sp,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 80.h)),

                  /// 회원 가입 화면 으로 이동
                  InkWell(
                    onTap: () {
                      // 회원 가입 이용 약관 모달
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        barrierColor: color000000BF,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.r),
                          ),
                        ),
                        builder: (context) => TermModalWidget(),
                      );
                    },
                    onDoubleTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth: 125.w,
                            maxWidth: 250.w,
                          ),
                          child: Text(
                            TKeys.askSignUpText.translate(context),
                            style: TextStyle(
                              color: color9E9E9E,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textScaler: TextScaler.noScaling,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 8.w)),
                        Container(
                          constraints: BoxConstraints(
                            minWidth: 45.w,
                            maxWidth: 100.w,
                          ),
                          child: Text(
                            TKeys.join.translate(context),
                            style: TextStyle(
                              color: colorFC5E03,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textScaler: TextScaler.noScaling,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
