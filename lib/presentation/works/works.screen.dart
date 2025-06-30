import 'package:portfolio/presentation/works/views/work_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/presentation/works/widgets/k.home.projects.scroll.dart';

import '../../utils/k.showGeneralDialog.dart';
import 'controllers/works.controller.dart';

class WorksScreen extends GetView<WorksController> {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return SizedBox(
        height: 656,
        child: KProjectsScrollList(
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
        ),
      );
    });
  }
}
