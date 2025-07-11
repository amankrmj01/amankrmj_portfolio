import 'dart:math';

import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/domain/models/certificate.model.dart';

import '../../../infrastructure/navigation/bindings/controllers/info.fetch.controller.dart';
import '../../../widgets/k.image.dart';

class KCertificateCard extends StatefulWidget {
  final CertificateModel certificate;
  final VoidCallback? onTap;

  final double? width;
  final double? height;
  final bool onHome;
  final bool expandToContentHeight;

  const KCertificateCard({
    super.key,
    required this.certificate,
    this.onTap,
    this.width = 500,
    this.height,
    required this.onHome,
    this.expandToContentHeight = false,
  });

  @override
  State<KCertificateCard> createState() => _KCertificateCard();
}

class _KCertificateCard extends State<KCertificateCard> {
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
    final InfoFetchController infoFetchController =
        Get.find<InfoFetchController>();
    final isMobile = infoFetchController.currentDevice.value == Device.Mobile;
    final bool expandToContent = widget.expandToContentHeight;
    return MouseRegion(
      cursor: isHover ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: () async {
          setState(() => isHover = true);
          await Future.delayed(const Duration(milliseconds: 350));
          widget.onTap?.call();
          setState(() => isHover = false);
        },
        child: AnimatedScale(
          scale: isHover ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: const EdgeInsets.all(8),
            width: isMobile
                ? (MediaQuery.of(context).size.width * 0.45 > 340
                      ? MediaQuery.of(context).size.width * 0.45
                      : 340)
                : widget.width,
            height: expandToContent ? null : widget.height,
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
                  mainAxisSize: expandToContent
                      ? MainAxisSize.min
                      : MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: isMobile ? 300 : 380,
                      child: KImage(url: widget.certificate.images[0]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: expandToContent
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.certificate.name,
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
                                  widget.certificate.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70,
                                    fontFamily: "Poppins",
                                    decoration: TextDecoration.none,
                                  ),
                                  softWrap: true,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  widget.certificate.largeDescription,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white70,
                                    fontFamily: "Poppins",
                                    decoration: TextDecoration.none,
                                  ),
                                  maxLines: isMobile ? 4 : 8,
                                  softWrap: true,
                                ),
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 6,
                                  runSpacing: 2,
                                  runAlignment: WrapAlignment.end,
                                  children: List<Widget>.from(
                                    widget.certificate.skills.map(
                                      (tech) => Chip(label: Text(tech)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(
                              height:
                                  widget.height! - (isMobile ? 300 : 380) - 52,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      widget.certificate.name,
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
                                      widget.certificate.description,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white70,
                                        fontFamily: "Poppins",
                                        decoration: TextDecoration.none,
                                      ),
                                      softWrap: true,
                                    ),
                                    const SizedBox(height: 8),
                                    widget.onHome
                                        ? const SizedBox.shrink()
                                        : Text(
                                            widget.certificate.largeDescription,
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.white70,
                                              fontFamily: "Poppins",
                                              decoration: TextDecoration.none,
                                            ),
                                            softWrap: true,
                                          ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 6,
                                      runSpacing: 4,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      runAlignment: WrapAlignment.end,
                                      children: List<Widget>.from(
                                        widget.certificate.skills.map(
                                          (tech) => Chip(label: Text(tech)),
                                        ),
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
          ),
        ),
      ),
    );
  }
}
