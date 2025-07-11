import 'package:portfolio/infrastructure/dal/servicess/abstract.fetch.service.dart';
import '../../../domain/models/social_links.model.dart';

class SocialLinksFetchService extends FetchService<SocialLinksModel> {
  SocialLinksFetchService()
    : super('social.links', (json) => SocialLinksModel.fromJson(json));
}
