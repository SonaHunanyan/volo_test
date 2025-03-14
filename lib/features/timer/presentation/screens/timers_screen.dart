import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/constants/app_strings.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/core/router/app_router.gr.dart';
import 'package:volo_test/core/theme/theme_colors.dart';
import 'package:volo_test/core/ui/widgets/widgets.dart';
import 'package:volo_test/features/project/presentation/bloc/project_bloc.dart';
import 'package:volo_test/features/project/presentation/bloc/project_state.dart';
import 'package:volo_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:volo_test/features/task/presentation/bloc/task_state.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_bloc.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_state.dart';
import 'package:volo_test/features/timer/presentation/model/timer_error.dart';
import 'package:volo_test/features/timer/presentation/widgets/sort_by_widget.dart';
import 'package:volo_test/features/timer/presentation/widgets/widgets.dart';

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
          PrimaryIconButton(
            icon: AppIcons.sort,
            onTap: () {
              showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                builder: (context) => const SortByWidget(),
              );
            },
          ),
          SizedBox(width: 8.w),
          PrimaryIconButton(
            icon: AppIcons.plus,
            onTap: () {
              context.router.push(const CreateTimerRoute());
            },
          ),
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
        child: BlocConsumer<TimerBloc, TimerState>(
          listener: (context, state) {
            if (state is! TimerState$Error) {
              return;
            }
            final errorMessage = switch (state.error) {
              TimerError$FailToGet() => AppStrings.failToGetTimers,
              TimerError$FailToCreate() => AppStrings.failToCreateTimer,
              TimerError$FailToUpdate() => AppStrings.failToUpdateTimer,
            };
            ScaffoldMessenger.of(context).showSnackBar(
              PrimarySnackbar(
                context,
                text: errorMessage,
                color: context.themeData.colorScheme.error,
              ),
            );
          },
          builder: (context, state) => Center(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.timersCount(state.timers.length),
                      style: context.themeData.textTheme.labelLarge?.copyWith(
                        color: context.themeData.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, taskState) =>
                        BlocBuilder<ProjectBloc, ProjectState>(
                      builder: (context, projectState) => Expanded(
                        child: ListView.builder(
                          itemCount: state.timers.length,
                          itemBuilder: (context, index) {
                            final timer = state.timers[index];
                            final task = taskState.tasks
                                .firstWhereOrNull((e) => e.id == timer.taskId);
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              child: TimerCardWidget(
                                timer: timer,
                                task: task,
                                project: projectState.projects.firstWhereOrNull(
                                    (e) => e.id == task?.projectId),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
