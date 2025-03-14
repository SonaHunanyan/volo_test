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
