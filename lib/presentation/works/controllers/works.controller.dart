import 'dart:developer';

import 'package:portfolio/domain/models/project.model.dart';
import 'package:portfolio/infrastructure/dal/services/project_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: unused_import
import '../widgets/infinte.tilted.strip.dart';

class WorksController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final projects = <ProjectModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    isLoading.value = true;
    try {
      final data = await Get.find<ProjectService>().fetchAll();
      projects.assignAll(data);
    } catch (e) {
      fetchProjects();
      log('Error fetching projects: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
  }
}
