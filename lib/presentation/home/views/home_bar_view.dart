import 'package:amankrmj_portfolio/presentation/home/widgets/hover_animated_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class HomeBarView extends GetView<HomeController> {
  HomeBarView({super.key});

  final List<String> labels = [
    'Home',
    'Projects',
    'Experience',
    'Contact Me',
    'About',
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      duration: Duration(milliseconds: 300),
      height: 50,
      // width: MediaQuery.of(context).size.width * 0.8,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
        minWidth: 360,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
        children: List.generate(labels.length, (index) {
          return MouseRegion(
            onEnter: (event) {
              controller.setHover(index, true);
            },
            onExit: (event) {
              controller.setHover(index, false);
            },
            child: HoverAnimatedButton(index: index, label: labels[index]),
          );
        }),
      ),
    );
  }
}
