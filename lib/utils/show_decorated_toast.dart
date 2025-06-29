import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

void showDecoratedToast(
  String message, {
  ToastPosition position = ToastPosition.bottom,
  Color? backgroundColor,
  Color? textColor,
  double radius = 12,
  TextStyle? textStyle,
  EdgeInsets textPadding = const EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 14,
  ),
  Duration duration = const Duration(seconds: 3),
  Curve animationCurve = Curves.easeOutCubic,
}) {
  showToast(
    message,
    position: position,
    backgroundColor: backgroundColor ?? Colors.blueAccent,
    radius: radius,
    textStyle:
        textStyle ??
        TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
    textPadding: textPadding,
    animationCurve: animationCurve,
    duration: duration,
    animationBuilder: _defaultToastAnimation,
  );
}

Widget _defaultToastAnimation(
  BuildContext context,
  Widget child,
  AnimationController controller,
  double percent,
) {
  // Slide from bottom by default
  final offset = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutCubic));
  return SlideTransition(
    position: offset,
    child: FadeTransition(opacity: controller, child: child),
  );
}
