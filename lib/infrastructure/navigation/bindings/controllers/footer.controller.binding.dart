import 'package:get/get.dart';

import '../../../../presentation/footer/controllers/footer.controller.dart';

class FooterControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FooterController>(() => FooterController());
  }
}
