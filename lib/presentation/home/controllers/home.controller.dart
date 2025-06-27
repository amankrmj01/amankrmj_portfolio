import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:portfolio/infrastructure/dal/services/social_link_service.dart';
import 'package:portfolio/domain/models/social_links.model.dart';

class HomeController extends GetxController {
  late final AnimatedMeshGradientController meshGradientController;

  // Scroll controller and scroll state
  final ScrollController scrollController = ScrollController();
  final isScrolling = false.obs;
  Timer? _scrollEndDebouncer;

  // Social links
  final RxMap<String, String> socialLinks = <String, String>{}.obs;
  final SocialLinkService _socialLinkService = Get.find<SocialLinkService>();

  // Selected tab index for navigation bar
  final RxInt selectedTabIndex = 0.obs;

  // Section keys for navigation
  static final GlobalKey recentWorksKey = GlobalKey();
  static final GlobalKey recentCertificatesKey = GlobalKey();
  static final GlobalKey footerKey = GlobalKey();
  static final GlobalKey homeBarKey = GlobalKey();

  static final List<GlobalKey> sectionKeys = [
    homeBarKey,
    recentWorksKey,
    recentCertificatesKey,
    footerKey,
  ];

  // Navigation actions: scrolls to section and updates selected tab
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
        selectedTabIndex.value = index;
      }
    },
  );

  // Fetch social links
  Future<void> fetchSocialLinks() async {
    try {
      final SocialLinksModel links = await _socialLinkService.fetchAll();
      socialLinks.value = links.toJson().map(
        (key, value) => MapEntry(key, value.toString()),
      );
    } catch (e) {
      socialLinks.clear();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchSocialLinks();
    scrollController.addListener(_onScroll);
    meshGradientController = AnimatedMeshGradientController()..start();
  }

  void _onScroll() {
    // Get the scroll position
    final scrollOffset = scrollController.offset;
    int newIndex = 0;
    for (int i = 0; i < sectionKeys.length; i++) {
      final ctx = sectionKeys[i].currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        final position =
            box.localToGlobal(Offset.zero, ancestor: null).dy +
            scrollController.offset;
        // If the scroll offset is past this section, update the index
        if (scrollOffset >= position - 100) {
          newIndex = i;
        }
      }
    }
    if (selectedTabIndex.value != newIndex) {
      selectedTabIndex.value = newIndex;
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    _scrollEndDebouncer?.cancel();
    super.onClose();
  }
}
