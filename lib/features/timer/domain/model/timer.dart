enum TimerCurrentState { running, paused }

class TimerModel {
  TimerModel({
    required this.id,
    required this.taskId,
    required this.createdAt,
    this.isFavorite = false,
    this.startTime,
    this.currentState = TimerCurrentState.paused,
    this.elapsedSeconds = 0,
    this.description,
    this.completedAt,
  });
  final int id;
  final String? description;
  final int taskId;
  final DateTime createdAt;
  final TimerCurrentState currentState;
  final int elapsedSeconds;
  final DateTime? startTime;
  final bool isFavorite;
  final DateTime? completedAt;

  TimerModel copyWith({
    TimerCurrentState? currentState,
    int? elapsedSeconds,
    bool? isFavorite,
    DateTime? startTime,
    DateTime? completedAt,
  }) {
    return TimerModel(
      id: id,
      description: description,
      taskId: taskId,
      createdAt: createdAt,
      startTime: startTime ?? this.startTime,
      completedAt: completedAt ?? this.completedAt,
      currentState: currentState ?? this.currentState,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
