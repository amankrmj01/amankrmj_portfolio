import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WorkInDetailView extends GetView {
  const WorkInDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkInDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WorkInDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
