import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volo_test/features/timer/domain/model/order_type.dart';
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
          TimerEvent$Sort() => _sort(event, emit),
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

  Future<void> _sort(TimerEvent$Sort event, Emitter<TimerState> emit) async {
    final timers = state.timers;
    emit(TimerState$Processing(timers: timers, orderType: event.orderType));
    switch (event.orderType) {
      case OrderType.recent:
        timers.sort((a, b) => a.elapsedSeconds.compareTo(b.elapsedSeconds));
      case OrderType.oldest:
        timers.sort((a, b) => b.elapsedSeconds.compareTo(a.elapsedSeconds));
    }
    emit(TimerState$Data(timers: timers, orderType: event.orderType));
  }

  void _startTimer(
      TimerEvent$StartTimer event, Emitter<TimerState> emit) async {
    emit(TimerState$Processing(
        timers: state.timers, orderType: state.orderType));
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
    emit(TimerState$Data(timers: updatedTimers, orderType: state.orderType));
    final result = await _timerRepository
        .updateTimer(updatedTimers.firstWhere((e) => e.id == event.timerId));
    if (result is TimerResult$Success) {
      _startTicker();
      return;
    }
    emit(TimerState$Error(timers: timers, orderType: state.orderType));
  }

  Future<void> _pauseTimer(
      TimerEvent$PauseTimer event, Emitter<TimerState> emit) async {
    emit(TimerState$Processing(
        timers: state.timers, orderType: state.orderType));
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
        );

        return updatedTimer;
      }
      return timer;
    }).toList();

    emit(TimerState$Data(timers: updatedTimers, orderType: state.orderType));
    final result = await _timerRepository
        .updateTimer(updatedTimers.firstWhere((e) => e.id == event.timerId));
    if (result is TimerResult$Success) {
      _stopTickerIfNoActiveTimers();
      return;
    }
    emit(TimerState$Error(timers: timers, orderType: state.orderType));
  }

  Future<void> _getTimers(
      TimerEvent$Get event, Emitter<TimerState> emit) async {
    emit(TimerState$Processing(
        timers: state.timers, orderType: state.orderType));
    final result = await _timerRepository.getTimers();
    switch (result) {
      case TimerResult$Success<List<TimerModel>>():
        final timers = result.data;
        timers.sort((a, b) => a.elapsedSeconds.compareTo(b.elapsedSeconds));
        emit(TimerState$Data(timers: timers, orderType: state.orderType));
      case TimerResult$Failure<List<TimerModel>>():
        emit(
            TimerState$Error(timers: state.timers, orderType: state.orderType));
    }
  }

  void _tick(TimerEvent$Tick event, Emitter<TimerState> emit) {
    emit(TimerState$Processing(
        timers: state.timers, orderType: state.orderType));
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

    emit(TimerState$Data(timers: timers, orderType: state.orderType));
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
