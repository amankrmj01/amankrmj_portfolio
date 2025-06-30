import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/domain/models/certificate.model.dart';
import 'package:portfolio/presentation/certificate/widgets/k.certificate.card.dart';

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
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No data found.',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      );
    }
    return SizedBox(
      height: homeController.currentDevice.value == Device.Mobile ? 456 : 656,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          physics: const BouncingScrollPhysics(),
          itemCount: items.length < 4 ? items.length : 4,
          separatorBuilder: (context, index) => const SizedBox(width: 24),
          itemBuilder: (context, index) {
            final item = items[index];
            return KCertificateCard(
              certificate: item,
              onTap: () => onCardTap(item, context),
              // height: 360,
            );
          },
        ),
      ),
    );
  }
}
