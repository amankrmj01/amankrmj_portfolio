import 'package:get/get.dart';

import '../../../../presentation/works/controllers/works.controller.dart';

class WorksControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorksController>(
      () => WorksController(),
    );
  }
}
