class Task {
  const Task({
    required this.id,
    required this.projectId,
    required this.deadline,
    required this.assignedTo,
  });
  final int id;
  final int projectId;
  final DateTime deadline;
  final String assignedTo;

  Task copyWith({
    int? id,
    int? projectId,
    DateTime? deadline,
    String? assignedTo,
  }) {
    return Task(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      deadline: deadline ?? this.deadline,
      assignedTo: assignedTo ?? this.assignedTo,
    );
  }
}
