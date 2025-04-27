import 'package:check_home_app/config/theme/colors.dart';
import 'package:check_home_app/ui/common/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../../../../main.dart';

/// 공통 웹뷰 화면
class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({super.key, required this.url, required this.title});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  // 웹뷰 컨트롤러
  late final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorFFFFFF,
      appBar: customBar(widget.title, true, context),
      body: SafeArea(
        child: WebViewWidget(controller: webViewController),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    webViewSetting();
  }

  // 웹뷰 설정
  void webViewSetting() {
    logger.i('webViewSetting()');

    // IOS, Android params 설정
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    // 컨트롤러
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..enableZoom(false)
      ..clearCache()
      ..clearLocalStorage()
      ..loadRequest(Uri.parse(widget.url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    webViewController = controller;
  }

  // 뒤로 가기 로직(핸드폰 뒤로 가기 버튼 클릭시)
  Future<bool> onGoBack() async {
    logger.i('onGoBack()');
    context.pop();
    return true;
  }
}
