import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class GradientDashedLineConnector extends StatelessWidget {
  final double thickness;
  final double dashLength;
  final double gapLength;
  final Gradient gradient;

  const GradientDashedLineConnector({
    Key? key,
    this.thickness = 2.0,
    this.dashLength = 6.0,
    this.gapLength = 4.0,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: thickness,
      child: CustomPaint(
        painter: _GradientDashedLinePainter(
          thickness: thickness,
          dashLength: dashLength,
          gapLength: gapLength,
          gradient: gradient,
        ),
      ),
    );
  }
}

class _GradientDashedLinePainter extends CustomPainter {
  final double thickness;
  final double dashLength;
  final double gapLength;
  final Gradient gradient;

  _GradientDashedLinePainter({
    required this.thickness,
    required this.dashLength,
    required this.gapLength,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final double totalHeight = size.height;
    double startY = 0;
    final rect = Rect.fromLTWH(0, 0, thickness, totalHeight);
    paint.shader = gradient.createShader(rect);

    while (startY < totalHeight) {
      final endY = (startY + dashLength).clamp(0.0, totalHeight);
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, endY),
        paint,
      );
      startY += dashLength + gapLength;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
