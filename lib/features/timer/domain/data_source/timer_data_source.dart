import 'package:volo_test/features/timer/domain/model/timer.dart';

abstract interface class ITimerDataSource {
  Future<List<TimerModel>> getTimers();
  Future<TimerModel> updateTimer(TimerModel timer);
  Future<TimerModel> createTimer({
    required int projectId,
    required int taskId,
    required String description,
  });
}
