import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AllWroksView extends GetView {
  const AllWroksView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllWroksView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllWroksView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
