// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:portfolio/domain/models/social_links.model.dart';
import 'package:portfolio/infrastructure/dal/servicess/social.links.fetch.service.dart';

import '../../../infrastructure/dal/services/ping.server.dart';

enum Device { Desktop, Tablet, Mobile }

class HomeController extends GetxController {
  late final AnimatedMeshGradientController meshGradientController;

  // Scroll controller and scroll state
  final ScrollController scrollController = ScrollController();
  final isScrolling = false.obs;
  Timer? _scrollEndDebouncer;

  // Social links
  final Rxn<SocialLinksModel> socialLinks = Rxn<SocialLinksModel>();
  final _socialLinkService = SocialLinksFetchService();

  // Selected tab index for navigation bar
  final RxInt selectedTabIndex = 0.obs;

  // Section keys for navigation
  static final GlobalKey recentWorksKey = GlobalKey();
  static final GlobalKey recentCertificatesKey = GlobalKey();
  static final GlobalKey aboutMeKey = GlobalKey();
  static final GlobalKey homeKey = GlobalKey();

  static final List<GlobalKey> sectionKeys = [
    homeKey,
    recentWorksKey,
    recentCertificatesKey,
    aboutMeKey,
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

  // Device type management
  final Rx<Device> currentDevice = Device.Desktop.obs;

  void updateDevice(double width) {
    if (width < 900) {
      currentDevice.value = Device.Mobile;
    } else if (width < 1300) {
      currentDevice.value = Device.Tablet;
    } else {
      currentDevice.value = Device.Desktop;
    }
  }

  // Fetch social links
  Future<void> fetchSocialLinks() async {
    try {
      final List<dynamic> links = await _socialLinkService.fetchData();
      if (isClosed) return;
      socialLinks.value = links.first;
    } catch (e) {
      _logger.e('Error fetching social links', error: e);
      if (isClosed) return;
      socialLinks.value = SocialLinksModel(
        github: '',
        linkedIn: '',
        twitter: '',
        instagram: '',
        facebook: '',
        medium: '',
        email: '',
        resume: '',
        discord: '',
        phoneNumber: '',
        hackerrank: '',
        leetcode: '',
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    _pingOnce();
    fetchSocialLinks();

    scrollController.addListener(_onScroll);
    meshGradientController = AnimatedMeshGradientController()..start();
  }

  final Logger _logger = Logger();

  Future<void> _pingOnce() async {
    final PingServerService pingServerService = PingServerService();
    try {
      final result = await pingServerService.ping();
      if (result == 'true') {
        _logger.i('Server connected');
      } else {
        _logger.w('Server not connected: $result');
      }
    } catch (e, stackTrace) {
      _logger.e(
        'Exception during server ping',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  void _onScroll() {
    // Set isScrolling to true when scrolling starts
    if (!isScrolling.value) {
      isScrolling.value = true;
    }
    // Debounce to set isScrolling to false after scrolling ends
    _scrollEndDebouncer?.cancel();
    _scrollEndDebouncer = Timer(const Duration(milliseconds: 400), () {
      isScrolling.value = false;
    });

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
    _scrollEndDebouncer = null;
    meshGradientController.dispose();
    super.onClose();
  }
}
