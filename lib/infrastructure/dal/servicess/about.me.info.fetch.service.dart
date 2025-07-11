import 'package:portfolio/domain/models/about.me.info.model.dart';
import 'package:portfolio/infrastructure/dal/servicess/abstract.fetch.service.dart';

class AboutMeInfoFetchService extends FetchService<AboutMeInfoModel> {
  AboutMeInfoFetchService()
    : super('about.me.info', (json) => AboutMeInfoModel.fromJson(json));
}
