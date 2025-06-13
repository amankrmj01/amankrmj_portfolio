import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/works.controller.dart';

class WorksScreen extends GetView<WorksController> {
  const WorksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorksScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WorksScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
