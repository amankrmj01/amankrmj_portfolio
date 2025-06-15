// ignore_for_file: unused_import

import 'package:amankrmj_portfolio/configs/projects_list.dart';
import 'package:amankrmj_portfolio/domain/models/project.model.dart';
import 'package:amankrmj_portfolio/presentation/works/views/all_wroks_view.dart';
import 'package:amankrmj_portfolio/presentation/works/views/work_view.dart';
import 'package:amankrmj_portfolio/widgets/k.card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../domain/models/certificate.model.dart';
import '../../domain/models/info.model.dart';
import '../../utils/axis.count.dart';
import '../../utils/k.left.scroll.list.dart';
import '../../utils/k.navigate.dart';
import '../../utils/k.showGeneralDialog.dart';
import '../../utils/k.sliver.grid.dart';
import '../../widgets/animated.navigate.button.dart';
import '../certificate/views/all_certificates_view.dart';
import 'controllers/works.controller.dart';

class WorksScreen extends GetView<WorksController> {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KSliverList(
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
  }
}
