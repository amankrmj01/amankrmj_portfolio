import 'package:portfolio/domain/models/project.model.dart';
import 'package:get/get.dart';
import 'package:portfolio/infrastructure/navigation/bindings/controllers/info.fetch.controller.dart';

class WorksController extends GetxController {
  late var projects = <ProjectModel>[].obs;
  late var isLoading = false.obs;
  final InfoFetchController infoFetchController =
      Get.find<InfoFetchController>();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = infoFetchController.isProjectsLoading.value;
    projects.value = infoFetchController.projects;
    ever(infoFetchController.isProjectsLoading, (val) {
      isLoading.value = val;
    });
    ever(infoFetchController.projects, (val) {
      projects.value = val;
    });
  }
}
