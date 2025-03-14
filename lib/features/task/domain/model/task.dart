class Task {
  const Task({
    required this.id,
    required this.name,
    required this.projectId,
    required this.deadline,
    required this.assignedTo,
    this.isFavorite = false,
  });
  final int id;
  final int projectId;
  final DateTime deadline;
  final String assignedTo;
  final String name;
  final bool isFavorite;

  Task copyWith({
    int? id,
    String? name,
    int? projectId,
    DateTime? deadline,
    String? assignedTo,
    bool? isFavorite,
  }) {
    return Task(
      id: id ?? this.id,
      isFavorite: isFavorite ?? this.isFavorite,
      name: name ?? this.name,
      projectId: projectId ?? this.projectId,
      deadline: deadline ?? this.deadline,
      assignedTo: assignedTo ?? this.assignedTo,
    );
  }
}
