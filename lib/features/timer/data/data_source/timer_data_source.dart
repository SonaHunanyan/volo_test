import 'package:volo_test/features/timer/domain/data_source/timer_data_source.dart';
import 'package:volo_test/features/timer/domain/model/timer.dart';

class TimerDataSource implements ITimerDataSource {
  final List<TimerModel> _timers = [
    TimerModel(
      id: 1,
      createdAt: DateTime.now(),
      taskId: 1,
      startTime: DateTime.now(),
      currentState: TimerCurrentState.running,
    ),
    TimerModel(
      id: 2,
      createdAt: DateTime.now(),
      taskId: 2,
      startTime: DateTime.now(),
      currentState: TimerCurrentState.running,
    ),
  ];

  @override
  Future<List<TimerModel>> getTimers() async {
    return _timers;
  }

  @override
  Future<TimerModel> updateTimer(TimerModel timer) async {
    final index = _timers.indexWhere((e) => e.id == timer.id);
    if (index == -1) {
      throw Exception("Timer with id ${timer.id} not found");
    }
    _timers[index] = timer;
    return timer;
  }

  @override
  Future<TimerModel> createTimer({
    required int projectId,
    required int taskId,
    required String description,
  }) async {
    final timer = TimerModel(
      id: _timers.length + 1,
      taskId: taskId,
      createdAt: DateTime.now(),
      description: description,
    );
    _timers.add(timer);
    return timer;
  }
}
