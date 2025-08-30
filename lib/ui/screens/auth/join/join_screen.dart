import 'package:check_home_app/config/t_key.dart';
import 'package:check_home_app/ui/common/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/colors.dart';
import '../../../../constant.dart';
import '../../use_case/auth_view_model.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Join();
  }
}

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  final email = TextEditingController(); // email 입력 저장
  final password = TextEditingController(); // pw 입력 저장
  final passwordCheck = TextEditingController(); // passwordCheck 입력 저장
  final nickname = TextEditingController(); // nickname 입력 저장
  bool obscureText = true;
  bool obscureCheckText = true;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: true);

    bool validationResult =
        authViewModel.joinEmailInput &&
        authViewModel.joinPasswordInput &&
        authViewModel.joinPasswordCheckInput &&
        authViewModel.joinNicknameInput;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorFFFFFF,
        appBar: customBar(TKeys.joinTitle.translate(context), true, context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
            child: Column(children: [
              Container(
                width: 353.w,
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  TKeys.email.translate(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: color212121,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
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
                    hintText: TKeys.inputEmail.translate(context),
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
                        authViewModel.joinEmailInputStatus(false);
                      });
                      return TKeys.emailEmptyError.translate(context);
                    }
                    if (!RegExp(
                      Constant.emailRegexStr,
                    ).hasMatch(email.text)) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        authViewModel.joinEmailInputStatus(false);
                      });
                      return TKeys.emailValid.translate(context);
                    }
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      authViewModel.joinEmailInputStatus(true);
                    });
                    return null;
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 48.h)),
              Container(
                width: 353.w,
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  TKeys.password.translate(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: color212121,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
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
                    hintText: TKeys.inputPassword.translate(context),
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
                          'assets/images/ic_visibility_off.png',
                          width: 20.w,
                          height: 20.w,
                        )
                            : Image.asset(
                          'assets/images/ic_visibility.png',
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
                        authViewModel.joinPasswordInputStatus(false);
                      });
                      return TKeys.passwordEmptyError.translate(context);
                    }
                    if (!RegExp(Constant.passwordRegexStr).hasMatch(pw)) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        authViewModel.joinPasswordInputStatus(false);
                      });
                      return TKeys.passwordValid.translate(context);
                    }
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      authViewModel.joinPasswordInputStatus(true);
                    });
                    return null;
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 24.h)),
              /// password check 입력
              SizedBox(
                width: 353.w,
                child: TextFormField(
                  controller: passwordCheck,
                  obscureText: obscureCheckText,
                  style: TextStyle(
                    fontSize: 15.w,
                    color: color212121,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: TKeys.checkPassword.translate(context),
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
                          'assets/images/ic_visibility_off.png',
                          width: 20.w,
                          height: 20.w,
                        )
                            : Image.asset(
                          'assets/images/ic_visibility.png',
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
                        authViewModel.joinPasswordCheckInputStatus(false);
                      });
                      return TKeys.passwordEmptyError.translate(context);
                    }
                    if (!RegExp(Constant.passwordRegexStr).hasMatch(pw)) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        authViewModel.joinPasswordCheckInputStatus(false);
                      });
                      return TKeys.samePassword.translate(context);
                    }
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      authViewModel.joinPasswordCheckInputStatus(true);
                    });
                    return null;
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 48.h)),
              Container(
                width: 353.w,
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  TKeys.nickname.translate(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: color212121,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// nickname 입력
                  SizedBox(
                    width: 215.w,
                    child: TextFormField(
                      controller: nickname,
                      style: TextStyle(
                        fontSize: 15.w,
                        color: color212121,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: TKeys.inputEmail.translate(context),
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
                            authViewModel.joinEmailInputStatus(false);
                          });
                          return TKeys.emailEmptyError.translate(context);
                        }
                        if (!RegExp(
                          Constant.emailRegexStr,
                        ).hasMatch(email.text)) {
                          WidgetsBinding.instance.addPostFrameCallback((_) async {
                            authViewModel.joinEmailInputStatus(false);
                          });
                          return TKeys.emailValid.translate(context);
                        }
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          authViewModel.joinEmailInputStatus(true);
                        });
                        return null;
                      },
                    ),
                  ),
                ],
              )
            ]),
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
      authViewModel.joinEmailInputStatus(false);
      authViewModel.joinPasswordCheckInputStatus(false);
      authViewModel.joinPasswordCheckInputStatus(false);
      authViewModel.joinNicknameInputStatus(false);
    });
  }
}
