import 'package:get_it/get_it.dart';
import 'package:volo_test/features/project/data/data_source/project_data_source.dart';
import 'package:volo_test/features/project/data/repository/project_repository.dart';
import 'package:volo_test/features/project/domain/data_source/project_data_source.dart';
import 'package:volo_test/features/project/domain/repository/project_repository.dart';
import 'package:volo_test/features/task/data/data_source/task_data_source.dart';
import 'package:volo_test/features/task/data/repository/task_repository.dart';
import 'package:volo_test/features/task/domain/data_source/task_data_source.dart';
import 'package:volo_test/features/task/domain/repository/task_repository.dart';
import 'package:volo_test/features/timer/data/data_source/timer_data_source.dart';
import 'package:volo_test/features/timer/data/repository/timer_repository.dart';
import 'package:volo_test/features/timer/domain/data_source/timer_data_source.dart';
import 'package:volo_test/features/timer/domain/repository/timer_repository.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerLazySingleton<IProjectDataSource>(() => ProjectDataSource());
  getIt.registerLazySingleton<ITaskDataSource>(() => TaskDataSource());
  getIt.registerLazySingleton<ITimerDataSource>(() => TimerDataSource());

  getIt.registerLazySingleton<IProjectRepository>(
      () => ProjectRepository(dataSource: getIt<IProjectDataSource>()));
  getIt.registerLazySingleton<ITaskRepository>(
      () => TaskRepository(dataSource: getIt<ITaskDataSource>()));
  getIt.registerLazySingleton<ITimerRepository>(
      () => TimerRepository(dataSource: getIt<ITimerDataSource>()));
}
