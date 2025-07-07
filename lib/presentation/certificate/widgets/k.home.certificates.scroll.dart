import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/domain/models/certificate.model.dart';
import 'package:portfolio/presentation/certificate/views/all_certificates_view.dart';
import 'package:portfolio/presentation/certificate/widgets/k.certificate.card.dart';

import '../../../utils/k.navigate.dart';
import '../../home/controllers/home.controller.dart';

class KCertificateScrollList extends StatelessWidget {
  final List<CertificateModel> items;
  final void Function(CertificateModel project, BuildContext context) onCardTap;

  const KCertificateScrollList({
    super.key,
    required this.items,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final bool isMobile = homeController.currentDevice.value == Device.Mobile;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        physics: const BouncingScrollPhysics(),
        itemCount: (items.length < 4 ? items.length : 4) + (isMobile ? 1 : 0),
        separatorBuilder: (context, index) => const SizedBox(width: 24),
        itemBuilder: (context, index) {
          final int maxItems = items.length < 4 ? items.length : 4;
          if (index < maxItems) {
            final item = items[index];
            return LayoutBuilder(
              builder: (context, constraints) {
                return KCertificateCard(
                  certificate: item,
                  onTap: () => onCardTap(item, context),
                  height: constraints.maxHeight,
                );
              },
            );
          } else if (isMobile && index == maxItems) {
            return Container(
              width: 190,

              decoration: BoxDecoration(
                color: Colors.white.withAlpha((0.2 * 255).toInt()),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white24, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha((0.08 * 255).toInt()),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => navigateWithSlideTransition(
                  context,
                  const AllCertificatesView(),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.apps_rounded,
                        size: 48,
                        color: Colors.white.withAlpha((0.85 * 255).toInt()),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "Browse All Certificates",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withAlpha((0.92 * 255).toInt()),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ShantellSans',
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
