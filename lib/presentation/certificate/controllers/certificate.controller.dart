import 'package:get/get.dart';

import '../../../domain/models/certificate_info.dart';
import '../../../infrastructure/dal/services/certificate_service.dart';

class CertificateController extends GetxController {
  Future<List<CertificateInfo>> fetchCertificates() async {
    final service = Get.find<CertificateService>();
    return await service.fetchAll();
  }
}
