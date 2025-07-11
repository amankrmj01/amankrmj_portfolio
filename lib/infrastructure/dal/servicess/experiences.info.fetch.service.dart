import 'package:portfolio/domain/models/experience.model.dart';
import 'package:portfolio/infrastructure/dal/servicess/abstract.fetch.service.dart';

class ExperienceInfoFetchService extends FetchService<ExperienceModel> {
  ExperienceInfoFetchService()
    : super('experiences', (json) => ExperienceModel.fromJson(json));
}
