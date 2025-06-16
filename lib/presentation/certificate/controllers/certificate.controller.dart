import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      final data = await CertificateService().fetchAll();
      certificates.assignAll(data);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load projects: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      // print('Error fetching projects: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
