import 'package:flutter/material.dart';

class CurvedLineConnector extends StatelessWidget {
  final Color color;
  final double thickness;
  final double height;

  const CurvedLineConnector({
    super.key,
    this.color = Colors.grey,
    this.thickness = 2.0,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: height,
      child: CustomPaint(
        painter: _CurvedLinePainter(color: color, thickness: thickness),
      ),
    );
  }
}

class _CurvedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;

  _CurvedLinePainter({required this.color, required this.thickness});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.cubicTo(
      size.width,
      size.height * 0.25,
      0,
      size.height * 0.75,
      size.width / 2,
      size.height,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
