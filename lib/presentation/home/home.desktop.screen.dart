import 'dart:developer';

import 'package:amankrmj_portfolio/infrastructure/theme/colors.dart';
import 'package:amankrmj_portfolio/presentation/home/views/home_bar_view.dart';
import 'package:amankrmj_portfolio/presentation/home/widgets/code.block.dart';
import 'package:amankrmj_portfolio/presentation/home/widgets/flicker.once.text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:rive/rive.dart';

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
                          duration: Duration(milliseconds: 200),
                          height: Get.height * 0.8,
                          width: Get.width * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _RiveHoverAnimation(),
            ),
          ],
        ),
      ),
    );
  }
}

class _RiveHoverAnimation extends StatefulWidget {
  @override
  State<_RiveHoverAnimation> createState() => _RiveHoverAnimationState();
}

class _RiveHoverAnimationState extends State<_RiveHoverAnimation> {
  Artboard? _artboard;
  StateMachineController? _controller;
  SMIInput<bool>? _hoverInput;

  @override
  void initState() {
    super.initState();
    RiveFile.initialize().then((_) {
      rootBundle.load('assets/rive/responsive_core.riv').then((data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        final controller = StateMachineController.fromArtboard(
          artboard,
          'State Machine 1',
        );
        if (controller != null) {
          artboard.addController(controller);
          _hoverInput =
              controller.findInput<bool>('isHover') ??
              (controller.inputs.whereType<SMIBool>().isNotEmpty
                  ? controller.inputs.whereType<SMIBool>().first
                  : null);
          debugPrint('Rive: Found input: \\${_hoverInput?.name}');
        } else {
          debugPrint('Rive: State machine not found');
        }
        setState(() => _artboard = artboard);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_artboard == null) return const SizedBox();
    return MouseRegion(
      behavior: HitTestBehavior.translucent,
      onEnter: (_) {
        debugPrint('Rive: Mouse entered');
        if (_hoverInput != null) _hoverInput!.value = true;
      },
      onExit: (_) {
        debugPrint('Rive: Mouse exited');
        if (_hoverInput != null) _hoverInput!.value = false;
      },
      child: SizedBox.expand(
        child: Rive(artboard: _artboard!, fit: BoxFit.cover),
      ),
    );
  }
}
