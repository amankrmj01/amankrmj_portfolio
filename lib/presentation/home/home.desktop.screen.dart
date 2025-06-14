import 'package:amankrmj_portfolio/presentation/home/views/home_bar_view.dart';
import 'package:amankrmj_portfolio/widgets/animated.navigate.button.dart';
import 'package:amankrmj_portfolio/presentation/home/widgets/animated.rotate.icon.dart';
import 'package:amankrmj_portfolio/presentation/home/widgets/code.block.dart';
import 'package:amankrmj_portfolio/presentation/home/widgets/flicker.once.text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../configs/constant_strings.dart';
import 'controllers/home.controller.dart';

class HomeDesktopScreen extends GetView<HomeController> {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   bottom: 10, // 10 pixels from the bottom
            //   child: Material(
            //     color: Colors.transparent,
            //     child: SizedBox(
            //       width: 600, // match your Rive container width
            //       // height: 300, // match your Rive container height
            //       height: 500,
            //       child: RiveHoverAnimation(),
            //     ),
            //   ),
            // ),
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
                    SliverAppBar(
                      pinned: true,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      flexibleSpace: Obx(
                        () => AnimatedAlign(
                          duration: Duration(milliseconds: 400),
                          alignment: controller.isScrolling.value
                              ? Alignment(0, -2.5)
                              : Alignment.topCenter,
                          child: HomeBarView(),
                        ),
                      ),
                      toolbarHeight: 120,
                    ),
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              ),
                              SizedBox(
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
                                            text:
                                                "$kHomeDisplayLineAboutMe02\n",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "$kHomeDisplayLineAboutMe03\n",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 210,
                                      child: AnimatedNavigateButton(
                                        label: 'See My Works',
                                        icon: Icons.arrow_forward,
                                        onTap: () {},
                                      ),
                                    ),
                                    // Spacer(),
                                    SizedBox(
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            onTap: () {},
                                          ),
                                          VerticalDivider(
                                            width: 16,
                                            thickness: 2,
                                            color: Colors.black,
                                          ),
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
                                            onTap: () {},
                                          ),
                                          VerticalDivider(
                                            width: 16,
                                            thickness: 2,
                                            color: Colors.black,
                                          ),
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
                                            onTap: () {},
                                          ),
                                          VerticalDivider(
                                            width: 16,
                                            thickness: 2,
                                            color: Colors.black,
                                          ),
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
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
