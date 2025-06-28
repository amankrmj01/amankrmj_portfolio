import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:timelines_plus/timelines_plus.dart';

import 'package:mesh_gradient/mesh_gradient.dart';

import 'dart:math';

import '../../infrastructure/theme/colors.dart';
import 'controllers/experience.controller.dart';
import '../../../configs/experience.dart';

class ExperienceScreen extends GetView<ExperienceController> {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Mesh gradient background using mesh_gradient package
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
                  child: Timeline.tileBuilder(
                    theme: TimelineThemeData(
                      nodePosition: 0.5,
                      color: Colors.blue,
                      indicatorTheme: const IndicatorThemeData(
                        position: 0.5,
                        size: 30.0,
                      ),
                      connectorTheme: const ConnectorThemeData(thickness: 2.0),
                    ),
                    builder: TimelineTileBuilder.connected(
                      connectionDirection: ConnectionDirection.before,
                      itemCount: experiences.length,
                      // Add one extra tile
                      contentsAlign: ContentsAlign.alternating,
                      contentsBuilder: (context, index) {
                        final isFirst = index == 0;
                        final isLast = index == experiences.length - 1;
                        return Padding(
                          padding: EdgeInsets.only(
                            top: isFirst ? 50 : 14,
                            bottom: isLast ? 50 : 14,
                          ),
                          child: ExperienceCard(
                            exp: experiences[index],
                            index: index,
                          ),
                        );
                      },
                      indicatorBuilder: (context, index) {
                        final controller = Get.find<ExperienceController>();
                        return Obx(
                          () => AnimatedWaveDotIndicator(
                            animate: controller.hoveredIndex.value == index,
                            color: KColor.secondarySecondColor,
                          ),
                        );
                      },
                      connectorBuilder: (context, index, _) {
                        return SolidLineConnector(
                          color: KColor.secondarySecondColor,
                        );
                      },
                      firstConnectorBuilder: (context) => DashedLineConnector(
                        color: KColor.secondarySecondColor.withAlpha(
                          (0.3 * 255).toInt(),
                        ),
                      ),
                      lastConnectorBuilder: (context) => DashedLineConnector(
                        color: KColor.secondarySecondColor.withAlpha(
                          (0.3 * 255).toInt(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final Map<String, dynamic> exp;
  final int index;

  const ExperienceCard({super.key, required this.exp, required this.index});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;
  late List<AuraSpot> _auraSpots;

  @override
  void initState() {
    _auraSpots = randomizeAuraSpots();
    super.initState();
  }

  final Random _random = Random();

  List<AuraSpot> randomizeAuraSpots() {
    // Minimum values
    const minRadius = 50.0;
    const maxRadius = 180.0;
    const minBlur = 4.0;
    const maxBlur = 16.0;
    final alignments = [
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.bottomLeft,
      Alignment.bottomRight,
      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,
      Alignment.topCenter,
      Alignment.bottomCenter,
    ];
    final colors = [
      Color(0xFF7F53AC), // Soft Purple
      Color(0xFF647DEE), // Blue Violet
      Color(0xFF43C6AC), // Aqua Green
      Color(0xFFF7971E), // Warm Gold Accent
    ];
    return List.generate(colors.length, (i) {
      final double radius =
          minRadius + _random.nextDouble() * (maxRadius - minRadius);
      final double blurRadius =
          minBlur + _random.nextDouble() * (maxBlur - minBlur);
      final Alignment alignment =
          alignments[_random.nextInt(alignments.length)];
      return AuraSpot(
        color: colors[i],
        radius: radius,
        alignment: alignment,
        blurRadius: blurRadius,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final exp = widget.exp;
    final controller = Get.find<ExperienceController>();
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        controller.hoveredIndex.value = widget.index;
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        controller.hoveredIndex.value = null;
      },
      child: AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        width: _isHovered ? 550 : 500,
        height: _isHovered ? 220 : 200,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Color.lerp(Colors.transparent, Colors.white, 0.6)!,
            width: 1,
          ),
        ),
        child: RepaintBoundary(
          child: AuraBox(
            spots: _auraSpots,
            decoration: BoxDecoration(
              color: Color.lerp(Colors.black, Colors.transparent, 0.8),
              shape: BoxShape.rectangle,
            ),
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp['title'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      exp['company'],
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                    ),
                    Text(
                      '${exp['startDate']} - ${exp['endDate']}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      alignment: Alignment.topCenter,
                      child: Text(
                        exp['description'],
                        maxLines: _isHovered ? null : 1,
                        overflow: _isHovered
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                    ),
                    if (exp['technologies'] != null) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        children: List<Widget>.from(
                          (exp['technologies'] as List).map(
                            (tech) => Chip(label: Text(tech)),
                          ),
                        ),
                      ),
                    ],
                    if (exp['location'] != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          exp['location'],
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.blueGrey),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedWaveDotIndicator extends StatefulWidget {
  final bool animate;
  final Color color;

  const AnimatedWaveDotIndicator({
    super.key,
    required this.animate,
    required this.color,
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
                        ? KColor.secondarySecondColor
                        : KColor.secondarySecondColor.withAlpha(
                            (0.4 * 255).toInt(),
                          ),
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
