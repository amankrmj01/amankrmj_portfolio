// ignore_for_file: unused_import

import 'package:portfolio/configs/projects_list.dart';
import 'package:portfolio/domain/models/project.model.dart';
import 'package:portfolio/presentation/works/views/all_wroks_view.dart';
import 'package:portfolio/presentation/works/views/work_view.dart';
import 'package:portfolio/widgets/k.card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return KSliverList(
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
    });
  }
}
