import 'package:auto_route/auto_route.dart';
import 'package:volo_test/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: TimersRoute.page),
        AutoRoute(page: CreateTimerRoute.page),
        AutoRoute(page: TaskRoute.page),
      ];
}
