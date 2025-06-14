import 'package:amankrmj_portfolio/infrastructure/theme/colors.dart';
import 'package:amankrmj_portfolio/presentation/home/controllers/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoverAnimatedButton extends GetView<HomeController> {
  final int index;

  // final bool isHover;
  final String label;

  const HoverAnimatedButton({
    super.key,
    required this.index,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IntrinsicWidth(
        child: AnimatedContainer(
          transformAlignment: Alignment.center,
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: controller.hoverStates[index]
                ? KColor.secondaryColor.withAlpha((255 * 0.9).toInt())
                : Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          curve: Curves.easeInOut,
          transform: controller.hoverStates[index]
              ? (Matrix4.identity()..scale(1.05))
              : Matrix4.identity(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            label,
            style: TextStyle(
              color: controller.hoverStates[index]
                  ? KColor.primaryColor
                  : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
