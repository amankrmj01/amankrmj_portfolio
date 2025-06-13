import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/projects.controller.dart';

class ProjectsScreen extends GetView<ProjectsController> {
  const ProjectsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjectsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
