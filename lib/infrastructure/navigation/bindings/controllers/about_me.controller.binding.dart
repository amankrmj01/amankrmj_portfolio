import 'package:get/get.dart';

import '../../../../presentation/about_me/controllers/about_me.controller.dart';

class AboutMeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutMeController>(
      () => AboutMeController(),
    );
  }
}
