import 'package:portfolio/infrastructure/dal/services/abstract.fetch.service.dart';

import '../../../domain/models/experience_model/experience.model.dart';

class ExperienceInfoFetchService extends FetchService<ExperienceModel> {
  ExperienceInfoFetchService()
    : super('experiences', (json) => ExperienceModel.fromJson(json));
}
