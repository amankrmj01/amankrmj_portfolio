import 'package:portfolio/configs/certificates.dart';
import 'package:portfolio/presentation/certificate/views/certificate_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/presentation/certificate/widgets/k.home.certificates.scroll.dart';
import 'package:portfolio/presentation/home/controllers/home.controller.dart';

import '../../utils/k.showGeneralDialog.dart';
import 'controllers/certificate.controller.dart';

class CertificateScreen extends GetView<CertificateController> {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return SizedBox(
        height: homeController.currentDevice.value == Device.Mobile ? 656 : 656,
        child: KCertificateScrollList(
          items: certificates,
          onCardTap: (cert, context) {
            showBlurredGeneralDialog(
              context: context,
              builder: (context) => CertificateView(
                certificate: cert,
                onClose: () => Navigator.of(context).maybePop(),
              ),
            );
          },
        ),
      );
    });
  }
}
