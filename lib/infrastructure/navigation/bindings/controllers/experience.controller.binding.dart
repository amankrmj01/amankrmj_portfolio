import 'package:get/get.dart';

import '../../../../presentation/experience/controllers/experience.controller.dart';

class ExperienceControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExperienceController>(
      () => ExperienceController(),
    );
  }
}
