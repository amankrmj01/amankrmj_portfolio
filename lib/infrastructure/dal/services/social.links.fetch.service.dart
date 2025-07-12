import 'package:portfolio/infrastructure/dal/services/abstract.fetch.service.dart';
import '../../../domain/models/social_links_model/social.links.model.dart';

class SocialLinksFetchService extends FetchService<SocialLinksModel> {
  SocialLinksFetchService()
    : super('social.links', (json) => SocialLinksModel.fromJson(json));
}
