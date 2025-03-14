import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volo_test/features/project/domain/model/project.dart';
import 'package:volo_test/features/project/domain/model/project_result.dart';
import 'package:volo_test/features/project/domain/repository/project_repository.dart';
import 'package:volo_test/features/project/presentation/bloc/project_event.dart';
import 'package:volo_test/features/project/presentation/bloc/project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc({required IProjectRepository projectRepository})
      : _projectRepository = projectRepository,
        super(const ProjectsState$Initial()) {
    on<ProjectEvent>((event, emit) => switch (event) {
          ProjectsEvent$Get() => _getProjects(event, emit),
        });

    add(const ProjectsEvent$Get());
  }

  final IProjectRepository _projectRepository;

  Future<void> _getProjects(
      ProjectsEvent$Get event, Emitter<ProjectState> emit) async {
    emit(ProjectsState$Loading(projects: state.projects));
    final result = await _projectRepository.getProjects();
    switch (result) {
      case ProjectResult$Success<List<Project>>():
        emit(ProjectsState$Data(projects: result.data));
      case ProjectResult$Failure<List<Project>>():
        emit(ProjectsState$Error(projects: state.projects));
    }
  }
}
