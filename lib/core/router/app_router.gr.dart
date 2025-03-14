// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:volo_test/features/task/presentation/screens/task_screen.dart'
    as _i2;
import 'package:volo_test/features/timer/presentation/screens/create_timer_screen.dart'
    as _i1;
import 'package:volo_test/features/timer/presentation/screens/timers_screen.dart'
    as _i3;

/// generated route for
/// [_i1.CreateTimerScreen]
class CreateTimerRoute extends _i4.PageRouteInfo<void> {
  const CreateTimerRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CreateTimerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTimerRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.CreateTimerScreen();
    },
  );
}

/// generated route for
/// [_i2.TaskScreen]
class TaskRoute extends _i4.PageRouteInfo<TaskRouteArgs> {
  TaskRoute({
    required int taskId,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          TaskRoute.name,
          args: TaskRouteArgs(
            taskId: taskId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TaskRouteArgs>();
      return _i2.TaskScreen(
        taskId: args.taskId,
        key: args.key,
      );
    },
  );
}

class TaskRouteArgs {
  const TaskRouteArgs({
    required this.taskId,
    this.key,
  });

  final int taskId;

  final _i5.Key? key;

  @override
  String toString() {
    return 'TaskRouteArgs{taskId: $taskId, key: $key}';
  }
}

/// generated route for
/// [_i3.TimersScreen]
class TimersRoute extends _i4.PageRouteInfo<void> {
  const TimersRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TimersRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimersRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.TimersScreen();
    },
  );
}
