// ignore_for_file: unused_import, unnecessary_import

import 'dart:ui';

import 'package:amankrmj_portfolio/presentation/works/views/work_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:amankrmj_portfolio/widgets/k.card.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:animations/animations.dart';

import '../../../configs/projects_list.dart';
import '../../../infrastructure/dal/daos/project.info.dart';
import '../../../utils/axis.count.dart';
import '../../../utils/k.showGeneralDialog.dart';
import '../../../utils/k.transition.container.transform.dart';

class AllWorksView extends GetView {
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
                      "ALL PROJECTS",
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
            SliverMasonryGrid.count(
              crossAxisCount: getCrossAxisCount(context),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Builder(
                  builder: (context) => KCard(
                    info: project,
                    onTap: () {
                      showBlurredGeneralDialog(
                        context: context,
                        builder: (context) => WorkView(
                          project: project,
                          onClose: () => Navigator.of(context).maybePop(),
                        ),
                        barrierLabel: 'Project',
                      );
                    },
                  ),
                );
              },
              childCount: projects.length,
            ),
          ],
        ),
      ),
    );
  }
}
