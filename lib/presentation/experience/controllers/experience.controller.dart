import 'package:get/get.dart';

class ExperienceController extends GetxController {
  //TODO: Implement ExperienceController

  final count = 0.obs;
  final hoveredIndex = RxnInt();

  void increment() => count.value++;
}
