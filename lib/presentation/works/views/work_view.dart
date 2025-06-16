// ignore_for_file: unused_import

import 'dart:ui';

import 'package:amankrmj_portfolio/domain/models/info.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:amankrmj_portfolio/widgets/k.image.dart';

import '../../../domain/models/certificate.model.dart';
import '../../../widgets/k.infinite.scroll.image.dart';
import '../controllers/works.controller.dart';

class WorkView extends StatefulWidget {
  final InfoModel project;
  final VoidCallback? onClose;

  const WorkView({super.key, required this.project, this.onClose});

  @override
  State<WorkView> createState() => _WorkViewState();
}

class _WorkViewState extends State<WorkView> {
  final controller = Get.find<WorksController>();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                          widget.project.name,
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
                            widget.onClose ??
                            () => Navigator.of(context).maybePop(),
                        tooltip: 'Close',
                        style: ButtonStyle(
                          iconColor: WidgetStateProperty.all(Colors.black),
                          overlayColor: WidgetStateProperty.all(Colors.black12),
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
                            child: KInfiniteScrollImage(
                              items: controller.projects,
                              height: 400,
                              imageWidth: 400, // Adjust as needed
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          widget.project.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'ShantellSans',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.project.description,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.project.largeDescription,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 24),
                        if (widget.project.url.isNotEmpty)
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
                                        Uri.parse(widget.project.url),
                                      )) {
                                        await launchUrl(
                                          Uri.parse(widget.project.url),
                                          mode: LaunchMode.externalApplication,
                                          webOnlyWindowName: '_blank',
                                        );
                                      }
                                    },
                                    child: Text(
                                      widget.project.url,
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
