import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/constants/app_strings.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/core/theme/theme_colors.dart';
import 'package:volo_test/core/ui/widgets/widgets.dart';

@RoutePage()
class TimersScreen extends StatelessWidget {
  const TimersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        context,
        titleText: AppStrings.timesheets,
        actions: [
          PrimaryIconButton(icon: AppIcons.sort),
          SizedBox(width: 8.w),
          PrimaryIconButton(icon: AppIcons.plus),
          SizedBox(width: 16.w),
        ],
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
