import 'dart:math';

import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/models/contact_form.model.dart';

class FileCard extends StatefulWidget {
  final Map<String, dynamic> file;

  const FileCard({super.key, required this.file});

  @override
  State<FileCard> createState() => _FileCardState();
}

class _FileCardState extends State<FileCard> with TickerProviderStateMixin {
  bool expanded = false;
  late final List<AuraSpot> _auraSpots;
  final Random _random = Random();
  bool _isWhatsappHovered = false;

  List<AuraSpot> _randomizeAuraSpots() {
    const minRadius = 50.0, maxRadius = 180.0, minBlur = 4.0, maxBlur = 16.0;
    const alignments = [
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
    const colors = [
      Color(0xFF7F53AC),
      Color(0xFF647DEE),
      Color(0xFF43C6AC),
      Color(0xFFF7971E),
    ];
    return List.generate(
      colors.length,
      (i) => AuraSpot(
        color: colors[i],
        radius: minRadius + _random.nextDouble() * (maxRadius - minRadius),
        alignment: alignments[_random.nextInt(alignments.length)],
        blurRadius: minBlur + _random.nextDouble() * (maxBlur - minBlur),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _auraSpots = _randomizeAuraSpots();
  }

  String _formatDateTime(String? date, String? time) {
    if (date == null || time == null) return '';
    try {
      final dt = DateTime(
        int.parse(date.substring(0, 4)),
        int.parse(date.substring(4, 6)),
        int.parse(date.substring(6, 8)),
        int.parse(time.substring(0, 2)),
        int.parse(time.substring(2, 4)),
        int.parse(time.substring(4, 6)),
      );
      return DateFormat('MMM d, yyyy h:mm a').format(dt);
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final file = widget.file;
    final contact = file['content'] != null
        ? ContactFormModel.fromJson(file['content'])
        : null;
    final name = contact?.name ?? '';
    final countryCode = contact?.countryCode ?? '';
    final phone = contact?.phoneNumber ?? '';
    final email = contact?.email ?? '';
    final message = contact?.message ?? '';
    final hasContent = file['content'] != null;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      clipBehavior: Clip.hardEdge,
      // width: 500,
      margin: const EdgeInsets.symmetric(vertical: 8),
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    10.widthBox,
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => _isWhatsappHovered = true),
                      onExit: (_) => setState(() => _isWhatsappHovered = false),
                      child: GestureDetector(
                        onTap: () {
                          final whatsappUrl =
                              'https://wa.me/$countryCode$phone?text=Hello';
                          launchUrl(Uri.parse(whatsappUrl));
                        },
                        child: AnimatedScale(
                          scale: _isWhatsappHovered ? 1.2 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: SvgPicture.asset(
                            'assets/icons/whatsaap.svg',
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ),
                    ),
                    20.widthBox,
                    if (file['date'] != null && file['time'] != null)
                      Text(
                        _formatDateTime(file['date'], file['time']),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    AnimatedRotation(
                      turns: expanded ? -0.5 : 0.0, // 0.5 turns = 180 degrees
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: IconButton(
                        icon: Icon(Icons.expand_more),
                        onPressed: hasContent
                            ? () => setState(() => expanded = !expanded)
                            : null,
                      ),
                    ),
                  ],
                ),
                // --- SMOOTH EXPANSION SECTION START ---
                AnimatedSize(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  alignment: Alignment.centerLeft,
                  child: expanded && hasContent
                      ? Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: $name',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withAlpha(
                                      (0.95 * 255).toInt(),
                                    ),
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Phone: $phone',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withAlpha(
                                      (0.85 * 255).toInt(),
                                    ),
                                    letterSpacing: 0.1,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Email: $email',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withAlpha(
                                      (0.85 * 255).toInt(),
                                    ),
                                    letterSpacing: 0.1,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Message:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.amberAccent.shade200,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  message,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withAlpha(
                                      (0.92 * 255).toInt(),
                                    ),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                // --- SMOOTH EXPANSION SECTION END ---
              ],
            ),
          ),
        ),
      ),
    );
  }
}
