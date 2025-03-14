import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volo_test/core/extensions/date_extension.dart';
import 'package:volo_test/core/extensions/duration_extension.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/features/task/presentation/widgets/task_timer_widget.dart';
import 'package:volo_test/features/timer/domain/model/timer.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_bloc.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_event.dart';

class ActiveTimerWidget extends StatelessWidget {
  const ActiveTimerWidget({required this.timer, super.key});
  final TimerModel timer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.themeData.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            timer.startTime?.toSecondaryFormat() ?? '',
            style: context.themeData.textTheme.titleMedium?.copyWith(
              color: context.themeData.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 16.h),
          TaskTimerWidget(
            duration: Duration(seconds: timer.elapsedSeconds).toHMS(),
            currentState: timer.currentState,
            onComplete: () {
              context.read<TimerBloc>().add(TimerEvent$Complete(timer.id));
            },
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
          ),
        ],
      ),
    );
  }
}
