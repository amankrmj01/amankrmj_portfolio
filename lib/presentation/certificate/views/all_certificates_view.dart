import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/k.showGeneralDialog.dart';
import '../../../utils/k.sliver.grid.dart';
import '../controllers/certificate.controller.dart';
import 'certificate_view.dart';

class AllCertificatesView extends GetView<CertificateController> {
  const AllCertificatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      tooltip: 'Back',
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "ALL Certificates",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "ShantellSans",
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        letterSpacing: 1.2,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (controller.certificates.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'No certificates found.',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                );
              }
              return KSliverGrid(
                items: controller.certificates,
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
            }),
          ],
        ),
      ),
    );
  }
}
