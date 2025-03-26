import 'dart:io';

import 'package:check_home_app/config/theme/colors.dart';
import 'package:check_home_app/ui/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorFF8C00,
        elevation: 0,
        toolbarHeight: 56.h,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: 393.w,
          height: MediaQuery.of(context).size.height - 56.h,
          color: colorFFFFFF,
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 224.w,
                height: 93.w,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 80.h)),
              Column(
                children: [
                  SizedBox(
                    width: 393.w,
                    height: 50.h,
                    child: InkWell(
                      onTap: () {
                      },
                      onDoubleTap: () {},
                      child: customButton(8.r, "카카오톡으로 로그인", colorFF8C00, colorFFFFFF, FontWeight.normal, 12.sp)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 12.h)),
                  SizedBox(
                    width: 393.w,
                    height: 50.h,
                    child: InkWell(
                        onTap: () {
                        },
                        onDoubleTap: () {},
                        child: customButton(8.r, "구글로 로그인", colorFF8C00, colorFFFFFF, FontWeight.normal, 12.sp)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 12.h)),
                  SizedBox(
                    width: 393.w,
                    height: 50.h,
                    child: InkWell(
                        onTap: () {
                        },
                        onDoubleTap: () {},
                        child: customButton(8.r, "이메일로 로그인", colorFF8C00, colorFFFFFF, FontWeight.normal, 12.sp)
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
