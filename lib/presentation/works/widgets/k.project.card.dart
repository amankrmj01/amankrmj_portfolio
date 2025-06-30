import 'dart:math';

import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/domain/models/project.model.dart';

import '../../../widgets/k.image.dart';

class KProjectCard extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback? onTap;

  final double? width;
  final double? height;
  final bool? fixedHeight;

  const KProjectCard({
    super.key,
    required this.project,
    this.onTap,
    this.width = 500,
    this.fixedHeight = true,
    this.height,
  });

  @override
  State<KProjectCard> createState() => _KProjectCard();
}

class _KProjectCard extends State<KProjectCard> {
  bool isHover = false;
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
    return MouseRegion(
      cursor: isHover ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: isHover ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.all(8),
            width: widget.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.lerp(Colors.white, Colors.black, 0.5)!,
                width: 1,
              ),
              color: Color.lerp(
                Colors.deepPurpleAccent,
                Colors.transparent,
                0.65,
              )!,
              borderRadius: BorderRadius.circular(18),
            ),
            child: RepaintBoundary(
              child: AuraBox(
                spots: _auraSpots,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 380,
                      child: KImage(url: widget.project.images[0]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "Poppins",
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.project.description,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                              fontFamily: "Poppins",
                              decoration: TextDecoration.none,
                            ),
                            maxLines: widget.fixedHeight == true ? 2 : null,
                            overflow: widget.fixedHeight == true
                                ? TextOverflow.ellipsis
                                : null,
                            softWrap: true,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.project.largeDescription,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white70,
                              fontFamily: "Poppins",
                              decoration: TextDecoration.none,
                            ),
                            maxLines: widget.fixedHeight == true ? 5 : null,
                            overflow: widget.fixedHeight == true
                                ? TextOverflow.ellipsis
                                : null,
                            softWrap: true,
                          ),
                        ],
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
