import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/certificate.controller.dart';

class CertificateScreen extends GetView<CertificateController> {
  const CertificateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CertificateScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CertificateScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
