import 'package:flutter/material.dart';
import 'package:amankrmj_portfolio/infrastructure/theme/colors.dart';

class AnimatedNavigateButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;
  final Color? hoverColor;
  final double? width;
  final double? height;
  final bool? isHovered;

  const AnimatedNavigateButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.color,
    this.hoverColor,
    this.width,
    this.height,
    this.isHovered,
  });

  @override
  State<AnimatedNavigateButton> createState() => _AnimatedNavigateButtonState();
}

class _AnimatedNavigateButtonState extends State<AnimatedNavigateButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Colors.black;
    final Color backgroundColor = Colors.transparent;
    final bool isHovered = widget.isHovered ?? _isHovered;
    return MouseRegion(
      onEnter: (_) {
        if (widget.isHovered != null) {
          debugPrint("Mouse Entered");
        } else {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (widget.isHovered != null) {
          debugPrint("Mouse Exited");
        } else {
          setState(() => _isHovered = false);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: (widget.width ?? 190) + (isHovered ? 10 : 0),
        height: widget.height ?? 48,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: KColor.secondarySecondColor,
              blurRadius: 0,
              offset: isHovered ? const Offset(0, 0) : const Offset(-5, 5),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: widget.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 10),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontFamily: 'ShantellSans',
                ),
              ),
              Spacer(),
              Icon(widget.icon, color: Colors.white),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
