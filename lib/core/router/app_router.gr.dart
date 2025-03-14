// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:volo_test/features/timer/presentation/screens/create_timer_screen.dart'
    as _i1;
import 'package:volo_test/features/timer/presentation/screens/timers_screen.dart'
    as _i2;

/// generated route for
/// [_i1.CreateTimerScreen]
class CreateTimerRoute extends _i3.PageRouteInfo<void> {
  const CreateTimerRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CreateTimerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTimerRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.CreateTimerScreen();
    },
  );
}

/// generated route for
/// [_i2.TimersScreen]
class TimersRoute extends _i3.PageRouteInfo<void> {
  const TimersRoute({List<_i3.PageRouteInfo>? children})
      : super(
          TimersRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimersRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.TimersScreen();
    },
  );
}
