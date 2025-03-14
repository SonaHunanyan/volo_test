import 'package:volo_test/features/timer/domain/model/timer.dart';

sealed class TimerState {
  const TimerState({required this.timers});
  final List<TimerModel> timers;
}

class TimerState$Initial extends TimerState {
  const TimerState$Initial() : super(timers: const []);
}

class TimerState$Loading extends TimerState {
  const TimerState$Loading({required super.timers});
}

class TimerState$Data extends TimerState {
  const TimerState$Data({required super.timers});
}

class TimerState$Error extends TimerState {
  const TimerState$Error({required super.timers});
}
