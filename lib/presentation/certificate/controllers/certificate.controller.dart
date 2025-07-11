import 'package:get/get.dart';
import 'dart:developer';
import '../../../domain/models/certificate.model.dart';
import '../../../infrastructure/dal/services/certificate_service.dart';

class CertificateController extends GetxController {
  final certificates = <CertificateModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCertificates();
  }

  Future<void> fetchCertificates() async {
    isLoading.value = true;
    try {
      final data = await Get.find<CertificateService>().fetchAll();
      certificates.assignAll(data);
    } catch (e) {
      fetchCertificates();
      log('Error fetching projects: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
