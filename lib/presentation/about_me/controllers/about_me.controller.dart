import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutMeController extends GetxController {
  final RxList<double> toolNameWidths = <double>[].obs;

  void calculateToolNameWidths(List tools, TextStyle style) {
    toolNameWidths.clear();
    for (final tool in tools) {
      final width = _calculateTextWidth(tool.name, style);
      toolNameWidths.add(width);
    }
  }

  double _calculateTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }
}
