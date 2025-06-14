import 'package:flutter/material.dart';

/// A custom container transform transition widget for animating between two widgets.
/// Usage: Wrap your closed (card) and open (detail) widgets with this and control the state with [isOpen].
class KContainerTransform extends StatefulWidget {
  final Widget closedBuilder;
  final Widget openBuilder;
  final bool isOpen;
  final Duration duration;
  final Curve curve;
  final VoidCallback? onClosed;

  const KContainerTransform({
    super.key,
    required this.closedBuilder,
    required this.openBuilder,
    required this.isOpen,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    this.onClosed,
  });

  @override
  State<KContainerTransform> createState() => _KContainerTransformState();
}

class _KContainerTransformState extends State<KContainerTransform>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    if (widget.isOpen) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant KContainerTransform oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != oldWidget.isOpen) {
      if (widget.isOpen) {
        _controller.forward();
      } else {
        _controller.reverse().then((_) {
          if (widget.onClosed != null) widget.onClosed!();
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            Opacity(
              opacity: 1 - _animation.value,
              child: IgnorePointer(
                ignoring: widget.isOpen,
                child: widget.closedBuilder,
              ),
            ),
            Opacity(
              opacity: _animation.value,
              child: IgnorePointer(
                ignoring: !widget.isOpen,
                child: widget.openBuilder,
              ),
            ),
          ],
        );
      },
    );
  }
}
