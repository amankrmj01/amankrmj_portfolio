// ignore_for_file: unused_import

import 'dart:ui';

import 'package:amankrmj_portfolio/domain/models/info.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:amankrmj_portfolio/widgets/k.image.dart';

import '../../../domain/models/certificate_info.dart';

class WorkView extends StatelessWidget {
  final InfoModel project;
  final VoidCallback? onClose;

  const WorkView({super.key, required this.project, this.onClose});

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
                              project.name,
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
                            Center(
                              child: SizedBox(
                                height: 400,
                                child: KImage(info: project),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              project.name,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'ShantellSans',
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              project.description,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              project.largeDescription,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 24),
                            if (project.url.isNotEmpty)
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
                                            Uri.parse(project.url),
                                          )) {
                                            await launchUrl(
                                              Uri.parse(project.url),
                                              mode: LaunchMode
                                                  .externalApplication,
                                              webOnlyWindowName: '_blank',
                                            );
                                          }
                                        },
                                        child: Text(
                                          project.url,
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
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
        ),
      ],
    );
  }
}
