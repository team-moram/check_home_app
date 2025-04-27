import 'package:check_home_app/ui/common/custom_button.dart';
import 'package:check_home_app/ui/widgets/auth/term_check_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../config/t_key.dart';
import '../../../config/theme/colors.dart';

// 이용약관 모달창
class TermModalWidget extends StatefulWidget {
  const TermModalWidget({super.key});

  @override
  State<TermModalWidget> createState() => _TermModalWidgetState();
}

class _TermModalWidgetState extends State<TermModalWidget> {
  bool allChecked = false;
  bool check14 = false;
  bool checkTerms = false;
  bool checkPrivacy = false;

  void updateAllChecked() {
    setState(() {
      allChecked = check14 && checkTerms && checkPrivacy;
    });
  }

  void toggleAll(bool value) {
    setState(() {
      allChecked = value;
      check14 = value;
      checkTerms = value;
      checkPrivacy = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 40.h,
        left: 20.w,
        right: 20.w,
        top: 16.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32.w,
            height: 4.w,
            decoration: BoxDecoration(
              color: color79747E,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          SizedBox(height: 28.h),
          SizedBox(
            width: 353.w,
            child: Text(
              TKeys.termComment.translate(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textScaler: TextScaler.noScaling,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: color151515,
                fontSize: 19.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 36.h),
          // 모두 동의
          TermCheckboxWidget(
            value: allChecked,
            text: TKeys.agreeAll.translate(context),
            onChanged: (val) => toggleAll(val!),
          ),
          SizedBox(height: 16.h),
          Container(width: 353.w, height: 1.w, color: colorEAEAEA),
          SizedBox(height: 16.h),
          // 만 14세 이상
          TermCheckboxWidget(
            value: check14,
            text: TKeys.ageAgree.translate(context),
            onChanged: (val) {
              setState(() {
                check14 = val!;
                updateAllChecked();
              });
            },
          ),
          SizedBox(height: 20.h),
          // 서비스 이용약관
          TermCheckboxWidget(
            value: checkTerms,
            text: TKeys.useAgree.translate(context),
            showArrow: true,
            onChanged: (val) {
              setState(() {
                checkTerms = val!;
                updateAllChecked();
              });
            },
            onTapText: () async {
              await launchUrlString(
                'http://check-home.o-r.kr/terms/service',
              ); // 서비스 이용약관 링크
            },
          ),
          SizedBox(height: 20.h),
          // 개인정보 수집 및 이용
          TermCheckboxWidget(
            value: checkPrivacy,
            text: TKeys.personalAgree.translate(context),
            showArrow: true,
            onChanged: (val) {
              setState(() {
                checkPrivacy = val!;
                updateAllChecked();
              });
            },
            onTapText: () async {
              await launchUrlString(
                'http://localhost:5173/terms/privacy',
              ); // 개인정보처리방침 링크
            },
          ),
          SizedBox(height: 64.h),
          InkWell(
            onTap: (check14 && checkTerms && checkPrivacy) ? () {} : null,
            onDoubleTap: null,
            child: SizedBox(
              width: 353.w,
              height: 50.w,
              child: customButton(
                8.r,
                TKeys.agreeToStart.translate(context),
                (check14 && checkTerms && checkPrivacy)
                    ? colorFC5E03
                    : colorEAEAEA,
                (check14 && checkTerms && checkPrivacy)
                    ? colorFFFFFF
                    : colorBDBDBD,
                FontWeight.w600,
                15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
