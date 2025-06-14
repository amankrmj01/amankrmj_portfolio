import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home.desktop.screen.dart';
import 'home.mobile.screen.dart';
import 'home.tablet.screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return const HomeMobileScreen();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return const HomeTabletScreen();
        } else {
          return const HomeDesktopScreen();
        }
      },
    );
  }
}
