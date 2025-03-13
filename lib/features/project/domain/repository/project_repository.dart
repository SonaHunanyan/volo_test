import 'package:volo_test/features/project/domain/model/project.dart';
import 'package:volo_test/features/project/domain/model/project_result.dart';

abstract interface class IProjectRepository {
  Future<ProjectResult<List<Project>>> getProjects();
}
