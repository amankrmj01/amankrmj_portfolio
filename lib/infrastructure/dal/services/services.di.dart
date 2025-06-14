import 'package:get/get.dart';

import 'certificate_service.dart';
import 'project_service.dart';

class ServiceC {
  static void setupServiceLocator() {
    Get.put<CertificateService>(CertificateService(), permanent: true);
    Get.put<ProjectService>(ProjectService(), permanent: true);
  }
}
