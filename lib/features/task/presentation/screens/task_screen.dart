import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/constants/app_strings.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/core/theme/theme_colors.dart';
import 'package:volo_test/core/ui/widgets/widgets.dart';
import 'package:volo_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:volo_test/features/task/presentation/bloc/task_state.dart';
import 'package:volo_test/features/task/presentation/widgets/active_timer_widget.dart';
import 'package:volo_test/features/task/presentation/widgets/completed_timer_widget.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_bloc.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_state.dart';

@RoutePage()
class TaskScreen extends StatefulWidget {
  const TaskScreen({required this.taskId, super.key});
  final int taskId;
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        final task = state.tasks.firstWhereOrNull((e) => e.id == widget.taskId);
        return Scaffold(
          appBar: SecondaryAppBar(
            context,
            titleText: '${task?.name ?? ''} - ${task?.assignedTo ?? ''}',
            titleStyle: context.themeData.textTheme.titleMedium?.copyWith(
              color: context.themeData.colorScheme.onSurface,
            ),
            actions: [
              GestureDetector(
                child: SizedBox(
                  width: 17.w,
                  child: SvgPicture.asset(AppIcons.pencil),
                ),
              ),
              SizedBox(width: 33.w),
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
            child: BlocBuilder<TimerBloc, TimerState>(
              builder: (context, state) {
                final timers =
                    state.timers.where((e) => e.taskId == widget.taskId);
                final completedTimers =
                    timers.where((e) => e.completedAt != null).toList();
                final activeTimers = timers
                    .where((e) => e.completedAt == null && e.startTime != null)
                    .toList();
                if (timers.isEmpty) {
                  return const SizedBox();
                }
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: ListView(
                      children: [
                        for (var i = 0; i < activeTimers.length; i++)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            child: ActiveTimerWidget(timer: activeTimers[i]),
                          ),
                        if (completedTimers.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            child: Text(
                              AppStrings.completedRecords,
                              style: context.themeData.textTheme.bodySmall
                                  ?.copyWith(
                                color: context.themeData.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        for (var i = 0; i < completedTimers.length; i++)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            child:
                                CompletedTimerWidget(timer: completedTimers[i]),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
