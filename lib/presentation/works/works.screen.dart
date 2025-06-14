// ignore_for_file: unused_import

import 'package:amankrmj_portfolio/configs/projects_list.dart';
import 'package:amankrmj_portfolio/domain/models/projects_info.dart';
import 'package:amankrmj_portfolio/presentation/works/views/all_wroks_view.dart';
import 'package:amankrmj_portfolio/presentation/works/views/work_view.dart';
import 'package:amankrmj_portfolio/widgets/k.card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../domain/models/certificate_info.dart';
import '../../utils/axis.count.dart';
import '../../utils/k.navigate.dart';
import '../../utils/k.showGeneralDialog.dart';
import '../../widgets/animated.navigate.button.dart';
import '../certificate/views/all_certificates_view.dart';
import 'controllers/works.controller.dart';

class WorksScreen extends GetView<WorksController> {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return FutureBuilder<List<ProjectInfo>>(
        future: controller.fetchProjects(),
        builder: (context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'Error: Something went wrong.',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              final projectList = snapshot.data ?? [];
              if (projectList.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'No data found.',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                );
              }
              return KSliverGrid(
                home: true,
                fetchData: controller.fetchProjects,
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
            } else {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'No data found.',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
              );
            }
          } catch (e) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'An unexpected error occurred.',
                  style: TextStyle(color: Colors.red, fontSize: 24),
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            'A fatal error occurred. $e',
            style: const TextStyle(color: Colors.red, fontSize: 24),
          ),
        ),
      );
    }
  }
}
