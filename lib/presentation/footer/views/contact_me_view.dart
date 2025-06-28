import 'dart:convert';

import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';

import '../../../domain/models/contact_form.model.dart';
import '../../../domain/models/github_commit.model.dart';
import '../../../infrastructure/dal/services/email.verification.dart';
import '../../../infrastructure/dal/services/github_commit.service.dart';
import '../../../infrastructure/dal/services/phone.verification.dart';
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

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final countryCodeController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(20),
            width: 600,
            height: (Get.height > 776 ? Get.height : 776) - 80,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(context),
                const Divider(height: 1),
                const SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: _ContactForm(
                      nameController: nameController,
                      countryCodeController: countryCodeController,
                      phoneController: phoneController,
                      emailController: emailController,
                      messageController: messageController,
                      inputDecoration: _inputDecoration,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Contact Me",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: KColor.primarySecondColor,
              fontFamily: 'ShantellSans',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 28, weight: 900),
          onPressed: () => Navigator.of(context).maybePop(),
          tooltip: 'Close',
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(KColor.primarySecondColor),
            overlayColor: WidgetStateProperty.all(Colors.white12),
          ),
        ),
      ],
    );
  }
}

class _ContactForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController countryCodeController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final InputDecoration Function({
    required String label,
    required IconData icon,
    required BuildContext context,
  })
  _inputDecoration;

  const _ContactForm({
    required this.nameController,
    required this.countryCodeController,
    required this.phoneController,
    required this.emailController,
    required this.messageController,
    required InputDecoration Function({
      required String label,
      required IconData icon,
      required BuildContext context,
    })
    inputDecoration,
  }) : _inputDecoration = inputDecoration;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: nameController,
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.start,
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
                textAlign: TextAlign.start,
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
                textAlign: TextAlign.start,
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
          textAlign: TextAlign.start,
          decoration: _inputDecoration(
            label: 'Email Address',
            icon: Atlas.inbox_mailbox,
            context: context,
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: messageController,
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.start,
          minLines: 1,
          maxLines: 8,
          decoration: _inputDecoration(
            label: 'Message',
            icon: Icons.message_outlined,
            context: context,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                if (nameController.text.trim().isEmpty ||
                    countryCodeController.text.trim().isEmpty ||
                    phoneController.text.trim().isEmpty ||
                    emailController.text.trim().isEmpty ||
                    messageController.text.trim().isEmpty) {
                  showDecoratedToast('Please fill all the fields');
                  return;
                }
                final emailValidator = EmailValidator();
                final phoneValidator = PhoneValidator();
                try {
                  final emailResponse = await emailValidator.validate(
                    emailController.text.trim(),
                  );
                  if (!emailResponse.isValidFormat.value ||
                      emailResponse.deliverability != 'DELIVERABLE') {
                    showDecoratedToast('Please enter a valid email address');
                    return;
                  }
                  final phoneResponse = await phoneValidator.validate(
                    phoneController.text.trim(),
                  );
                  if (!phoneResponse.valid) {
                    showDecoratedToast('Please enter a valid phone number');
                    return;
                  }
                  showDecoratedToast('Both email and phone are valid!');

                  // --- GitHub Commit Service Integration ---
                  final githubCommitService = GithubCommitService();
                  final committerName = nameController.text.trim();
                  final committerEmail = emailController.text.trim();
                  final contactForm = ContactFormModel(
                    name: nameController.text.trim(),
                    countryCode: countryCodeController.text.trim(),
                    phoneNumber: phoneController.text.trim(),
                    email: emailController.text.trim(),
                    message: messageController.text.trim(),
                  );
                  final encoder = JsonEncoder.withIndent('  ');
                  final contactJson = encoder.convert(contactForm.toJson());
                  final contentBase64 = base64Encode(utf8.encode(contactJson));
                  final commitModel = GithubCommitModel(
                    message: 'Add contact.json with user details',
                    content: contentBase64,
                    committer: Committer(
                      name: committerName,
                      email: committerEmail,
                    ),
                  );
                  final now = DateTime.now();
                  final formatted = DateFormat('yyyyMMdd_HHmmss').format(now);
                  final filePath = 'contact$formatted.json';
                  final response = await githubCommitService.createOrUpdateFile(
                    path: filePath,
                    commit: commitModel,
                  );
                  if (response.statusCode == 201 ||
                      response.statusCode == 200) {
                    showDecoratedToast('Contact details sent to GitHub!');
                  } else {
                    showDecoratedToast('Failed to send details to GitHub.');
                  }
                  // --- End GitHub Commit Service Integration ---
                } catch (e) {
                  showDecoratedToast('Verification failed. Please try again.');
                  return;
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: KColor.secondaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                'Submit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void showDecoratedToast(String message) {
  showToast(
    message,
    position: ToastPosition.bottom,
    backgroundColor: KColor.primaryColor,
    radius: 12,
    textStyle: TextStyle(
      color: KColor.secondarySecondColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    ),
    textPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    animationCurve: Curves.easeOutCubic,
    duration: const Duration(seconds: 3),
  );
}
