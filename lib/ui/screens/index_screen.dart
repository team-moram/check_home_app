import 'package:check_home_app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../config/go_router.dart';
import '../../../constant.dart';
import '../../../main.dart';
import '../main_view_model.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> with WidgetsBindingObserver {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      switch (index) {
        case 0:
          context.goNamed(Constant.routeRoot);
          break;
        case 1:
          context.goNamed(Constant.routeMore);
          break;
        case 2:
          context.goNamed(Constant.routeMyInfo);
          break;
        default:
          context.goNamed(Constant.routeRoot);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mainViewModel = Provider.of<MainViewModel>(context, listen: true);

    setState(() {
      logger.d(router.location);
      switch (router.location) {
        case Constant.routeRootPath:
          selectedIndex = 0;
          break;
        case Constant.routeMorePath:
          selectedIndex = 1;
          break;
        default:
          break;
      }
    });

    return Scaffold(
      extendBody: true,
      body: Container(child: widget.child),
      bottomNavigationBar: golfMenu(),
    );
  }

  @override
  void initState() {
    // MainViewModel().init(context);
    WidgetsBinding.instance.addObserver(this);
    super.initState();

    // // 다이나믹 링크 설정
    // DynamicLinks().setup();
  }

  // golf bottom sheet
  golfMenu() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          // 그림자효과
          BoxShadow(color: Colors.black12, blurRadius: 6.r),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(6.r),
          topLeft: Radius.circular(6.r),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          backgroundColor: colorFFFFFF,
          unselectedItemColor: Colors.black,
          fixedColor: Colors.black,
          selectedFontSize: 11.sp,
          unselectedFontSize: 11.sp,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(10.w),
                child:
                    selectedIndex == 0
                        ? Icon(Icons.offline_bolt)
                        : Icon(Icons.offline_bolt_outlined),
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(10.w),
                child:
                    selectedIndex == 1
                        ? Icon(Icons.offline_pin_rounded)
                        : Icon(Icons.offline_pin_outlined),
              ),
              label: 'more',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
