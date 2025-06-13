import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/project_details.controller.dart';

class ProjectDetailsScreen extends GetView<ProjectDetailsController> {
  const ProjectDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectDetailsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjectDetailsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
