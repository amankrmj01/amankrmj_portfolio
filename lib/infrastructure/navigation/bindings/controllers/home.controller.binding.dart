import 'package:portfolio/presentation/certificate/controllers/certificate.controller.dart';
import 'package:portfolio/presentation/works/controllers/works.controller.dart';
import 'package:get/get.dart';

import '../../../../presentation/about_me/controllers/about_me.controller.dart';
import '../../../../presentation/footer/controllers/footer.controller.dart';
import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CertificateController>(() => CertificateController());
    Get.lazyPut<WorksController>(() => WorksController());
    Get.lazyPut<FooterController>(() => FooterController());
    Get.put(AboutMeController());
  }
}
