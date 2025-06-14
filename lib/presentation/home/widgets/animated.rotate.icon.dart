// ignore_for_file: unused_import

import 'package:amankrmj_portfolio/infrastructure/theme/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedRotateIcon extends StatefulWidget {
  final Widget firstIcon;
  final Widget secondIcon;
  final String label;
  final String url;

  const AnimatedRotateIcon({
    super.key,
    required this.firstIcon,
    required this.secondIcon,
    required this.label,
    required this.url,
  });

  @override
  State<AnimatedRotateIcon> createState() => _AnimatedRotateIconState();
}

class _AnimatedRotateIconState extends State<AnimatedRotateIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.url))) {
            await launchUrl(
              Uri.parse(widget.url),
              mode: LaunchMode.externalApplication,
              webOnlyWindowName: '_blank',
            );
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40, // Adjust as needed for icon size
              width: 40, // Adjust as needed for icon size
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    top: _isHovered ? -40 : 0,
                    child: AnimatedOpacity(
                      opacity: _isHovered ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 600),
                      child: widget.firstIcon,
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    top: _isHovered ? 0 : 40,
                    child: AnimatedOpacity(
                      opacity: _isHovered ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: widget.secondIcon,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // SizedBox(
            //   width: 80.0,
            //   height: 40,
            //   child: TextLiquidFill(
            //     text: widget.label,
            //
            //     waveColor: Colors.blueAccent,
            //     boxBackgroundColor: KColor.primaryColor,
            //     textStyle: TextStyle(
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black,
            //     ),
            //     boxHeight: 40.0,
            //   ),
            // ),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: KColor.secondarySecondColor,
                fontFamily: "ShantellSans",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
