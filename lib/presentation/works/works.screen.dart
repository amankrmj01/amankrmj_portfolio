// ignore_for_file: unused_import

import 'package:amankrmj_portfolio/configs/projects_list.dart';
import 'package:amankrmj_portfolio/presentation/works/views/all_wroks_view.dart';
import 'package:amankrmj_portfolio/presentation/works/views/work_view.dart';
import 'package:amankrmj_portfolio/widgets/k.card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/axis.count.dart';
import '../../utils/k.navigate.dart';
import '../../utils/k.showGeneralDialog.dart';
import '../../widgets/animated.navigate.button.dart';
import 'controllers/works.controller.dart';

class WorksScreen extends StatelessWidget {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: getCrossAxisCount(context),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      itemBuilder: (context, index) {
        final cert = projects[index];
        return KCard(info: cert);
      },
      childCount: projects.length <= 4 ? projects.length : 4,
    );
  }
}
