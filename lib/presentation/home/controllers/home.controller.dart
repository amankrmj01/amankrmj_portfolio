import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/infrastructure/dal/services/social_link_service.dart';
import 'package:portfolio/domain/models/social_links.model.dart';

class HomeController extends GetxController {
  // Add ScrollController
  final ScrollController scrollController = ScrollController();
  final isScrolling = false.obs;
  Timer? _scrollEndDebouncer;

  // Map to store all social links
  final RxMap<String, String> socialLinks = <String, String>{}.obs;

  // Use Get.find to get the SocialLinkService instance
  final SocialLinkService _socialLinkService = Get.find<SocialLinkService>();

  // Function to fetch all social links
  Future<void> fetchSocialLinks() async {
    try {
      final SocialLinksModel links = await _socialLinkService.fetchAll();
      socialLinks.value = links.toJson().map(
        (key, value) => MapEntry(key, value.toString()),
      );
    } catch (e) {
      // Handle error, optionally log or show a message
      socialLinks.clear();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchSocialLinks();
    // Add scroll listener
    scrollController.addListener(_onScroll);
    // Fetch social links on start
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

  // Section keys for navigation
  static final GlobalKey recentWorksKey = GlobalKey();
  static final GlobalKey recentCertificatesKey = GlobalKey();
  static final GlobalKey footerKey = GlobalKey();
  static final GlobalKey homeBarKey = GlobalKey();

  // List of section keys for navigation
  static final List<GlobalKey> sectionKeys = [
    homeBarKey,
    recentWorksKey,
    recentCertificatesKey,
    footerKey,
  ];

  // List of onTap actions for navigation
  List<VoidCallback> get onTapActions => List.generate(
    sectionKeys.length,
    (index) => () {
      final ctx = sectionKeys[index].currentContext;
      if (ctx != null) {
        Scrollable.ensureVisible(
          ctx,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          alignment: 0.0,
        );
      }
    },
  );
}
