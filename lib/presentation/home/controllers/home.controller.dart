import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Add ScrollController
  final ScrollController scrollController = ScrollController();
  final isScrolling = false.obs;
  Timer? _scrollEndDebouncer;

  @override
  void onInit() {
    super.onInit();
    // Add scroll listener
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!isScrolling.value) {
      isScrolling.value = true;
    }
    _scrollEndDebouncer?.cancel();
    _scrollEndDebouncer = Timer(const Duration(milliseconds: 400), () {
      isScrolling.value = false;
    });
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    _scrollEndDebouncer?.cancel();
    super.onClose();
  }

  final count = 0.obs;

  void increment() => count.value++;

  final isHoverOnNavigateButton = false.obs;
}
