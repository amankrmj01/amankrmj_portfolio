import 'package:get/get.dart';

class HomeController extends GetxController {
  final hoverStates = List<bool>.filled(5, false).obs;

  void setHover(int index, bool isHovered) {
    hoverStates[index] = isHovered;
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
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
