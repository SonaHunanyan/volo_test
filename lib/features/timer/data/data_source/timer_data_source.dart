import 'package:volo_test/features/timer/domain/data_source/timer_data_source.dart';
import 'package:volo_test/features/timer/domain/model/timer.dart';

class TimerDataSource implements ITimerDataSource {
  final _timers = <TimerModel>[
    TimerModel(id: 1, startTime: DateTime.now(), taskId: 1),
  ];
  @override
  Future<List<TimerModel>> getTimers() async {
    return _timers;
  }

  @override
  Future<TimerModel> updateTimer(TimerModel timer) async {
    final index = _timers.lastIndexWhere((e) => e.id == timer.id);
    _timers[index] = timer;
    return timer;
  }
}
