import 'package:get/get.dart';

import '../../../../presentation/contact_me/controllers/contact_me.controller.dart';

class ContactMeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactMeController>(
      () => ContactMeController(),
    );
  }
}
