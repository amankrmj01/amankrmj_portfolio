import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/theme/colors.dart';

class ContactMeView extends StatelessWidget {
  const ContactMeView({super.key});

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
    required BuildContext context,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      prefixIcon: Icon(icon, color: Colors.black),
      filled: true,
      fillColor: KColor.primarySecondColor.withAlpha((0.15 * 255).toInt()),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: KColor.secondarySecondColor, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final countryCodeController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 600,
            height: (Get.height > 776 ? Get.height : 776) - 80,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildHeader(context),
                  const Divider(height: 1),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                    decoration: _inputDecoration(
                      label: 'Full Name',
                      icon: Atlas.users,
                      context: context,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: countryCodeController,
                          style: const TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                          decoration: _inputDecoration(
                            label: 'Country Code',
                            icon: Icons.flag_outlined,
                            context: context,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          style: const TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                          decoration: _inputDecoration(
                            label: 'Phone Number',
                            icon: Atlas.phonebook,
                            context: context,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                    decoration: _inputDecoration(
                      label: 'Email Address',
                      icon: Atlas.inbox_mailbox,
                      context: context,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement submit logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KColor.secondaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Contact Me",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'ShantellSans',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
            size: 28,
            weight: 900,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
          tooltip: 'Close',
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(Colors.black),
            overlayColor: WidgetStateProperty.all(Colors.black12),
          ),
        ),
      ],
    );
  }
}
