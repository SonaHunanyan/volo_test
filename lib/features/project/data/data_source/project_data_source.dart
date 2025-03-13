import 'package:volo_test/features/project/domain/data_source/project_data_source.dart';
import 'package:volo_test/features/project/domain/model/project.dart';

class ProjectDataSource implements IProjectDataSource {
  @override
  Future<List<Project>> getProjects() async {
    return [const Project(id: 1, name: 'SO056 - Booqio V2')];
  }
}
