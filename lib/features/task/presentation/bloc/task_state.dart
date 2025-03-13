import 'package:volo_test/features/task/domain/model/task.dart';

sealed class TaskState {
  const TaskState({required this.tasks});
  final List<Task> tasks;
}

class TaskState$Initial extends TaskState {
  const TaskState$Initial() : super(tasks: const []);
}

class TaskState$Loading extends TaskState {
  const TaskState$Loading({required super.tasks});
}

class TaskState$Data extends TaskState {
  const TaskState$Data({required super.tasks});
}

class TaskState$Error extends TaskState {
  const TaskState$Error({required super.tasks});
}
