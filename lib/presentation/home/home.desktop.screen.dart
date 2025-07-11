import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/about_me/about_me.screen.dart';
import 'package:portfolio/presentation/home/views/home_bar_view.dart';
import 'package:portfolio/presentation/home/widgets/code.block.dart';
import 'package:portfolio/presentation/home/widgets/widgets.dart';

import '../../widgets/k.pretty.animated.dart';
import '../../widgets/mesh.background.dart';
import '../certificate/certificate.screen.dart';
import '../certificate/views/all_certificates_view.dart';
import '../footer/footer.screen.dart';
import '../works/views/all_wroks_view.dart';
import '../works/works.screen.dart';
import 'controllers/home.controller.dart';
// Import the common widgets

class HomeDesktopScreen extends GetView<HomeController> {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(Colors.black54),
        trackColor: WidgetStateProperty.all(Colors.grey[300]),
        thickness: WidgetStateProperty.all(8),
        radius: const Radius.circular(8),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(child: SharedMeshBackground()),
            Theme(
              data: theme,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: Scrollbar(
                  controller: controller.scrollController,
                  thumbVisibility: true,
                  thickness: 8,
                  radius: const Radius.circular(8),
                  interactive: true,
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      children: [
                        _mainSection(context),
                        HeaderSection(
                          context: context,
                          title: 'Recent Works',
                          view: const AllWorksView(),
                          sectionKey: HomeController.recentWorksKey,
                        ),
                        const WorksScreen(),
                        HeaderSection(
                          context: context,
                          title: 'Recent Certificates',
                          view: const AllCertificatesView(),
                          sectionKey: HomeController.recentCertificatesKey,
                        ),
                        const CertificateScreen(),
                        SizedBox(
                          key: HomeController.aboutMeKey,
                          height: MediaQuery.of(context).size.height,
                          child: const AboutMeScreen(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: const FooterScreen(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: _topFloatingBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainSection(BuildContext context) {
    var minHeight = MediaQuery.of(context).size.height > 776
        ? MediaQuery.of(context).size.height
        : 776.0;
    return Center(
      child: SizedBox(
        key: HomeController.homeKey,
        height: minHeight,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 700,
                          minWidth: 200,
                          maxHeight: 240,
                          minHeight: 240,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: KPrettyAnimated(),
                        ),
                      ),
                      aboutMeLines(width: 700, height: 240),
                    ],
                  ),
                  const Spacer(),
                  const CodeBlock(),
                ],
              ),
              navigateButtonAndSocialLinks(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topFloatingBar() {
    return Container(
      height: 80,
      width: 640,
      alignment: Alignment.bottomCenter,
      color: Colors.transparent,
      child: Obx(
        () => AnimatedAlign(
          duration: const Duration(milliseconds: 400),
          alignment: controller.isScrolling.value
              ? const Alignment(0, -5.5)
              : Alignment.bottomCenter,
          child: HomeBarView(),
        ),
      ),
    );
  }
}
