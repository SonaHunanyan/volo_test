import 'package:volo_test/features/timer/domain/data_source/timer_data_source.dart';
import 'package:volo_test/features/timer/domain/model/timer.dart';
import 'package:volo_test/features/timer/domain/model/timer_result.dart';
import 'package:volo_test/features/timer/domain/repository/timer_repository.dart';

class TimerRepository implements ITimerRepository {
  const TimerRepository({required ITimerDataSource dataSource})
      : _dataSource = dataSource;
  final ITimerDataSource _dataSource;
  @override
  Future<TimerResult<List<TimerModel>>> getTimers() async {
    try {
      final timers = await _dataSource.getTimers();
      return TimerResult$Success(data: timers);
    } catch (error, stackTrace) {
      return TimerResult$Failure(error, stackTrace);
    }
  }

  @override
  Future<TimerResult<TimerModel>> updateTimer(TimerModel timer) async {
    try {
      final timerUpdated = await _dataSource.updateTimer(timer);
      return TimerResult$Success(data: timerUpdated);
    } catch (error, stackTrace) {
      return TimerResult$Failure(error, stackTrace);
    }
  }
}
