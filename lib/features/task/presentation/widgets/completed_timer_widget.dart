import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/extensions/date_extension.dart';
import 'package:volo_test/core/extensions/duration_extension.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/features/timer/domain/model/timer.dart';

class CompletedTimerWidget extends StatelessWidget {
  const CompletedTimerWidget({required this.timer, super.key});
  final TimerModel timer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.themeData.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 24.r,
            height: 24.r,
            child: SvgPicture.asset(AppIcons.done),
          ),
          SizedBox(width: 16.w),
          Text(
            timer.startTime?.toSecondaryFormat() ?? '',
            style: context.themeData.textTheme.titleMedium?.copyWith(
              color: context.themeData.colorScheme.onSurface,
            ),
          ),
          const Spacer(),
          Text(
            Duration(seconds: timer.elapsedSeconds).toHM(),
            style: context.themeData.textTheme.titleMedium?.copyWith(
              color: context.themeData.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
