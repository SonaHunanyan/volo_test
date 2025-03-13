import 'package:volo_test/features/task/domain/model/task.dart';
import 'package:volo_test/features/task/domain/model/task_result.dart';

abstract interface class ITaskRepository {
  Future<TaskResult<List<Task>>> getTasks();
  Future<TaskResult<Task>> updateTask(Task task);
}
