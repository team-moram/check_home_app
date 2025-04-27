import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/colors.dart';

// 이용약관 체크 박스
class TermCheckboxWidget extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;
  final String text;
  final bool showArrow;
  final VoidCallback? onTapText;

  const TermCheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    this.showArrow = false,
    this.onTapText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapText,
      child: SizedBox(
        width: 353.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onChanged(!value),
              child: Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  color: value ? colorFC5E03 : Colors.transparent,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: value ? colorFC5E03 : color757575,
                    width: 1.w,
                  ),
                ),
                child: value
                    ? Center(
                  child: Image.asset(
                    'assets/images/ic_check.png',
                    width: 12.w,
                    height: 12.w,
                    fit: BoxFit.contain,
                  ),
                )
                    : null,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textScaler: TextScaler.noScaling,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: color212121,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  if (showArrow)
                    Image.asset(
                      'assets/images/ic_arrow_right.png',
                      width: 20.w,
                      height: 20.w,
                      fit: BoxFit.contain,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
