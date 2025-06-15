import 'package:amankrmj_portfolio/presentation/certificate/views/certificate_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/k.left.scroll.list.dart';
import '../../utils/k.showGeneralDialog.dart';
import 'controllers/certificate.controller.dart';

class CertificateScreen extends GetView<CertificateController> {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KSliverList(
      fetchData: controller.fetchCertificates,
      onCardTap: (cert, context) {
        showBlurredGeneralDialog(
          context: context,
          builder: (context) => CertificateView(
            certificate: cert,
            onClose: () => Navigator.of(context).maybePop(),
          ),
        );
      },
    );
  }
}
