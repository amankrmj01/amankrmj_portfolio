import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../infrastructure/theme/colors.dart';
import '../../../widgets/k.card.dart';
import '../../../utils/k.showGeneralDialog.dart';
import 'certificate_view.dart';
import '../controllers/certificate.controller.dart';

class AllCertificatesView extends GetView<CertificateController> {
  const AllCertificatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AllItemsView(
        title: "ALL Certificates",
        isLoading: controller.isLoading.value,
        items: controller.certificates,
        titleColor: KColor.primarySecondColor,
        buildDialog: (certificate) => CertificateView(
          certificate: certificate,
          onClose: () => Navigator.of(context).maybePop(),
        ),
        buildCard: (certificate, onTap) =>
            KCard(info: certificate, onTap: onTap, height: 360),
      ),
    );
  }
}

class AllItemsView<T> extends StatelessWidget {
  final String title;
  final bool isLoading;
  final List<T> items;
  final Color titleColor;
  final Widget Function(T item) buildDialog;
  final Widget Function(T item, VoidCallback onTap) buildCard;

  const AllItemsView({
    super.key,
    required this.title,
    required this.isLoading,
    required this.items,
    required this.titleColor,
    required this.buildDialog,
    required this.buildCard,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: titleColor),
                    tooltip: 'Back',
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                      fontFamily: "ShantellSans",
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      letterSpacing: 1.2,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : items.isEmpty
                  ? const Center(
                      child: Text(
                        'No items found.',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    )
                  : MasonryGridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return buildCard(
                          item,
                          () => showBlurredGeneralDialog(
                            context: context,
                            builder: (context) => buildDialog(item),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
