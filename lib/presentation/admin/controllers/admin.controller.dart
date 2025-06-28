import 'package:get/get.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class AdminController extends GetxController {
  //TODO: Implement AdminController

  final count = 0.obs;

  // Add meshGradientController
  late final AnimatedMeshGradientController meshGradientController;

  @override
  void onInit() {
    super.onInit();
    meshGradientController = AnimatedMeshGradientController()..start();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
