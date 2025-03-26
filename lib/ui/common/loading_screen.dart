import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../screens/use_case/loading_view_model.dart';

class LoadingScreen {
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LoadingIndicator(child: child!));
      } else {
        return LoadingIndicator(child: child!);
      }
    };
  }
}

class LoadingIndicator extends StatelessWidget {
  final Widget child;

  const LoadingIndicator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<LoadingViewModel>(
        create: (context) => LoadingViewModel(),
        builder: (context, _) {
          return Stack(
            children: [
              child,
              Consumer<LoadingViewModel>(
                builder: (context, provider, child) {
                  return provider.isLoading() || provider.isWidgetLoading()
                      ? Container(
                          color: provider.isLoading()
                              ? Colors.white
                              : (provider.isWidgetLoading()
                                  ? Colors.transparent
                                  : Colors.white),
                          child: Center(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // SpinKitFadingCircle(
                              //   itemBuilder: (BuildContext context, int index) {
                              //     return DecoratedBox(
                              //       decoration: BoxDecoration(
                              //         color: index.isEven
                              //             ? Colors.green
                              //             : Colors.orange,
                              //       ),
                              //     );
                              //   },
                              // )
                              // Lottie.asset('assets/images/sfull_loading.json',
                              //     width: 88.w, fit: BoxFit.fitWidth)
                            ],
                          )),
                        )
                      : Container();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
