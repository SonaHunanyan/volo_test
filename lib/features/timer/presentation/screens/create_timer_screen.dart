import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volo_test/core/constants/app_icons.dart';
import 'package:volo_test/core/constants/app_strings.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/core/theme/theme_colors.dart';
import 'package:volo_test/core/ui/widgets/widgets.dart';
import 'package:volo_test/features/project/domain/model/project.dart';
import 'package:volo_test/features/project/presentation/bloc/project_bloc.dart';
import 'package:volo_test/features/project/presentation/bloc/project_state.dart';
import 'package:volo_test/features/task/domain/model/task.dart';
import 'package:volo_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:volo_test/features/task/presentation/bloc/task_state.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_bloc.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_event.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_state.dart';

@RoutePage()
class CreateTimerScreen extends StatefulWidget {
  const CreateTimerScreen({super.key});

  @override
  State<CreateTimerScreen> createState() => _CreateTimerScreenState();
}

class _CreateTimerScreenState extends State<CreateTimerScreen> {
  final projectNotifier = ValueNotifier<Project?>(null);
  final taskNotifier = ValueNotifier<Task?>(null);
  final descriptionController = TextEditingController();

  void onCreate() {
    final project = projectNotifier.value;
    final task = taskNotifier.value;
    if (descriptionController.text.isEmpty || task == null || project == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        PrimarySnackbar(
          context,
          text: AppStrings.allFeildsAreRequired,
          color: context.themeData.colorScheme.error,
        ),
      );
      return;
    }

    context.read<TimerBloc>().add(
          TimerEvent$Create(
            projectId: project.id,
            taskId: task.id,
            description: descriptionController.text,
          ),
        );
  }

  @override
  void dispose() {
    descriptionController.dispose();
    projectNotifier.dispose();
    taskNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        context,
        titleText: AppStrings.createTimer,
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
        child: BlocListener<TimerBloc, TimerState>(
          listener: (context, state) {
            if (state is TimerState$Created) {
              context.router.back();
            }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, state) => ValueListenableBuilder(
                      valueListenable: projectNotifier,
                      builder: (context, value, child) => PrimaryDropdown(
                        items: state.projects.map((e) => e.name).toList(),
                        onSelect: (int value) {
                          projectNotifier.value = state.projects[value];
                        },
                        selected: value?.name ?? AppStrings.project,
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) => ValueListenableBuilder(
                      valueListenable: taskNotifier,
                      builder: (context, value, child) => PrimaryDropdown(
                        items: state.tasks.map((e) => e.name).toList(),
                        onSelect: (int value) {
                          taskNotifier.value = state.tasks[value];
                        },
                        selected: value?.name ?? AppStrings.task,
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  PrimaryTextField(
                    controller: descriptionController,
                    hint: AppStrings.description,
                  ),
                  SizedBox(height: 28.h),
                  Row(
                    children: [
                      SizedBox(
                        width: 17.w,
                        child: SvgPicture.asset(AppIcons.chevronDown),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        AppStrings.makeFavorite,
                        style: context.themeData.textTheme.bodyLarge?.copyWith(
                          color: context.themeData.colorScheme.onSurface,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  PrimaryLargeButton(
                    onTap: onCreate,
                    title: AppStrings.createTimer,
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
