import 'dart:math';

import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';

import '../domain/models/info.model.dart';
import 'k.image.dart';

class KCard extends StatefulWidget {
  final InfoModel info;
  final VoidCallback? onTap;

  final double? width;
  final double? height;

  const KCard({
    super.key,
    required this.info,
    this.onTap,
    this.width = 500,
    this.height,
  });

  @override
  State<KCard> createState() => _KCardState();
}

class _KCardState extends State<KCard> {
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
                    SizedBox(height: 380, child: KImage(info: widget.info)),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.info.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "Poppins",
                              decoration: TextDecoration.none,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.info.description,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                              fontFamily: "Poppins",
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.info.largeDescription,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white70,
                              fontFamily: "Poppins",
                              decoration: TextDecoration.none,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
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
