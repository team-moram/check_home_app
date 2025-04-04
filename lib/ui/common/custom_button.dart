import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 기본 버튼
Widget customButton(
  double circular,
  String text,
  Color backgroundColor,
  Color textColor,
  FontWeight weight,
  double fontSize,
) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(circular),
    child: Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: weight,
          ),
        ),
      ),
    ),
  );
}

/// 이미지 버튼
Widget customImageButton(
  double circular,
  String text,
  Color backgroundColor,
  Color textColor,
  FontWeight weight,
  double fontSize,
  String imageName,
) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(circular),
    child: Container(
      color: backgroundColor,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageName, width: 24),
            Padding(padding: EdgeInsets.only(right: 12.w)),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: weight,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/// 아웃 라인 버튼
Widget customLineButton(
  double circular,
  String text,
  Color backgroundColor,
  Color lineColor,
  Color textColor,
  FontWeight weight,
  double fontSize,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(circular),
      border: Border.all(
        color: lineColor,
        style: BorderStyle.solid,
        width: 1.h,
      ),
      color: backgroundColor,
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: weight,
          ),
        ),
      ),
    ),
  );
}
