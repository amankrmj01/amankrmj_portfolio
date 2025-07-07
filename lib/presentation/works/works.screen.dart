import 'package:portfolio/presentation/home/controllers/home.controller.dart';
import 'package:portfolio/presentation/works/views/work_mobile_view.dart';
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
    final HomeController homeController = Get.find<HomeController>();
    final isMobile = homeController.currentDevice.value == Device.Mobile;
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return SizedBox(
        height: isMobile ? MediaQuery.of(context).size.height * 0.85 : 656,
        child: KProjectsScrollList(
          items: controller.projects,
          onCardTap: (project, context) {
            showBlurredGeneralDialog(
              context: context,
              builder: (context) => isMobile
                  ? WorkMobileView(
                      project: project,
                      onClose: () => Navigator.of(context).maybePop(),
                    )
                  : WorkView(
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
