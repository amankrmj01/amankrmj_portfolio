import 'package:get/get.dart';
import '../../../domain/models/certificate_model/certificate.model.dart';
import '../../../infrastructure/navigation/bindings/controllers/info.fetch.controller.dart';

class CertificateController extends GetxController {
  final InfoFetchController infoFetchController =
      Get.find<InfoFetchController>();
  late var isLoading = false.obs;
  late var certificates = <CertificateModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = infoFetchController.isCertificatesLoading.value;
    certificates.value = infoFetchController.certificates;
    ever(infoFetchController.isCertificatesLoading, (val) {
      isLoading.value = val;
    });
    ever(infoFetchController.certificates, (val) {
      certificates.value = val;
    });
  }
}
