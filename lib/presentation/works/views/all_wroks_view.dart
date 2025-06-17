// ignore_for_file: unused_import, unnecessary_import

import 'dart:ui';

import 'package:portfolio/presentation/works/controllers/works.controller.dart';
import 'package:portfolio/presentation/works/views/work_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/widgets/k.card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:animations/animations.dart';

import '../../../configs/projects_list.dart';
import '../../../infrastructure/dal/daos/project.infoo.dart';
import '../../../utils/axis.count.dart';
import '../../../utils/k.showGeneralDialog.dart';
import '../../../utils/k.sliver.grid.dart';
import '../../../utils/k.transition.container.transform.dart';
import '../../certificate/views/all_certificates_view.dart';

class AllWorksView extends GetView<WorksController> {
  const AllWorksView({super.key});

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
                      "ALL Projects",
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
              if (controller.projects.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'No projects found.',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                );
              }
              return KSliverGrid(
                items: controller.projects,
                onCardTap: (project, context) {
                  showBlurredGeneralDialog(
                    context: context,
                    builder: (context) => WorkView(
                      project: project,
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
