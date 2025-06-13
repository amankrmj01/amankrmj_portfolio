import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/experience.controller.dart';

class ExperienceScreen extends GetView<ExperienceController> {
  const ExperienceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExperienceScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExperienceScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
