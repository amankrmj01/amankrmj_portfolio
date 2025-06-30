import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class HomeMenuBarView extends GetView<HomeController> {
  const HomeMenuBarView({super.key});

  final List<String> labels = const [
    'Home',
    'Works',
    'Certificates',
    'Experience',
  ];
  final List<IconData> icons = const [
    Icons.home,
    Icons.work,
    Icons.school,
    Icons.badge,
  ];

  @override
  Widget build(BuildContext context) {
    final onTapActions = controller.onTapActions;
    final selectedIndex = controller.selectedTabIndex;
    // Always return Drawer
    return Drawer(
      backgroundColor: const Color(0xFF1A1A2E),
      child: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          itemCount: labels.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            return Obx(() {
              final isSelected = selectedIndex.value == index;
              return ListTile(
                leading: Icon(
                  icons[index],
                  color: isSelected ? const Color(0xFFF66435) : Colors.grey,
                ),
                title: Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: isSelected ? const Color(0xFFF66435) : Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop(); // Close the drawer
                  onTapActions[index](); // Then perform the action
                },
                selected: isSelected,
                selectedTileColor: const Color(0xFFF4EFCA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
