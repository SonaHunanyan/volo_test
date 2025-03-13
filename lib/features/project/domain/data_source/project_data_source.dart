import 'package:volo_test/features/project/domain/model/project.dart';

abstract interface class IProjectDataSource {
  Future<List<Project>> getProjects();
}
