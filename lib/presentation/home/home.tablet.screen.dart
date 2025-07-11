import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/home/widgets/widgets.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../widgets/k.pretty.animated.dart';
import '../../widgets/mesh.background.dart';
import 'controllers/home.controller.dart';
import '../home/views/home_bar_view.dart';
import '../screens.dart';
import 'widgets/code.block.dart';

class HomeTabletScreen extends GetView<HomeController> {
  const HomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(Colors.white70),
        trackColor: WidgetStateProperty.all(Colors.white38),
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
                child: Listener(
                  onPointerSignal: (pointerSignal) {
                    if (pointerSignal is PointerScrollEvent) {
                      if (controller.isScrolling.value) {
                        // Forward scroll event to homeController's scrollController
                        controller.scrollController.position.moveTo(
                          controller.scrollController.offset +
                              pointerSignal.scrollDelta.dy,
                        );
                      }
                    }
                  },
                  child: Obx(
                    () => Scrollbar(
                      controller: controller.scrollController,
                      thumbVisibility: controller.isScrolling.value,
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
                              route: Routes.ALL_PROJECTS,
                              sectionKey: HomeController.recentWorksKey,
                            ),
                            const WorksScreen(),
                            HeaderSection(
                              context: context,
                              title: 'Recent Certificates',
                              route: Routes.ALL_CERTIFICATES,
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
    var minHeight = MediaQuery.of(context).size.height;
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
              const SizedBox(height: 100),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: KPrettyAnimated(),
                ),
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.bottomCenter,
                      child: aboutMeLines(),
                    ),
                  ),
                  const SizedBox(width: 40),
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
