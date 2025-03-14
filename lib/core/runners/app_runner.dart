import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:volo_test/core/initialization/initialization.dart';
import 'package:volo_test/core/ui/volo_test_app.dart';
import 'package:volo_test/features/project/domain/repository/project_repository.dart';
import 'package:volo_test/features/project/presentation/bloc/project_bloc.dart';
import 'package:volo_test/features/task/domain/repository/task_repository.dart';
import 'package:volo_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:volo_test/features/timer/domain/repository/timer_repository.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_bloc.dart';

class Runner {
  static Future<void> run() async {
    await initializeApp(
      onSuccess: () {
        runApp(
          MultiBlocProvider(
            providers: [
              BlocProvider<ProjectBloc>(
                create: (context) => ProjectBloc(
                    projectRepository: GetIt.I.get<IProjectRepository>()),
              ),
              BlocProvider<TaskBloc>(
                create: (context) =>
                    TaskBloc(taskRepository: GetIt.I.get<ITaskRepository>()),
              ),
              BlocProvider<TimerBloc>(
                create: (context) =>
                    TimerBloc(timerRepository: GetIt.I.get<ITimerRepository>()),
              )
            ],
            child: const VoloTestApp(),
          ),
        );
      },
      onError: (error, stackTrace) {
        log(error.toString());
      },
    );
  }
}
