import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:volo_test/core/constants/app_strings.dart';
import 'package:volo_test/core/extensions/theme_extension.dart';
import 'package:volo_test/core/theme/theme_colors.dart';
import 'package:volo_test/core/ui/widgets/widgets.dart';
import 'package:volo_test/features/project/domain/model/project.dart';
import 'package:volo_test/features/project/presentation/bloc/project_bloc.dart';
import 'package:volo_test/features/project/presentation/bloc/project_state.dart';

@RoutePage()
class CreateTimerScreen extends StatefulWidget {
  const CreateTimerScreen({super.key});

  @override
  State<CreateTimerScreen> createState() => _CreateTimerScreenState();
}

class _CreateTimerScreenState extends State<CreateTimerScreen> {
  final projectNotifier = ValueNotifier<Project?>(null);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
