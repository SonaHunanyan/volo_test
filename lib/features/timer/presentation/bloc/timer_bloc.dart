import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volo_test/features/timer/domain/model/timer.dart';
import 'package:volo_test/features/timer/domain/model/timer_result.dart';
import 'package:volo_test/features/timer/domain/repository/timer_repository.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_event.dart';
import 'package:volo_test/features/timer/presentation/bloc/timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc({required ITimerRepository timerRepository})
      : _timerRepository = timerRepository,
        super(const TimerState$Initial()) {
    on<TimerEvent>((event, emit) => switch (event) {
          TimerEvent$Get() => _getTimers(event, emit),
          TimerEvent$StartTimer() => _startTimer(event, emit),
          TimerEvent$PauseTimer() => _pauseTimer(event, emit),
          TimerEvent$Tick() => _tick(event, emit),
        });

    add(const TimerEvent$Get());
  }
  final ITimerRepository _timerRepository;
  Timer? _ticker;

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }

  void _startTimer(
      TimerEvent$StartTimer event, Emitter<TimerState> emit) async {
    emit(TimerState$Loading(timers: state.timers));
    final timers = state.timers;
    final updatedTimers = state.timers.map((timer) {
      if (timer.id == event.timerId) {
        if (timer.currentState == TimerCurrentState.running) return timer;

        final now = DateTime.now();
        final updatedTimer = timer.copyWith(
          currentState: TimerCurrentState.running,
          startTime: now,
        );
        return updatedTimer;
      }
      return timer;
    }).toList();
    emit(TimerState$Data(timers: updatedTimers));
    final result = await _timerRepository
        .updateTimer(updatedTimers.firstWhere((e) => e.id == event.timerId));
    if (result is TimerResult$Success) {
      _startTicker();
      return;
    }
    emit(TimerState$Error(timers: timers));
  }

  Future<void> _pauseTimer(
      TimerEvent$PauseTimer event, Emitter<TimerState> emit) async {
    emit(TimerState$Loading(timers: state.timers));
    final timers = state.timers;
    final updatedTimers = state.timers.map((timer) {
      if (timer.id == event.timerId) {
        if (timer.currentState != TimerCurrentState.running) return timer;

        final now = DateTime.now();
        final elapsed =
            timer.elapsedSeconds + now.difference(timer.startTime!).inSeconds;

        final updatedTimer = timer.copyWith(
          currentState: TimerCurrentState.paused,
          elapsedSeconds: elapsed,
          startTime: null,
        );

        return updatedTimer;
      }
      return timer;
    }).toList();

    emit(TimerState$Data(timers: updatedTimers));
    final result = await _timerRepository
        .updateTimer(updatedTimers.firstWhere((e) => e.id == event.timerId));
    if (result is TimerResult$Success) {
      _stopTickerIfNoActiveTimers();
      return;
    }
    emit(TimerState$Error(timers: timers));
  }

  Future<void> _getTimers(
      TimerEvent$Get event, Emitter<TimerState> emit) async {
    emit(TimerState$Loading(timers: state.timers));
    final result = await _timerRepository.getTimers();
    switch (result) {
      case TimerResult$Success<List<TimerModel>>():
        emit(TimerState$Data(timers: result.data));
      case TimerResult$Failure<List<TimerModel>>():
        emit(TimerState$Error(timers: state.timers));
    }
  }

  void _tick(TimerEvent$Tick event, Emitter<TimerState> emit) {
    emit(TimerState$Loading(timers: state.timers));
    final now = DateTime.now();
    final timers = state.timers.map((timer) {
      if (timer.currentState == TimerCurrentState.running) {
        final newElapsed =
            timer.elapsedSeconds + now.difference(timer.startTime!).inSeconds;

        return timer.copyWith(
          elapsedSeconds: newElapsed,
          startTime: now,
        );
      }
      return timer;
    }).toList();

    emit(TimerState$Data(timers: timers));
  }

  void _stopTickerIfNoActiveTimers() {
    final hasRunningTimers = state.timers
        .any((timer) => timer.currentState == TimerCurrentState.running);
    if (!hasRunningTimers) {
      _ticker?.cancel();
      _ticker = null;
    }
  }

  void _startTicker() {
    _ticker ??= Timer.periodic(
        const Duration(seconds: 1), (_) => add(const TimerEvent$Tick()));
  }
}
