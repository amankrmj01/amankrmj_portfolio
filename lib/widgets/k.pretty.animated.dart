import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';
import '../../infrastructure/theme/colors.dart';
import '../infrastructure/navigation/bindings/controllers/info.fetch.controller.dart';

class KPrettyAnimated extends StatefulWidget {
  const KPrettyAnimated({super.key});

  @override
  State<KPrettyAnimated> createState() => _KPrettyAnimatedState();
}

class _KPrettyAnimatedState extends State<KPrettyAnimated> {
  final List<String> _words = [
    "A passionate Flutter developer.",
    "Building beautiful, performant apps.",
    "Java & Spring enthusiast.",
    "Coffee-powered coder ☕",
    "Always learning, always building.",
    "Code. Create. Inspire.",
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      setState(() {
        _currentIndex = 0;
      });
      _runAnimationLoop();
    });
  }

  void _runAnimationLoop() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 6));
      if (!mounted) break;
      setState(() {
        if (_currentIndex < _words.length - 1) {
          _currentIndex += 1;
        } else {
          _currentIndex = 0;
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final InfoFetchController infoFetchController =
        Get.find<InfoFetchController>();
    final double fontSize;
    if (infoFetchController.currentDevice.value == Device.Mobile) {
      fontSize = 40;
    } else if (infoFetchController.currentDevice.value == Device.Tablet) {
      fontSize = 60;
    } else {
      fontSize = 50;
    }

    if (!mounted) {
      return const SizedBox.shrink();
    }
    return KeyedSubtree(
      key: ValueKey(_currentIndex),
      child: OffsetText(
        text: _words[_currentIndex],
        duration: const Duration(seconds: 2),
        type: AnimationType.word,
        slideType: SlideAnimationType.rightLeft,
        textStyle: TextStyle(
          wordSpacing: 10,
          fontSize: fontSize,
          fontFamily: 'ShantellSans',
          color: KColor.secondarySecondColor,
          shadows: [
            Shadow(
              color: Colors.pinkAccent,
              // offset: const Offset(-2, 0),
              blurRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}
