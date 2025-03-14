class TimerModel {
  const TimerModel({
    required this.id,
    required this.startTime,
    required this.taskId,
    this.isPlaying = false,
    this.isFavorite = false,
    this.description,
    this.endTime,
  });
  final int id;
  final DateTime startTime;
  final DateTime? endTime;
  final String? description;
  final bool isPlaying;
  final int taskId;
  final bool isFavorite;
}
