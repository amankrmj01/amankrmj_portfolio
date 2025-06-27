import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:timelines_plus/timelines_plus.dart';

import '../../infrastructure/theme/colors.dart';
import 'controllers/experience.controller.dart';
import '../../../configs/experience.dart';
import 'curved_line_connector.dart';

class ExperienceScreen extends GetView<ExperienceController> {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        width: _isHovered ? 550 : 500,
        height: _isHovered ? 220 : 200,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 1),
          boxShadow: [
            BoxShadow(
              color: KColor.secondarySecondColor,
              offset: _isHovered ? Offset.zero : Offset(-5, 5),
              blurRadius: 0,
            ),
          ],
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
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.blueGrey),
                    ),
                  ),
              ],
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
  late Animation<double> _radiusAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _radiusAnim = Tween<double>(
      begin: 0,
      end: 18,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
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
