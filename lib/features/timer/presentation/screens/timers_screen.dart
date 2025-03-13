import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/core/theme/theme_colors.dart';

@RoutePage()
class TimersScreen extends StatelessWidget {
  const TimersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.themeData.scaffoldBackgroundColor,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.themeData.scaffoldBackgroundColor,
              context.themeColors.natural99,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(),
      ),
    );
  }
}
