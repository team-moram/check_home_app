import 'package:check_home_app/config/theme/colors.dart';
import 'package:check_home_app/ui/common/loading_screen.dart';
import 'package:check_home_app/ui/main_view_model.dart';
import 'package:check_home_app/ui/screens/use_case/auth_view_model.dart';
import 'package:check_home_app/ui/screens/use_case/loading_view_model.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'config/go_router.dart';
import 'core/utils/localization.dart';

var logger = Logger(printer: PrettyPrinter());

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 투명색
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProxyProvider2(
          create: (_) => LoadingViewModel(),
          update: (
            BuildContext context,
            MainViewModel mainViewModel,
            AuthViewModel authViewModel,
            LoadingViewModel? loadingViewModel,
          ) {
            var isLoading =
                mainViewModel.isLoading() || authViewModel.isLoading();
            loadingViewModel!.setLoading(isLoading);
            return loadingViewModel;
          },
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 780),
        builder: (BuildContext context, Widget? child) {
          Color canvasColor = colorFFFFFF;
          return MaterialApp.router(
            title: 'Check Home App',
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: LoadingScreen.init(),
            theme: ThemeData(
              // useMaterial3: false,
              datePickerTheme: DatePickerThemeData(
                backgroundColor: canvasColor,
                surfaceTintColor: Colors.transparent,
              ),
              appBarTheme: const AppBarTheme(
                shadowColor: Colors.grey,
                scrolledUnderElevation: 0,
              ),
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: canvasColor,
                surfaceTintColor: Colors.transparent,
                constraints: BoxConstraints(minWidth: 360.w),
              ),
              scaffoldBackgroundColor: canvasColor,
              canvasColor: canvasColor,
              dialogBackgroundColor: canvasColor,
              dialogTheme: const DialogTheme(
                surfaceTintColor: Colors.transparent,
              ),
            ),
            debugShowCheckedModeBanner: false,
            // darkTheme: ThemeData.dark(),
            localeResolutionCallback: Localization.localeResolutionCallBack,
            supportedLocales: Localization.supportedLocales,
            localizationsDelegates: Localization.localizationsDelegate,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
