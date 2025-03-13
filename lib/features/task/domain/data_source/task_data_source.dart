import 'package:volo_test/features/task/domain/model/task.dart';

abstract interface class ITaskDataSource {
  Future<List<Task>> getTasks();
  Future<Task> updateTask(Task task);
}
