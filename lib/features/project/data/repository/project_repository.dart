import 'package:volo_test/features/project/domain/data_source/project_data_source.dart';
import 'package:volo_test/features/project/domain/model/project.dart';
import 'package:volo_test/features/project/domain/model/project_result.dart';
import 'package:volo_test/features/project/domain/repository/project_repository.dart';

class ProjectRepository implements IProjectRepository {
  const ProjectRepository({required IProjectDataSource dataSource})
      : _dataSource = dataSource;
  final IProjectDataSource _dataSource;
  @override
  Future<ProjectResult<List<Project>>> getProjects() async {
    try {
      final projects = await _dataSource.getProjects();
      return ProjectResult$Success(data: projects);
    } catch (error, stackTrace) {
      return ProjectResult$Failure(error, stackTrace);
    }
  }
}
