import 'package:volo_test/features/timer/domain/model/order_type.dart';

sealed class TimerEvent {
  const TimerEvent();
}

class TimerEvent$Get extends TimerEvent {
  const TimerEvent$Get();
}

class TimerEvent$StartTimer extends TimerEvent {
  const TimerEvent$StartTimer(this.timerId);
  final int timerId;
}

class TimerEvent$PauseTimer extends TimerEvent {
  const TimerEvent$PauseTimer(this.timerId);
  final int timerId;
}

class TimerEvent$Tick extends TimerEvent {
  const TimerEvent$Tick();
}

class TimerEvent$Sort extends TimerEvent {
  const TimerEvent$Sort({required this.orderType});
  final OrderType orderType;
}

class TimerEvent$Create extends TimerEvent {
  const TimerEvent$Create({
    required this.description,
    required this.projectId,
    required this.taskId,
  });
  final int projectId;
  final int taskId;
  final String description;
}
