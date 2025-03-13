import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volo_test/core/constants/constants.dart';
import 'package:volo_test/core/router/app_router.dart';
import 'package:volo_test/core/theme/light_theme.dart';

class VoloTestApp extends StatelessWidget {
  const VoloTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return ScreenUtilInit(
      designSize: Size(Constants.screenW, Constants.screenH),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (_, __) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        theme: lightTheme,
        routerConfig: router.config(),
      ),
    );
  }
}
