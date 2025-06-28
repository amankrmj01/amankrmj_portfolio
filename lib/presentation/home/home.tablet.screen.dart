import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

import '../../configs/constant_strings.dart';
import '../../utils/k.navigate.dart';
import '../../widgets/k.pretty.animated.dart';
import '../../widgets/animated.navigate.button.dart';
import '../../widgets/mesh.background.dart';
import 'controllers/home.controller.dart';
import '../certificate/views/all_certificates_view.dart';
import '../works/views/all_wroks_view.dart';
import '../home/views/home_bar_view.dart';
import '../screens.dart';
import 'widgets/animated.rotate.icon.dart';
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
                child: Scrollbar(
                  controller: controller.scrollController,
                  thumbVisibility: true,
                  thickness: 8,
                  radius: const Radius.circular(8),
                  interactive: true,
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    // physics: CarouselScrollPhysics(),
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
                          height: Get.height,
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
    final minHeight = Get.height > 776 ? Get.height : 1000.0;
    return Center(
      child: SizedBox(
        key: HomeController.homeBarKey,
        height: minHeight,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              _displayLines(),
              CodeBlock(),
              _navigateButtonAndSocialLinks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigateButtonAndSocialLinks() {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 210,
            child: AnimatedNavigateButton(
              borderRadius: 20,
              label: 'See My Works',
              icon: const Icon(Icons.arrow_forward, size: 24),
              onTap: () {
                final ctx = HomeController.recentWorksKey.currentContext;
                if (ctx != null) {
                  Scrollable.ensureVisible(
                    ctx,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    alignment: 0.0,
                  );
                }
              },
              width: 210,
            ),
          ),
          Obx(() => _socialLinksRow()),
        ],
      ),
    );
  }

  Widget _socialLinksRow() {
    final links = controller.socialLinks;
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _animatedIcon(
            outline: 'assets/icons/github_outline.svg',
            color: 'assets/icons/github_color.svg',
            label: "Github",
            url: links['github'] ?? '',
          ),
          _verticalDivider(),
          _animatedIcon(
            outline: 'assets/icons/linkedin_outline.svg',
            color: 'assets/icons/linkedin_color.svg',
            label: "LinkedIn",
            url: links['linkedIn'] ?? '',
          ),
          _verticalDivider(),
          _animatedIcon(
            outline: 'assets/icons/instagram_outline.svg',
            color: 'assets/icons/instagram_color.svg',
            label: "Instagram",
            url: links['instagram'] ?? '',
          ),
          _verticalDivider(),
          _animatedIcon(
            outline: 'assets/icons/discord_outline.svg',
            color: 'assets/icons/discord_color.svg',
            label: "Discord",
            url: links['discord'] ?? '',
          ),
        ],
      ),
    );
  }

  Widget _animatedIcon({
    required String outline,
    required String color,
    required String label,
    required String url,
  }) {
    return AnimatedRotateIcon(
      firstIcon: SvgPicture.asset(outline, width: 32, height: 32),
      secondIcon: SvgPicture.asset(color, width: 32, height: 32),
      label: label,
      url: url,
    );
  }

  Widget _verticalDivider() {
    return const VerticalDivider(
      indent: 6,
      endIndent: 12,
      width: 16,
      thickness: 2,
      color: Colors.black,
      radius: BorderRadius.all(Radius.circular(40)),
    );
  }

  Widget _displayLines() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: KPrettyAnimated(),
        ),
        SizedBox(height: 100),
        _aboutMeLines(),
      ],
    );
  }

  Widget _aboutMeLines() {
    return SizedBox(
      height: 200,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: "$kHomeDisplayLineAboutMe01\n",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontFamily: "ShantellSans",
              ),
              children: [
                TextSpan(
                  text: "$kHomeDisplayLineAboutMe02\n",
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: "$kHomeDisplayLineAboutMe03\n",
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
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
              ? const Alignment(0, -5.0)
              : Alignment.bottomCenter,
          child: HomeBarView(),
        ),
      ),
    );
  }
}

class SliverHeaderSection extends StatelessWidget {
  final String title;
  final Widget view;
  final GlobalKey sectionKey;
  final BuildContext context;

  const SliverHeaderSection({
    super.key,
    required this.title,
    required this.view,
    required this.sectionKey,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Obx(
      () => Container(
        key: sectionKey,
        height: 124,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          crossAxisAlignment: controller.currentDevice.value == Device.Desktop
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "ShantellSans",
                fontWeight: FontWeight.bold,
                fontSize: 36,
                letterSpacing: 1.2,
                decoration: TextDecoration.none,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 190,
              child: AnimatedNavigateButton(
                label: "Browse All",
                icon: const Icon(Icons.arrow_forward),
                borderRadius: 12,
                onTap: () => navigateWithSlideTransition(this.context, view),
                width: 190,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
