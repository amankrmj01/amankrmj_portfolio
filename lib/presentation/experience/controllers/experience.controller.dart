import 'package:get/get.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:portfolio/infrastructure/navigation/bindings/controllers/info.fetch.controller.dart';

import '../../../domain/models/experience.model.dart';

class ExperienceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final hoveredIndex = RxnInt();
  late final AnimatedMeshGradientController meshGradientController;
  late var experiences = <ExperienceModel>[].obs;
  final InfoFetchController infoFetchController =
      Get.find<InfoFetchController>();
  late var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = infoFetchController.isExperienceLoading.value;
    experiences.value = infoFetchController.experiences;
    ever(infoFetchController.isExperienceLoading, (val) {
      isLoading.value = val;
    });
    ever(infoFetchController.experiences, (val) {
      experiences.value = val;
    });
    meshGradientController = AnimatedMeshGradientController()..start();
  }

  @override
  void onClose() {
    meshGradientController.dispose();
    super.onClose();
  }
}
