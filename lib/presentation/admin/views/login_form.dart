import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/dal/services/admin.login.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/theme/colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
    required BuildContext context,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: Icon(icon, color: Colors.black),
      filled: true,
      fillColor: KColor.primaryColor,
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

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final service = AdminLoginService();
      final isValid = await service.login(
        usernameController.text,
        passwordController.text,
      );
      if (!mounted) return;
      if (isValid) {
        Get.closeAllSnackbars();
        Get.snackbar(
          'Success',
          'Login Successful',
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.check_circle, color: Colors.green, size: 28),
          backgroundColor: Colors.green.shade50,
          colorText: Colors.black,
          barBlur: 0.7,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          borderRadius: 12,
        );
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            Get.toNamed(
              Routes.CONTACT,
              arguments: usernameController.text + passwordController.text,
            );
          }
        });
      } else {
        Get.snackbar(
          'Error',
          'Invalid credentials',
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error_outline, color: Colors.red, size: 28),
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black,
          barBlur: 0.7,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          borderRadius: 12,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: usernameController,
            style: const TextStyle(color: Colors.black),
            onFieldSubmitted: (_) => _submit(),
            decoration: _inputDecoration(
              label: 'Username',
              icon: Icons.person,
              context: context,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your admin username';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            style: const TextStyle(color: Colors.black),
            onFieldSubmitted: (_) => _submit(),
            decoration: _inputDecoration(
              label: 'Password',
              icon: Icons.lock,
              context: context,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: KColor.secondaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: const Text(
              'Submit',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
