import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../infrastructure/theme/colors.dart';

class FlickerOnceText extends StatefulWidget {
  final String text;
  final Duration delay;

  const FlickerOnceText({
    super.key,
    required this.text,
    this.delay = const Duration(milliseconds: 0),
  });

  @override
  State<FlickerOnceText> createState() => _FlickerOnceTextState();
}

class _FlickerOnceTextState extends State<FlickerOnceText> {
  bool _isStarted = false;
  bool _showAnimated = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() => _isStarted = true);
        Future.delayed(const Duration(milliseconds: 1600), () {
          if (mounted) setState(() => _showAnimated = false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isStarted) {
      return SizedBox(width: 500.0, height: 80.0);
    }

    return SizedBox(
      width: 500.0,
      height: 60.0,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 40,
          color: KColor.secondaryColor,
          fontFamily: 'ShantellSans',
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: Colors.pinkAccent,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: _showAnimated
            ? AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [FlickerAnimatedText(widget.text)],
                totalRepeatCount: 2,
                pause: Duration.zero,
                displayFullTextOnTap: true,
              )
            : Text(widget.text),
      ),
    );
  }
}
