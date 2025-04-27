import 'package:check_home_app/config/t_key.dart';
import 'package:check_home_app/main.dart';
import 'package:check_home_app/ui/common/custom_button.dart';
import 'package:check_home_app/ui/widgets/auth/term_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/colors.dart';
import '../../../../constant.dart';
import '../../../common/custom_bar.dart';
import '../../use_case/auth_view_model.dart';

/// 이메일 로 로그인 화면
class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginWithEmail();
  }
}

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final email = TextEditingController(); // email 입력 저장
  final password = TextEditingController(); // pw 입력 저장
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: true);

    bool validationResult =
        authViewModel.emailInput && authViewModel.passwordInput;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorFFFFFF,
        appBar: customBar(null, true, context),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 54.h,
            padding: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w),
            child: Column(
              children: [
                Container(
                  width: 353.w,
                  padding: EdgeInsets.only(bottom: 32.h),
                  child: Text(
                    TKeys.loginToEmail.translate(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      color: color151515,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                /// email 입력
                SizedBox(
                  width: 353.w,
                  child: TextFormField(
                    controller: email,
                    style: TextStyle(
                      fontSize: 15.w,
                      color: color212121,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: TKeys.inputEmailComment.translate(context),
                      hintStyle: TextStyle(
                        fontSize: 15.w,
                        color: color9E9E9E,
                        fontWeight: FontWeight.w400,
                      ),
                      errorStyle: TextStyle(
                        fontSize: 12.w,
                        color: colorDE3412,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w, color: colorDE3412),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w, color: colorDE3412),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w, color: color212121),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w, color: color9E9E9E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w),
                      ),
                      suffixIcon:
                          email.text != ''
                              ? ExcludeFocus(
                                child: IconButton(
                                  onPressed: () {
                                    email.clear();
                                  },
                                  icon: Image.asset(
                                    'assets/images/ic_delete.png',
                                    width: 16.w,
                                  ),
                                ),
                              )
                              : null,
                    ),
                    cursorColor: color212121,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (id) {
                      if (id!.isEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          authViewModel.emailInputStatus(false);
                        });
                        return TKeys.emailEmptyError.translate(context);
                      }
                      if (!RegExp(
                        Constant.emailRegexStr,
                      ).hasMatch(email.text)) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          authViewModel.emailInputStatus(false);
                        });
                        return TKeys.emailValidError.translate(context);
                      }
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        authViewModel.emailInputStatus(true);
                      });
                      return null;
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 24.h)),

                /// password 입력
                SizedBox(
                  width: 353.w,
                  child: TextFormField(
                    controller: password,
                    obscureText: obscureText,
                    style: TextStyle(
                      fontSize: 15.w,
                      color: color212121,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: TKeys.inputPasswordComment.translate(context),
                      hintStyle: TextStyle(
                        fontSize: 15.w,
                        color: color9E9E9E,
                        fontWeight: FontWeight.w400,
                      ),
                      errorStyle: TextStyle(
                        fontSize: 12.w,
                        color: colorDE3412,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w, color: colorDE3412),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w, color: colorDE3412),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w, color: color212121),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w, color: color9E9E9E),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(width: 1.w),
                      ),
                      suffixIcon: ExcludeFocus(
                        child: IconButton(
                          icon:
                              obscureText
                                  ? Image.asset(
                                    'assets/images/ic_visibility.png',
                                    width: 20.w,
                                    height: 20.w,
                                  )
                                  : Image.asset(
                                    'assets/images/ic_visibility_off.png',
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    cursorColor: color212121,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (pw) {
                      if (pw!.isEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          authViewModel.passwordInputStatus(false);
                        });
                        return TKeys.passwordEmptyError.translate(context);
                      }
                      if (!RegExp(Constant.passwordRegexStr).hasMatch(pw)) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          authViewModel.passwordInputStatus(false);
                        });
                        return TKeys.passwordValidError.translate(context);
                      }
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        authViewModel.passwordInputStatus(true);
                      });
                      return null;
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 32.h)),

                /// 로그인 버튼
                InkWell(
                  onTap:
                      validationResult
                          ? () {
                            // 홈 화면 으로 이동
                            logger.d("message");
                            // context.pushNamed(Constant.routeMore);
                          }
                          : null,
                  onDoubleTap: () {},
                  child: SizedBox(
                    width: 353.w,
                    height: 52.w,
                    child: customButton(
                      8.r,
                      TKeys.emailLogin.translate(context),
                      validationResult ? colorFC5E03 : colorEAEAEA,
                      validationResult ? colorFFFFFF : colorBDBDBD,
                      FontWeight.w600,
                      15.sp,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 24.h)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //  비밀 번호 재설정 버튼
                    InkWell(
                      onTap: () {},
                      onDoubleTap: () {},
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: 70.w,
                          maxWidth: 120.w,
                        ),
                        child: Text(
                          TKeys.resetPassword.translate(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.noScaling,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: color9E9E9E,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1.w,
                      height: 14.h,
                      color: colorBDBDBD,
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 17.w),
                    ),
                    // 회원 가입 버튼
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
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: 70.w,
                          maxWidth: 120.w,
                        ),
                        child: Text(
                          TKeys.joinMembership.translate(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textScaler: TextScaler.noScaling,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: color9E9E9E,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      authViewModel.emailInputStatus(false);
      authViewModel.passwordInputStatus(false);
    });
  }
}
