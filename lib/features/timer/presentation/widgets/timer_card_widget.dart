import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/constants/app_strings.dart';
import 'package:volo_test/core/extensions/date_extension.dart';
import 'package:volo_test/core/extensions/duration_extension.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/features/project/domain/model/project.dart';
import 'package:volo_test/features/task/domain/model/task.dart';
import 'package:volo_test/features/timer/domain/model/timer.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_bloc.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_event.dart';
import 'package:volo_test/features/timer/presentation/widgets/widgets.dart';

class TimerCardWidget extends StatelessWidget {
  const TimerCardWidget({
    required this.timer,
    required this.project,
    required this.task,
    super.key,
  });
  final TimerModel timer;
  final Project? project;
  final Task? task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.themeData.colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          const TimerDividerWidget(),
          SizedBox(width: 13.w),
          _TimerContentWidget(
            timer: timer,
            project: project,
            task: task,
          ),
          const Spacer(),
          TimerWidget(
            duration: Duration(seconds: timer.elapsedSeconds).toHM(),
            currentState: timer.currentState,
            onPlayPause: () {
              switch (timer.currentState) {
                case TimerCurrentState.running:
                  context
                      .read<TimerBloc>()
                      .add(TimerEvent$PauseTimer(timer.id));
                case TimerCurrentState.paused:
                  context
                      .read<TimerBloc>()
                      .add(TimerEvent$StartTimer(timer.id));
              }
            },
          )
        ],
      ),
    );
  }
}

class _TimerContentWidget extends StatelessWidget {
  const _TimerContentWidget({
    required this.timer,
    required this.project,
    required this.task,
  });
  final TimerModel timer;
  final Project? project;
  final Task? task;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ContentField(
            icon: (task?.isFavorite ?? false)
                ? AppIcons.starSelected
                : AppIcons.star,
            text: task?.name ?? '-',
            textStyle: context.themeData.textTheme.titleMedium,
          ),
          _ContentField(
            icon: AppIcons.project,
            text: project?.name ?? '-',
          ),
          _ContentField(
            icon: AppIcons.watch,
            text: AppStrings.deadline(task?.deadline.toPrimaryFormat() ?? '-'),
          ),
        ],
      ),
    );
  }
}

class _ContentField extends StatelessWidget {
  const _ContentField({
    required this.text,
    required this.icon,
    this.textStyle,
  });
  final String text;
  final String icon;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 14.r,
          width: 14.r,
          child: SvgPicture.asset(icon),
        ),
        SizedBox(width: 9.w),
        Text(
          text,
          style:
              (textStyle ?? context.themeData.textTheme.bodyMedium)?.copyWith(
            color: context.themeData.colorScheme.onSurface,
          ),
        )
      ],
    );
  }
}
