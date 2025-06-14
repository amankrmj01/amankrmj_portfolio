import 'package:amankrmj_portfolio/presentation/certificate/controllers/certificate.controller.dart';
import 'package:amankrmj_portfolio/presentation/works/controllers/works.controller.dart';
import 'package:get/get.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CertificateController>(() => CertificateController());
    Get.lazyPut<WorksController>(() => WorksController());
  }
}
