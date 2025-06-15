import 'package:get/get.dart';

import '../../../../presentation/certificate/controllers/certificate.controller.dart';

class CertificateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CertificateController>(CertificateController());
  }
}
