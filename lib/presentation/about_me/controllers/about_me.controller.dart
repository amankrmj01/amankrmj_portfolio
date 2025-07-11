import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/domain/models/about.me.info.model.dart';

import '../../../infrastructure/dal/servicess/about.me.info.fetch.service.dart';
import '../../home/controllers/home.controller.dart';

class AboutMeController extends GetxController {
  final Rxn<AboutMeInfoModel> aboutMeInfo = Rxn<AboutMeInfoModel>();
  final isLoading = true.obs;

  final Logger _logger = Logger();
  final ScrollController scrollController = ScrollController();

  Future<void> fetchAboutMeInfo() async {
    try {
      final service = AboutMeInfoFetchService();
      final List<dynamic> links = await service.fetchData();
      if (isClosed) return;
      aboutMeInfo.value = (links.isNotEmpty && links.first != null)
          ? links.first
          : AboutMeInfoModel(
              name: '',
              profession: '',
              location: '',
              interests: [],
              experience: '',
              education: '',
              email: '',
              summary: '',
              technicalInterests: [],
              tools: [],
            );
      isLoading.value = false;
    } catch (e) {
      isLoading.value = true;
      _logger.e('Error fetching social links', error: e);
      if (isClosed) return;
      aboutMeInfo.value = null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAboutMeInfo();
    scrollController.addListener(_handleScrollEdge);
  }

  void _handleScrollEdge() {
    if (!scrollController.hasClients) return;
    final atStart =
        scrollController.offset <= scrollController.position.minScrollExtent;
    final atEnd =
        scrollController.offset >= scrollController.position.maxScrollExtent;
    if (atStart || atEnd) {
      activateHomeControllerScrollbar();
    } else {
      deactivateHomeControllerScrollbar();
    }
  }

  void activateHomeControllerScrollbar() {
    final homeController = Get.find<HomeController>();
    homeController.isScrolling.value = true;
  }

  void deactivateHomeControllerScrollbar() {
    final homeController = Get.find<HomeController>();
    homeController.isScrolling.value = false;
  }

  // Pointer event handlers for scroll/drag forwarding
  void handlePointerSignal(PointerSignalEvent pointerSignal) {
    if (pointerSignal is PointerScrollEvent) {
      final atStart =
          scrollController.offset <= scrollController.position.minScrollExtent;
      final atEnd =
          scrollController.offset >= scrollController.position.maxScrollExtent;
      if (atStart || atEnd) {
        final homeController = Get.find<HomeController>();
        homeController.scrollController.position.moveTo(
          homeController.scrollController.offset + pointerSignal.scrollDelta.dy,
        );
      }
    }
  }

  void handlePointerMove(PointerMoveEvent pointerEvent) {
    final atStart =
        scrollController.offset <= scrollController.position.minScrollExtent;
    final atEnd =
        scrollController.offset >= scrollController.position.maxScrollExtent;
    if (atStart || atEnd) {
      final homeController = Get.find<HomeController>();
      homeController.scrollController.position.moveTo(
        homeController.scrollController.offset - pointerEvent.delta.dy,
      );
    }
  }

  void handlePointerDown(PointerDownEvent pointerEvent) {
    // Optionally, you can request focus or start drag here
  }
}
