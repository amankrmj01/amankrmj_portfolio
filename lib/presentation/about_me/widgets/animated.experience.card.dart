import 'dart:async';
import 'dart:math';

import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import '../../../domain/models/experience.model.dart';

class AnimatedExperienceCard extends StatefulWidget {
  final List<ExperienceModel> experiences;
  final Duration duration;
  final double width;

  const AnimatedExperienceCard({
    super.key,
    required this.experiences,
    this.duration = const Duration(seconds: 5),
    required this.width,
  });

  @override
  State<AnimatedExperienceCard> createState() => _AnimatedExperienceCardState();
}

class _AnimatedExperienceCardState extends State<AnimatedExperienceCard>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  int _nextIndex = 0;
  bool _showNext = false;
  Timer? _timer;

  late AnimationController _controller;
  late AnimationController _controllerLine;
  late Animation<Alignment> _alignmentAnim;

  // ignore: unused_field
  late Animation<Alignment> _alignmentAnimLine;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _controllerLine = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _alignmentAnim = Tween<Alignment>(
      begin: Alignment.center,
      end: Alignment(0, -1),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _alignmentAnimLine =
        Tween<Alignment>(
          begin: Alignment.center,
          end: Alignment(0, -5),
        ).animate(
          CurvedAnimation(parent: _controllerLine, curve: Curves.easeInOut),
        );
    _opacityAnim = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _timer = Timer.periodic(widget.duration, (_) {
      setState(() {
        _nextIndex = (_currentIndex + 1) % widget.experiences.length;
        _showNext = false;
      });
      _controller.forward(from: 0).then((_) {
        setState(() {
          _currentIndex = _nextIndex;
          _showNext = true;
        });
        _controller.reverse(from: 1.0);
      });
      _controllerLine.forward(from: 0).then((_) {
        _controllerLine.reverse(from: 1.0);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width < 650 ? widget.width : 650,
      height: 250,
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              if (!_showNext) {
                return Align(
                  alignment: _alignmentAnim.value,
                  child: Opacity(
                    opacity: _opacityAnim.value,
                    child: ExperienceCard(
                      width: widget.width,
                      exp: widget.experiences[_currentIndex],
                    ),
                  ),
                );
              } else {
                return Align(
                  alignment: Alignment.lerp(
                    Alignment(0, 1),
                    Alignment.center,
                    1 - _controller.value,
                  )!,
                  child: Opacity(
                    opacity: 1 - _controller.value,
                    child: ExperienceCard(
                      width: widget.width,
                      exp: widget.experiences[_currentIndex],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final ExperienceModel exp;
  final double width;

  const ExperienceCard({super.key, required this.exp, required this.width});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
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
    return Container(
      clipBehavior: Clip.hardEdge,
      width: widget.width < 600 ? widget.width : 600,
      height: 200,

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
            color: Color.lerp(Colors.black, Colors.transparent, 0.95),
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
                    exp.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        exp.company,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.blueGrey),
                      ),
                      const Spacer(),
                      if (exp.location.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            exp.location,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.blueGrey),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    '${exp.startDate} - ${exp.endDate}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    exp.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (exp.technologies.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      children: exp.technologies
                          .map((tech) => Chip(label: Text(tech)))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
