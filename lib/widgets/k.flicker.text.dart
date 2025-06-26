import 'package:flutter/material.dart';

class KFlickerText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final Color? shadowColor;

  const KFlickerText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "ShantellSans",
        fontSize: fontSize,
        color: color,
        shadows: [
          Shadow(
            blurRadius: 4.0,
            color: shadowColor ?? Colors.pinkAccent,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}
