import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/features/timer/domain/model/timer.dart';

class TaskTimerWidget extends StatelessWidget {
  const TaskTimerWidget({
    required this.duration,
    required this.currentState,
    required this.onPlayPause,
    required this.onComplete,
    super.key,
  });
  final String duration;
  final TimerCurrentState currentState;
  final VoidCallback onPlayPause;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          duration,
          style: context.themeData.textTheme.displaySmall?.copyWith(
            color: context.themeData.colorScheme.onSecondaryContainer,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onComplete,
          child: SizedBox(
              width: 48.r,
              height: 48.r,
              child: SvgPicture.asset(AppIcons.complete)),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: onPlayPause,
          child: SizedBox(
            width: 48.r,
            height: 48.r,
            child: SvgPicture.asset(switch (currentState) {
              TimerCurrentState.running => AppIcons.pause,
              TimerCurrentState.paused => AppIcons.play,
            }),
          ),
        ),
      ],
    );
  }
}
