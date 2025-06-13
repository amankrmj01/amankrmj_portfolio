import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/contact_me.controller.dart';

class ContactMeScreen extends GetView<ContactMeController> {
  const ContactMeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactMeScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContactMeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
