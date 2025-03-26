import 'package:check_home_app/ui/screens/main/more/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constant.dart';
import '../ui/screens/index_screen.dart';
import '../ui/screens/intro/splash_screen.dart';
import '../ui/screens/main/home/home_screen.dart';
import '../ui/screens/main/my_info/my_info_screen.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: Constant.routeSplashPath,
  routes: <RouteBase>[
    GoRoute(
      name: Constant.routeSplash,
      path: Constant.routeSplashPath,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    ShellRoute(
      navigatorKey: shellNavKey,
      routes: <RouteBase>[
        /// home
        GoRoute(
          name: Constant.routeRoot,
          path: Constant.routeRootPath,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const NoTransitionPage(child: HomeScreen());
          },
          routes: <RouteBase>[
            /// my info
            GoRoute(
              parentNavigatorKey: rootNavKey,
              name: Constant.routeMyInfo,
              path: Constant.routeMyInfoPath,
              builder: (BuildContext context, GoRouterState state) {
                return const MyInfoScreen();
              },
            ),
          ],
        ),

        /// more
        GoRoute(
            name: Constant.routeMore,
            path: Constant.routeMorePath,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const NoTransitionPage(child: MoreScreen());
            },
            routes: <RouteBase>[
            ]),
      ],
      builder: (context, state, child) {
        return IndexScreen(state: state, child: child);
      },
    ),

    // /// 로그인
    // GoRoute(
    //   parentNavigatorKey: rootNavKey,
    //   name: Constant.routeLogin,
    //   path: Constant.routeLoginPath,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const LoginScreen();
    //   },
    //   routes: <RouteBase>[
    //     GoRoute(
    //       parentNavigatorKey: rootNavKey,
    //       name: Constant.routeJoin,
    //       path: Constant.routeJoinPath,
    //       builder: (BuildContext context, GoRouterState state) {
    //         return const JoinScreen();
    //       },
    //       routes: <RouteBase>[
    //         GoRoute(
    //           parentNavigatorKey: rootNavKey,
    //           name: Constant.routeJoinPersonal,
    //           path: Constant.routeJoinPersonalPath,
    //           builder: (BuildContext context, GoRouterState state) {
    //             JoinExtraInfo joinExtraInfo = state.extra as JoinExtraInfo;
    //             return JoinPersonalScreen(joinExtraInfo: joinExtraInfo);
    //           },
    //         ),
    //         GoRoute(
    //             parentNavigatorKey: rootNavKey,
    //             name: Constant.routeJoinCorporate,
    //             path: Constant.routeJoinCorporatePath,
    //             builder: (BuildContext context, GoRouterState state) {
    //               return const JoinCorporateScreen();
    //             },
    //             routes: <RouteBase>[
    //               GoRoute(
    //                 parentNavigatorKey: rootNavKey,
    //                 name: Constant.routeJoinCorporateResult,
    //                 path: Constant.routeJoinCorporateResultPath,
    //                 builder: (BuildContext context, GoRouterState state) {
    //                   return const JoinCorporateResultScreen();
    //                 },
    //               ),
    //             ]),
    //       ],
    //     ),
    //     GoRoute(
    //       parentNavigatorKey: rootNavKey,
    //       name: Constant.routeFindIdPw,
    //       path: Constant.routeFindIdPwPath,
    //       builder: (BuildContext context, GoRouterState state) {
    //         return const FindIdPwScreen();
    //       },
    //       routes: <RouteBase>[
    //         GoRoute(
    //           parentNavigatorKey: rootNavKey,
    //           name: Constant.routeFindId,
    //           path: Constant.routeFindIdPath,
    //           builder: (BuildContext context, GoRouterState state) {
    //             CertProfile certProfile = state.extra as CertProfile;
    //             return FindIdScreen(certProfile: certProfile);
    //           },
    //         ),
    //         GoRoute(
    //           parentNavigatorKey: rootNavKey,
    //           name: Constant.routeFindPw,
    //           path: '${Constant.routeFindPw}/:id',
    //           builder: (BuildContext context, GoRouterState state) {
    //             int id = int.parse(state.params['id']!);
    //             return ChangePwScreen(id: id);
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // ),

  ],
);

// String? loginCheck(BuildContext context, GoRouterState state) {
//   final mainViewModel = Provider.of<MainViewModel>(context, listen: false);
//   final loginInfo = mainViewModel.isLogin();
//   logger.d(loginInfo);
//   if (!loginInfo) {
//     return Constant.routeLoginPath;
//   }
//   return null;
// }
