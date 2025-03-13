import 'package:volo_test/features/project/domain/model/project.dart';

sealed class ProjectState {
  const ProjectState({required this.projects});
  final List<Project> projects;
}

class ProjectsState$Initial extends ProjectState {
  const ProjectsState$Initial() : super(projects: const []);
}

class ProjectsState$Loading extends ProjectState {
  const ProjectsState$Loading({required super.projects});
}

class ProjectsState$Data extends ProjectState {
  const ProjectsState$Data({required super.projects});
}

class ProjectsState$Error extends ProjectState {
  const ProjectsState$Error({required super.projects});
}
