import '../../../domain/models/about_me_info_model/about.me.info.model.dart';
import 'abstract.fetch.service.dart';

class AboutMeInfoFetchService extends FetchService<AboutMeInfoModel> {
  AboutMeInfoFetchService()
    : super('about.me.info', (json) => AboutMeInfoModel.fromJson(json));
}
