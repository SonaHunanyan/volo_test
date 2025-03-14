import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volo_test/core/theme/theme_colors.dart';

class TimerDividerWidget extends StatelessWidget {
  const TimerDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: context.themeColors.gold,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
