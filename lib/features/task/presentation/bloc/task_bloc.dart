import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volo_test/features/task/domain/model/task.dart';
import 'package:volo_test/features/task/domain/model/task_result.dart';
import 'package:volo_test/features/task/domain/repository/task_repository.dart';
import 'package:volo_test/features/task/presentation/bloc/task_event.dart';
import 'package:volo_test/features/task/presentation/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({required ITaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(const TaskState$Initial()) {
    on<TaskEvent>((event, emit) => switch (event) {
          TaskEvent$Get() => _getTasks(event, emit),
        });
  }

  final ITaskRepository _taskRepository;

  Future<void> _getTasks(TaskEvent$Get event, Emitter<TaskState> emit) async {
    emit(TaskState$Loading(tasks: state.tasks));
    final result = await _taskRepository.getTasks();
    switch (result) {
      case TaskResult$Success<List<Task>>():
        emit(TaskState$Data(tasks: result.data));
      case TaskResult$Failure<List<Task>>():
        emit(TaskState$Error(tasks: state.tasks));
    }
  }
}
