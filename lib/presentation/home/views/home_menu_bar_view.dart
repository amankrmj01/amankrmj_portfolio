import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeMenuBarView extends GetView {
  const HomeMenuBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeMenuBarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeMenuBarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
