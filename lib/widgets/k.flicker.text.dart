import 'dart:math';
import 'package:flutter/material.dart';

class KFlickerText extends StatefulWidget {
  final String text;
  final int repeatCount;
  final double? fontSize;
  final Color? color;
  final Color? shadowColor;

  const KFlickerText({
    super.key,
    required this.text,
    required this.repeatCount,
    required this.fontSize,
    required this.color,
    required this.shadowColor,
  });

  @override
  State<KFlickerText> createState() => _KFlickerTextState();
}

class _KFlickerTextState extends State<KFlickerText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int _currentRepeat;
  late bool _isVisible;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _currentRepeat = 0;
    _isVisible = true;
    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 800),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            if (_currentRepeat < widget.repeatCount - 1) {
              _currentRepeat++;
              _controller.forward(from: 0);
            } else {
              // Ensure text is visible at the end
              setState(() {
                _isVisible = true;
              });
            }
          }
        });
    _controller.addListener(_onTick);
    _controller.forward();
  }

  void _onTick() {
    setState(() {
      // 60% chance to show, 40% to hide, for a more visible flicker
      _isVisible = _random.nextDouble() > 0.1;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onTick);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? Text(
            widget.text,
            style: TextStyle(
              fontFamily: "ShantellSans",
              fontSize: widget.fontSize,
              color: widget.color,
              shadows: [
                Shadow(
                  blurRadius: 4.0,
                  color: widget.shadowColor ?? Colors.pinkAccent,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
