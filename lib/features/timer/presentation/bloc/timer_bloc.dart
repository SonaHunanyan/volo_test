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
        });
  }
  final ITimerRepository _timerRepository;

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
}
