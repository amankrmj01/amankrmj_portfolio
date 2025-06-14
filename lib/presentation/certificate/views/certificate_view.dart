// ignore_for_file: unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:amankrmj_portfolio/infrastructure/dal/daos/certificate.info.dart';
import 'package:amankrmj_portfolio/widgets/k.image.dart';

class CertificateView extends StatelessWidget {
  final CertificateInfo certificate;
  final VoidCallback? onClose;

  const CertificateView({super.key, required this.certificate, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: Colors.black.withAlpha(102), // 102/255 ≈ 0.4 opacity
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
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
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'ShantellSans',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 28,
                              weight: 900,
                            ),
                            onPressed:
                                onClose ??
                                () => Navigator.of(context).maybePop(),
                            tooltip: 'Close',
                            style: ButtonStyle(
                              iconColor: WidgetStateProperty.all(Colors.black),
                              overlayColor: WidgetStateProperty.all(
                                Colors.black12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Flexible(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: KImage(info: certificate)),
                            const SizedBox(height: 24),
                            Text(
                              certificate.name,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'ShantellSans',
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              certificate.description,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              certificate.largeDescription,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 24),
                            if (certificate.url.isNotEmpty)
                              Row(
                                children: [
                                  const Icon(
                                    Icons.link,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 8),
                                  Flexible(
                                    child: SelectableText(
                                      certificate.url,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
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
        ),
      ],
    );
  }
}
