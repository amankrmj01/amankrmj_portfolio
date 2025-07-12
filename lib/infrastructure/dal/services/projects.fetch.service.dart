import 'package:portfolio/infrastructure/dal/services/abstract.fetch.service.dart';

import '../../../domain/models/project_model/project.model.dart';

class ProjectsFetchService extends FetchService<ProjectModel> {
  ProjectsFetchService()
    : super('projects', (json) => ProjectModel.fromJson(json));
}
