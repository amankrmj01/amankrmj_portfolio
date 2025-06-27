// ignore_for_file: unused_import

import 'package:portfolio/domain/models/info.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/infrastructure/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/widgets/k.image.dart';

import '../../../domain/models/certificate.model.dart';

class CertificateView extends StatelessWidget {
  final InfoModel certificate;
  final VoidCallback? onClose;

  const CertificateView({super.key, required this.certificate, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Material(
          color: Colors.transparent,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Color.lerp(Color(0xFF23304A), Colors.transparent, 0.06)!,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Custom AppBar
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          certificate.name,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: KColor.primaryColor,
                            fontFamily: 'ShantellSans',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 28, weight: 900),
                        onPressed:
                            onClose ?? () => Navigator.of(context).maybePop(),
                        tooltip: 'Close',
                        style: ButtonStyle(
                          iconColor: WidgetStateProperty.all(
                            KColor.primaryColor,
                          ),
                          overlayColor: WidgetStateProperty.all(Colors.white12),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: Colors.white),
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 400,
                            child: KImage(info: certificate),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          certificate.name,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: KColor.primaryColor,
                            fontFamily: 'ShantellSans',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          certificate.description,
                          style: TextStyle(
                            fontSize: 18,
                            color: KColor.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          certificate.largeDescription,
                          style: TextStyle(
                            fontSize: 16,
                            color: KColor.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 24),
                        if (certificate.url.isNotEmpty)
                          SizedBox(
                            height: 60,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.link,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 8),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (await canLaunchUrl(
                                        Uri.parse(certificate.url),
                                      )) {
                                        await launchUrl(
                                          Uri.parse(certificate.url),
                                          mode: LaunchMode.externalApplication,
                                          webOnlyWindowName: '_blank',
                                        );
                                      }
                                    },
                                    child: Text(
                                      certificate.url,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
