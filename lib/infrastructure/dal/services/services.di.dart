import 'package:amankrmj_portfolio/infrastructure/dal/services/quote_service.dart';
import 'package:amankrmj_portfolio/infrastructure/dal/services/social_link_service.dart';
import 'package:get/get.dart';

import 'certificate_service.dart';
import 'project_service.dart';

class ServiceC {
  static void setupServiceLocator() {
    Get.put<CertificateService>(CertificateService(), permanent: true);
    Get.put<ProjectService>(ProjectService(), permanent: true);
    Get.put<QuoteService>(QuoteService(), permanent: true);
    Get.put<SocialLinkService>(SocialLinkService(), permanent: true);
  }
}
