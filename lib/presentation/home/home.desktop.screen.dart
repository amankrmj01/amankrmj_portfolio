import 'package:amankrmj_portfolio/presentation/home/views/home_bar_view.dart';
import 'package:amankrmj_portfolio/presentation/screens.dart';
import 'package:amankrmj_portfolio/widgets/animated.navigate.button.dart';
import 'package:amankrmj_portfolio/presentation/home/widgets/animated.rotate.icon.dart';
import 'package:amankrmj_portfolio/presentation/home/widgets/code.block.dart';
import 'package:amankrmj_portfolio/presentation/home/widgets/flicker.once.text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../configs/constant_strings.dart';
import '../../utils/k.navigate.dart';
import '../certificate/views/all_certificates_view.dart';
import '../works/views/all_wroks_view.dart';
import 'controllers/home.controller.dart';

class HomeDesktopScreen extends GetView<HomeController> {
  const HomeDesktopScreen({super.key});

  static final GlobalKey _recentWorksKey = GlobalKey();
  static final GlobalKey _recentCertificatesKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                scrollbarTheme: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(Colors.black54),
                  trackColor: WidgetStateProperty.all(Colors.grey[300]),
                  thickness: WidgetStateProperty.all(8),
                  radius: const Radius.circular(8),
                ),
              ),
              child: Scrollbar(
                controller: controller.scrollController,
                thumbVisibility: true,
                thickness: 8,
                radius: const Radius.circular(8),
                interactive: true,
                child: CustomScrollView(
                  controller: controller.scrollController,
                  slivers: [
                    SliverToBoxAdapter(child: SizedBox(height: 120)),
                    SliverToBoxAdapter(
                      child: Center(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          height: Get.height * 0.8,
                          width: Get.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              displayLinesWithCodeBlock(),
                              aboutMeLines(),
                              navigateButtonAndSocialLinks(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    sliverHeaderDisplay(
                      context,
                      title: 'Recent Works',
                      view: const AllWorksView(),
                      sectionKey: _recentWorksKey,
                    ),
                    WorksScreen(),
                    sliverHeaderDisplay(
                      context,
                      title: 'Recent Certificates',
                      view: const AllCertificatesView(),
                      sectionKey: _recentCertificatesKey,
                    ),
                    CertificateScreen(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: topFloatingBar(),
              ),
            ), // Move this to be the first child in the Stack
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter sliverHeaderDisplay(
    BuildContext context, {
    required String title,
    required Widget view,
    required GlobalKey sectionKey,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        key: sectionKey,
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: "ShantellSans",
                fontWeight: FontWeight.bold,
                fontSize: 36,
                letterSpacing: 1.2,
                decoration: TextDecoration.none,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 190,
              child: AnimatedNavigateButton(
                label: "Browse All",
                icon: Icons.arrow_forward,
                borderRadius: 12,
                onTap: () {
                  navigateWithSlideTransition(context, view);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox navigateButtonAndSocialLinks() {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 210,
            child: AnimatedNavigateButton(
              label: 'See My Works',
              icon: Icons.arrow_forward,
              onTap: () {
                final ctx = HomeDesktopScreen._recentWorksKey.currentContext;

                // Cancel any ongoing scroll animations if a ScrollController is attached
                final scrollableState = Scrollable.of(ctx!);
                final position = scrollableState.position;
                if (position is ScrollPositionWithSingleContext &&
                    position.isScrollingNotifier.value) {
                  position.animateTo(
                    position.pixels,
                    duration: Duration.zero,
                    curve: Curves.linear,
                  );
                }
                if (ctx != null) {
                  Scrollable.ensureVisible(
                    ctx,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else {
                  debugPrint('Current context is null');
                }
              },
            ),
          ),
          // Spacer(),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedRotateIcon(
                  firstIcon: Image.asset(
                    'assets/icons/github_outline.png',
                    width: 32,
                    height: 32,
                  ),
                  secondIcon: Image.asset(
                    'assets/icons/github_color.png',
                    width: 32,
                    height: 32,
                  ),
                  label: "Github",
                  url: githubUrl,
                ),
                VerticalDivider(width: 16, thickness: 2, color: Colors.black),
                AnimatedRotateIcon(
                  firstIcon: Image.asset(
                    'assets/icons/linkedin_outline.png',
                    width: 32,
                    height: 32,
                  ),
                  secondIcon: Image.asset(
                    'assets/icons/linkedin_color.png',
                    width: 32,
                    height: 32,
                  ),
                  label: "LinkedIn",
                  url: linkedInUrl,
                ),
                VerticalDivider(width: 16, thickness: 2, color: Colors.black),
                AnimatedRotateIcon(
                  firstIcon: Image.asset(
                    'assets/icons/instagram_outline.png',
                    width: 32,
                    height: 32,
                  ),
                  secondIcon: Image.asset(
                    'assets/icons/instagram_color.png',
                    width: 32,
                    height: 32,
                  ),
                  label: "Instagram",
                  url: instagramUrl,
                ),
                VerticalDivider(width: 16, thickness: 2, color: Colors.black),
                AnimatedRotateIcon(
                  firstIcon: Image.asset(
                    'assets/icons/discord_outline.png',
                    width: 32,
                    height: 32,
                  ),
                  secondIcon: Image.asset(
                    'assets/icons/discord_color.png',
                    width: 32,
                    height: 32,
                  ),
                  label: "Discord",
                  url: discordUrl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox aboutMeLines() {
    return SizedBox(
      height: 200,
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: "$kHomeDisplayLineAboutMe01\n",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                fontFamily: "ShantellSans",
              ),
              children: [
                TextSpan(
                  text: "$kHomeDisplayLineAboutMe02\n",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: "$kHomeDisplayLineAboutMe03\n",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row displayLinesWithCodeBlock() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlickerOnceText(text: kHomeDisplayLine01),
            FlickerOnceText(
              text: kHomeDisplayLine02,
              delay: Duration(milliseconds: 1600),
            ),
          ],
        ),
        Spacer(),
        CodeBlock(),
      ],
    );
  }

  // Remove SliverAppBar and use a fixed header at the top of the Stack
  Widget topFloatingBar() {
    return Container(
      height: 90,
      width: 600,
      alignment: Alignment.bottomCenter,
      // No width property, so it will size to its child
      margin: EdgeInsets.only(bottom: 0),
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      child: Obx(
        () => AnimatedAlign(
          duration: Duration(milliseconds: 400),
          alignment: controller.isScrolling.value
              ? Alignment(0, -4.0)
              : Alignment.bottomCenter,
          child: HomeBarView(),
        ),
      ),
    );
  }
}
