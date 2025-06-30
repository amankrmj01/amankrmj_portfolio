import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/home/views/home_menu_bar_view.dart';
import 'package:portfolio/presentation/home/widgets/widgets.dart';
import '../../widgets/k.pretty.animated.dart';
import '../../widgets/mesh.background.dart';
import 'controllers/home.controller.dart';
import '../certificate/views/all_certificates_view.dart';
import '../works/views/all_wroks_view.dart';
import '../home/views/home_bar_view.dart';
import '../screens.dart';
import 'widgets/code.block.dart';

class HomeMobileScreen extends GetView<HomeController> {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF1A1A2E)),

      drawer: HomeMenuBarView(),
      backgroundColor: const Color(0xFF1A1A2E),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(child: SharedMeshBackground()),
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                _mainSection(context),
                SliverHeaderSection(
                  context: context,
                  title: 'Recent Works',
                  view: const AllWorksView(),
                  sectionKey: HomeController.recentWorksKey,
                ),
                const WorksScreen(),
                SliverHeaderSection(
                  context: context,
                  title: 'Recent Certificates',
                  view: const AllCertificatesView(),
                  sectionKey: HomeController.recentCertificatesKey,
                ),
                const CertificateScreen(),
                SizedBox(
                  key: HomeController.footerKey,
                  height: MediaQuery.of(context).size.height,
                  child: const FooterScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainSection(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    var minHeight = MediaQuery.of(context).size.height > 1000
        ? MediaQuery.of(context).size.height
        : 1000.0;
    return Center(
      child: SizedBox(
        key: HomeController.homeBarKey,
        height: controller.currentDevice.value == Device.Mobile
            ? MediaQuery.of(context).size.height - kToolbarHeight
            : minHeight,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              KPrettyAnimated(),
              const SizedBox(height: 120),
              FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
                child: aboutMeLines(width: 500, height: 200),
              ),
              FittedBox(
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
                child: CodeBlock(),
              ),
              const SizedBox(height: 40),
              socialLinksRow(controller),
            ],
          ),
        ),
      ),
    );
  }
}
