// ignore_for_file: unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:amankrmj_portfolio/infrastructure/dal/daos/project.info.dart';
import 'package:amankrmj_portfolio/widgets/k.image.dart';

class WorkView extends StatelessWidget {
  final ProjectInfo project;
  final VoidCallback? onClose;

  const WorkView({super.key, required this.project, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(color: Colors.black.withAlpha(102)),
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
                            Center(child: KImage(info: project)),
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
                                      project.url,
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

// Update any project-specific references to work/project-specific ones as needed.
// For example, if you have variables like 'project', change them to 'work' or 'certificate'.
// If you have project-specific widgets, update them to their work/certificate equivalents.
// If you want to change the displayed fields, update them here as well.
// Example:
// Text(
//   work.name,
//   style: ...
// ),
// ...
// Text(
//   work.description,
//   style: ...
// ),
// ...
// And so on for other fields.
// If you have a list of works, make sure the data source and widgets match the work/project model.
