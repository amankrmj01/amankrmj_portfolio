import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/presentation/admin/views/login_form.dart';

import '../../widgets/mesh.background.dart';
import 'controllers/admin.controller.dart';

class AdminScreen extends GetView<AdminController> {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned.fill(child: const SharedMeshBackground()),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
