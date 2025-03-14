import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';

class SecondaryAppBar extends AppBar {
  SecondaryAppBar(
    BuildContext context, {
    required String titleText,
    TextStyle? titleStyle,
    super.actions,
    super.key,
  }) : super(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leadingWidth: 43.w,
          backgroundColor: context.themeData.scaffoldBackgroundColor,
          leading: Padding(
            padding: EdgeInsets.only(left: 33.w),
            child: GestureDetector(
              onTap: () {
                context.router.back();
              },
              child: SizedBox(
                width: 10.w,
                child: SvgPicture.asset(
                  AppIcons.chevronLeft,
                ),
              ),
            ),
          ),
          title: Text(
            titleText,
            style: titleStyle ??
                context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.themeData.colorScheme.onSurface,
                ),
          ),
        );
}
