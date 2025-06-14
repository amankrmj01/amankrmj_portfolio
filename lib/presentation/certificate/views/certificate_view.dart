import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:amankrmj_portfolio/infrastructure/dal/daos/certificate.info.dart';
import 'package:amankrmj_portfolio/widgets/k.image.dart';

class CertificateView extends StatelessWidget {
  final CertificateInfo certificate;

  const CertificateView({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred background
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(color: Colors.black12),
          ),
        ),
        // Foreground content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.black),
                          onPressed: () => Navigator.of(context).maybePop(),
                          tooltip: 'Close',
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            certificate.name,
                            style: const TextStyle(
                              fontFamily: 'ShantellSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                              letterSpacing: 1.1,
                              decoration: TextDecoration.none,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
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
      ],
    );
  }
}
