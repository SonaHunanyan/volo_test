import 'package:volo_test/features/task/domain/data_source/task_data_source.dart';
import 'package:volo_test/features/task/domain/model/task.dart';
import 'package:volo_test/features/task/domain/model/task_result.dart';
import 'package:volo_test/features/task/domain/repository/task_repository.dart';

class TaskRepository implements ITaskRepository {
  const TaskRepository({required ITaskDataSource dataSource})
      : _dataSource = dataSource;
  final ITaskDataSource _dataSource;
  @override
  Future<TaskResult<List<Task>>> getTasks() async {
    try {
      final tasks = await _dataSource.getTasks();
      return TaskResult$Success(data: tasks);
    } catch (error, stackTrace) {
      return TaskResult$Failure(error, stackTrace);
    }
  }

  @override
  Future<TaskResult<Task>> updateTask(Task task) async {
    try {
      final updatedTask = await _dataSource.updateTask(task);
      return TaskResult$Success(data: updatedTask);
    } catch (error, stackTrace) {
      return TaskResult$Failure(error, stackTrace);
    }
  }
}
