import 'package:amankrmj_portfolio/domain/models/projects_info.dart';
import 'package:amankrmj_portfolio/infrastructure/dal/services/project_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: unused_import
import '../widgets/infinte.tilted.strip.dart';

class WorksController extends GetxController {
  final ScrollController scrollController = ScrollController();

  Future<List<ProjectInfo>> fetchProjects() async {
    final service = Get.find<ProjectService>();
    return await service.fetchAll();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    scrollController.dispose();
  }
}
