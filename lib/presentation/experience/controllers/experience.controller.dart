import 'package:get/get.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class ExperienceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement ExperienceController

  final count = 0.obs;
  final hoveredIndex = RxnInt();
  late final AnimatedMeshGradientController meshGradientController;

  void increment() => count.value++;

  @override
  void onInit() {
    super.onInit();
    meshGradientController = AnimatedMeshGradientController()..start();
  }

  @override
  void onClose() {
    meshGradientController.dispose();
    super.onClose();
  }
}
