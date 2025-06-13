import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.PROJECT_DETAILS,
      page: () => const ProjectDetailsScreen(),
      binding: ProjectDetailsControllerBinding(),
    ),
    GetPage(
      name: Routes.EXPERIENCE,
      page: () => const ExperienceScreen(),
      binding: ExperienceControllerBinding(),
    ),
    GetPage(
      name: Routes.CONTACT_ME,
      page: () => const ContactMeScreen(),
      binding: ContactMeControllerBinding(),
    ),
    GetPage(
      name: Routes.CERTIFICATE,
      page: () => const CertificateScreen(),
      binding: CertificateControllerBinding(),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => const AboutScreen(),
      binding: AboutControllerBinding(),
    ),
    GetPage(
      name: Routes.PROJECTS,
      page: () => const ProjectsScreen(),
      binding: ProjectsControllerBinding(),
    ),
  ];
}
