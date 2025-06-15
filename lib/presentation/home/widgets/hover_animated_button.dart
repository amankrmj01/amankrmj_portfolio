import 'package:amankrmj_portfolio/infrastructure/theme/colors.dart';
import 'package:flutter/material.dart';

class HoverAnimatedButton extends StatefulWidget {
  final int index;
  final String label;

  const HoverAnimatedButton({
    super.key,
    required this.index,
    required this.label,
  });

  @override
  State<HoverAnimatedButton> createState() => _HoverAnimatedButtonState();
}

class _HoverAnimatedButtonState extends State<HoverAnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IntrinsicWidth(
        child: AnimatedContainer(
          transformAlignment: Alignment.center,
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: _isHovered
                ? KColor.secondaryColor.withAlpha((255 * 0.9).toInt())
                : Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          curve: Curves.easeInOut,
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.05))
              : Matrix4.identity(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _isHovered ? KColor.primaryColor : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
