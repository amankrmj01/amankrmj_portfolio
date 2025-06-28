import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/home/controllers/home.controller.dart';

import 'home.desktop.screen.dart';
import 'home.mobile.screen.dart';
import 'home.tablet.screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final width = MediaQuery.of(context).size.width;
    if (width < 900) {
      homeController.currentDevice.value = Device.Mobile;
      return const HomeMobileScreen();
    } else if (width < 1300) {
      homeController.currentDevice.value = Device.Tablet;
      return const HomeTabletScreen();
    } else {
      homeController.currentDevice.value = Device.Desktop;
      return HomeDesktopScreen();
    }
  }
}
