import 'package:volo_test/features/timer/domain/model/timer.dart';
import 'package:volo_test/features/timer/domain/model/timer_result.dart';

abstract interface class ITimerRepository {
  Future<TimerResult<List<TimerModel>>> getTimers();
  Future<TimerResult<TimerModel>> updateTimer(TimerModel timer);
}
