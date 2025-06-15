import 'package:get/get.dart';

import '../../../domain/models/certificate.model.dart';
import '../../../infrastructure/dal/services/certificate_service.dart';

class CertificateController extends GetxController {
  Future<List<CertificateModel>> fetchCertificates() async {
    final service = Get.find<CertificateService>();
    return await service.fetchAll();
  }
}
