import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../presentation/certificate/controllers/certificate.controller.dart';
import '../../../../infrastructure/dal/services/certificate_service.dart';

class CertificateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CertificateController>(CertificateController());
  }
}
