import 'package:amankrmj_portfolio/infrastructure/theme/dark_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'infrastructure/dal/services/services.di.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  ServiceC.setupServiceLocator();
  var initialRoute = await Routes.initialRoute;
  
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: kDarkTheme,
    );
  }
}
