import 'package:amankrmj_portfolio/configs/projects_list.dart';
import 'package:amankrmj_portfolio/widgets/k.card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/axis.count.dart';
import 'controllers/works.controller.dart';

class WorksScreen extends GetView<WorksController> {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = controller.scrollController;
    return SafeArea(
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              child: Text(
                "MY RECENT WORKS",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "ShantellSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  letterSpacing: 1.2,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          SliverMasonryGrid.count(
            crossAxisCount: getCrossAxisCount(context),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            itemBuilder: (context, index) {
              final project = projects[index];
              return KCard(info: project);
            },
            childCount: projects.length,
          ),
        ],
      ),
    );
  }
}
