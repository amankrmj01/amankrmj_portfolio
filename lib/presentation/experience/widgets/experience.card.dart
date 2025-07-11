import 'dart:math';

import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/experience.model.dart';

class ExperienceCard extends StatefulWidget {
  final ExperienceModel exp;

  const ExperienceCard({super.key, required this.exp});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
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
    return MouseRegion(
      onExit: (_) {
        setState(() {
          _isExpanded = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: AnimatedSize(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: AnimatedContainer(
            clipBehavior: Clip.hardEdge,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            width: 500,
            constraints: _isExpanded
                ? const BoxConstraints(minHeight: 220, maxHeight: 1000)
                : const BoxConstraints(minHeight: 220, maxHeight: 220),
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
                          exp.title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          exp.company,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey[700]),
                        ),
                        Text(
                          '${exp.startDate} - ${exp.endDate}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          alignment: Alignment.topCenter,
                          child: Text(
                            exp.description,
                            maxLines: _isExpanded ? null : 1,
                            overflow: _isExpanded
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                          ),
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
                        if (exp.location.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              exp.location,
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
        ),
      ),
    );
  }
}
