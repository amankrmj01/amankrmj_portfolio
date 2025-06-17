import 'package:portfolio/presentation/home/widgets/hover_animated_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class HomeBarView extends GetView<HomeController> {
  HomeBarView({super.key});

  final List<String> labels = ['Home', 'Works', 'Certificates', 'Experience'];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,

      duration: Duration(milliseconds: 400),
      height: 60,
      constraints: BoxConstraints(maxWidth: 600),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(labels.length, (index) {
          return HoverAnimatedButton(
            index: index,
            label: labels[index],
            onTap: controller.onTapActions[index],
          );
        }),
      ),
    );
  }
}
