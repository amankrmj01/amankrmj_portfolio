import 'package:flutter/material.dart';

import 'home.desktop.screen.dart';
import 'home.mobile.screen.dart';
import 'home.tablet.screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return const HomeMobileScreen();
    } else if (width < 1100) {
      return const HomeTabletScreen();
    } else {
      return HomeDesktopScreen();
    }
  }
}
