import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/presentation/experience/widgets/experience.card.dart';
import 'package:portfolio/utils/k.showGeneralDialog.dart';

import 'package:timelines_plus/timelines_plus.dart';

import 'package:mesh_gradient/mesh_gradient.dart';

import '../../infrastructure/navigation/bindings/controllers/info.fetch.controller.dart';
import '../../infrastructure/theme/colors.dart';
import 'controllers/experience.controller.dart';

class ExperienceScreen extends GetView<ExperienceController> {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InfoFetchController infoFetchController =
        Get.find<InfoFetchController>();
    final isMobile = infoFetchController.currentDevice.value == Device.Mobile;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedMeshGradient(
              colors: const [
                Color(0xFF1A1A2E), // Deep Night Blue
                Color(0xFF1A1A2E), // Deep Night Blue
                Color(0xFF16213E), // Dark Blue
                Color(0xFF16213E), // Dark Blue
                // Color(0xFF0F3460), // Indigo Blue
                // Color(0xFF00ADB5), // Teal Accent
              ],
              controller: controller.meshGradientController,
              options: AnimatedMeshGradientOptions(
                speed: 0.4,
                frequency: 1.0,
                amplitude: 1.0,
                grain: 0.0,
              ),
            ),
          ),
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withAlpha((0.1 * 255).toInt()),
                      Colors.black.withAlpha((0.2 * 255).toInt()),
                      Colors.black.withAlpha((0.3 * 255).toInt()),
                      Colors.black.withAlpha((0.4 * 255).toInt()),
                      Colors.black.withAlpha((0.5 * 255).toInt()),
                      Colors.black.withAlpha((0.6 * 255).toInt()),
                      Colors.black.withAlpha((0.7 * 255).toInt()),
                      Colors.black.withAlpha((0.8 * 255).toInt()),
                      Colors.black.withAlpha((0.9 * 255).toInt()),
                      Colors.black,
                      Colors.black,
                      Colors.black.withAlpha((0.9 * 255).toInt()),
                      Colors.black.withAlpha((0.8 * 255).toInt()),
                      Colors.black.withAlpha((0.7 * 255).toInt()),
                      Colors.black.withAlpha((0.6 * 255).toInt()),
                      Colors.black.withAlpha((0.5 * 255).toInt()),
                      Colors.black.withAlpha((0.4 * 255).toInt()),
                      Colors.black.withAlpha((0.3 * 255).toInt()),
                      Colors.black.withAlpha((0.2 * 255).toInt()),
                      Colors.black.withAlpha((0.1 * 255).toInt()),
                      Colors.transparent,
                    ],
                    stops: [
                      0.0,
                      0.01,
                      0.02,
                      0.03,
                      0.04,
                      0.05,
                      0.06,
                      0.07,
                      0.08,
                      0.09,
                      0.1,
                      0.9,
                      0.91,
                      0.92,
                      0.93,
                      0.94,
                      0.95,
                      0.96,
                      0.97,
                      0.98,
                      0.99,
                      1.0,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: SizedBox(
                  height:
                      MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      32, // 32 for padding
                  width: double.infinity,
                  child: Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Timeline.tileBuilder(
                            theme: TimelineThemeData(
                              nodePosition: isMobile ? 1.0 : 0.5,
                              color: Colors.blue,
                              indicatorTheme: IndicatorThemeData(
                                position: isMobile ? 1.0 : 0.5,
                                size: 30.0,
                              ),
                              connectorTheme: const ConnectorThemeData(
                                thickness: 2.0,
                              ),
                            ),
                            builder: TimelineTileBuilder.connected(
                              connectionDirection: ConnectionDirection.before,
                              itemCount: controller.experiences.length,
                              // Add one extra tile
                              contentsAlign: isMobile
                                  ? ContentsAlign.reverse
                                  : ContentsAlign.alternating,
                              contentsBuilder: (context, index) {
                                final isFirst = index == 0;
                                final isLast =
                                    index == controller.experiences.length - 1;
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: isFirst ? 50 : 14,
                                    bottom: isLast ? 50 : 14,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      showBlurredGeneralDialog(
                                        context: context,
                                        builder: (context) {
                                          return Center(
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 16.0,
                                                  top: 40,
                                                  left: 18,
                                                  right: 18,
                                                ),
                                                child: ExperienceCard(
                                                  exp: controller
                                                      .experiences[index],
                                                  showAll: true,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: ExperienceCard(
                                      exp: controller.experiences[index],
                                    ),
                                  ),
                                );
                              },
                              indicatorBuilder: (context, index) {
                                final controller =
                                    Get.find<ExperienceController>();
                                return Obx(
                                  () => AnimatedWaveDotIndicator(
                                    animate:
                                        controller.hoveredIndex.value == index,
                                    color: KColor.secondarySecondColor,
                                    secondaryColor: KColor.secondaryColor,
                                  ),
                                );
                              },
                              connectorBuilder: (context, index, _) {
                                return SolidLineConnector(
                                  color: KColor.secondarySecondColor,
                                );
                              },
                              firstConnectorBuilder: (context) =>
                                  DashedLineConnector(
                                    color: KColor.secondarySecondColor
                                        .withAlpha((0.3 * 255).toInt()),
                                  ),
                              lastConnectorBuilder: (context) =>
                                  DashedLineConnector(
                                    color: KColor.secondarySecondColor
                                        .withAlpha((0.3 * 255).toInt()),
                                  ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),

          // Floating action button
          Positioned(
            top: 16,
            left: 16,
            child: InkWell(
              onTap: () {
                if (context.mounted) {
                  Navigator.of(context).maybePop();
                }
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white.withAlpha((0.8 * 255).toInt()),
                size: 32,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Experience',
                style: TextStyle(
                  fontFamily: "ShantellSans",
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedWaveDotIndicator extends StatefulWidget {
  final bool animate;
  final Color color;
  final Color secondaryColor;

  const AnimatedWaveDotIndicator({
    super.key,
    required this.animate,
    required this.color,
    required this.secondaryColor,
  });

  @override
  State<AnimatedWaveDotIndicator> createState() =>
      _AnimatedWaveDotIndicatorState();
}

class _AnimatedWaveDotIndicatorState extends State<AnimatedWaveDotIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    if (widget.animate) _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant AnimatedWaveDotIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !oldWidget.animate) {
      _controller.repeat();
    } else if (!widget.animate && oldWidget.animate) {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final double scale = widget.animate ? 1.25 : 1.0;
          return Stack(
            alignment: Alignment.center,
            children: [
              // Multiple expanding waves
              for (int i = 0; i < 3; i++)
                if (widget.animate)
                  Opacity(
                    opacity: (1 - ((_controller.value + i * 0.33) % 1)).clamp(
                      0.0,
                      1.0,
                    ),
                    child: Container(
                      width: (18 + 24 * ((_controller.value + i * 0.33) % 1)),
                      height: (18 + 24 * ((_controller.value + i * 0.33) % 1)),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.color.withAlpha((0.15 * 255).toInt()),
                      ),
                    ),
                  ),
              // Main dot with animated scale
              AnimatedScale(
                scale: scale,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.animate
                        ? widget.secondaryColor
                        : widget.secondaryColor.withAlpha((0.4 * 255).toInt()),
                    boxShadow: widget.animate
                        ? [
                            BoxShadow(
                              color: widget.color.withAlpha(
                                (0.4 * 255).toInt(),
                              ),
                              blurRadius: 12 * (1 - _controller.value),
                              spreadRadius: 1.5 * (1 - _controller.value),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
