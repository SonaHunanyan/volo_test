import 'package:volo_test/features/timer/domain/model/order_type.dart';
import 'package:volo_test/features/timer/domain/model/timer.dart';
import 'package:volo_test/features/timer/presentation/model/timer_error.dart';

sealed class TimerState {
  const TimerState({
    required this.timers,
    required this.orderType,
  });
  final List<TimerModel> timers;
  final OrderType orderType;
}

class TimerState$Initial extends TimerState {
  const TimerState$Initial()
      : super(timers: const [], orderType: OrderType.recent);
}

class TimerState$Processing extends TimerState {
  const TimerState$Processing(
      {required super.timers, required super.orderType});
}

class TimerState$Data extends TimerState {
  const TimerState$Data({required super.timers, required super.orderType});
}

class TimerState$Error extends TimerState {
  const TimerState$Error(
      {required this.error, required super.timers, required super.orderType});
  final TimerError error;
}

class TimerState$Created extends TimerState {
  const TimerState$Created({required super.timers, required super.orderType});
}
