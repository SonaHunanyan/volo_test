import 'package:volo_test/features/task/domain/data_source/task_data_source.dart';
import 'package:volo_test/features/task/domain/model/task.dart';

class TaskDataSource implements ITaskDataSource {
  final List<Task> _tasks = [
    Task(
      id: 1,
      projectId: 1,
      deadline: DateTime.now().add(
        const Duration(days: 4),
      ),
      assignedTo: 'Ivan Zhuikov',
      name: 'iOS app deployment',
    ),
    Task(
      id: 2,
      projectId: 1,
      name: 'iOS app deployment',
      deadline: DateTime.now().add(
        const Duration(days: 3),
      ),
      assignedTo: 'Ivan Zhuikov',
      isFavorite: true,
    ),
  ];
  @override
  Future<List<Task>> getTasks() async {
    return _tasks;
  }

  @override
  Future<Task> updateTask(Task task) async {
    final index = _tasks.lastIndexWhere((e) => e.id == task.id);
    _tasks[index] = task;
    return task;
  }
}
