import 'package:portfolio/configs/certificates.dart';
import 'package:portfolio/presentation/certificate/views/certificate_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/presentation/certificate/widgets/k.home.certificates.scroll.dart';

import '../../utils/k.showGeneralDialog.dart';
import 'controllers/certificate.controller.dart';

class CertificateScreen extends GetView<CertificateController> {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return SizedBox(
        height:
            (MediaQuery.of(context).size.height > 776
                ? MediaQuery.of(context).size.height
                : 776) -
            120,
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
