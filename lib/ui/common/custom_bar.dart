import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../config/theme/colors.dart';

PreferredSizeWidget customBar(String? title, bool back, BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: colorFFFFFF,
    title: Text(
      title ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textScaler: TextScaler.noScaling,
      style: TextStyle(
        color: color000000,
        fontSize: 19.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    leading:
        back
            ? IconButton(
              icon: Image.asset(
                'assets/images/ic_arrow_left.png',
                width: 24.w,
                fit: BoxFit.fitWidth,
              ),
              onPressed: () {
                context.pop();
              },
            )
            : null,
    elevation: 0,
    toolbarHeight: 54.h,
  );
}
