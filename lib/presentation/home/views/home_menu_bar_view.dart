import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeMenuBarView extends GetView {
  const HomeMenuBarView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example menu items, you can replace with your actual menu data
    final List<_MenuItem> menuItems = [
      _MenuItem(icon: Icons.home, label: 'Home', onTap: () {}),
      _MenuItem(icon: Icons.work, label: 'Projects', onTap: () {}),
      _MenuItem(icon: Icons.school, label: 'Certificates', onTap: () {}),
      _MenuItem(icon: Icons.info, label: 'About', onTap: () {}),
      _MenuItem(icon: Icons.contact_mail, label: 'Contact', onTap: () {}),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Menu'), centerTitle: true),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        itemCount: menuItems.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return ListTile(
            leading: Icon(
              item.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              item.label,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: item.onTap,
            trailing: const Icon(Icons.chevron_right),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hoverColor: Colors.grey.withAlpha((0.1 * 255).toInt()),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  _MenuItem({required this.icon, required this.label, required this.onTap});
}
