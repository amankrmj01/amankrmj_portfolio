import 'package:portfolio/domain/models/project.model.dart';
import 'package:portfolio/infrastructure/dal/servicess/abstract.fetch.service.dart';

class ProjectsFetchService extends FetchService<ProjectModel> {
  ProjectsFetchService()
    : super('projects', (json) => ProjectModel.fromJson(json));
}
