sealed class TimerResult<T> {
  const TimerResult();
}

final class TimerResult$Success<T> extends TimerResult<T> {
  const TimerResult$Success({required this.data});

  final T data;
}

final class TimerResult$Failure<T> extends TimerResult<T> {
  const TimerResult$Failure(
    this.error, [
    this.stackTrace,
  ]);

  final Object error;

  final StackTrace? stackTrace;
}
