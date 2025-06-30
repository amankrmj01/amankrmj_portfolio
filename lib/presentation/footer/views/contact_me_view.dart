import 'dart:convert';

import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/domain/models/contact_form.model.dart';
import 'package:portfolio/infrastructure/dal/services/add.contact.service.dart';

import '../../../infrastructure/dal/services/ping.server.dart';
import '../../../infrastructure/theme/colors.dart';
import '../../../utils/show_decorated_toast.dart';

// Moved to utils/show_decorated_toast.dart
// Please import and use showDecoratedToast from utils.

class ContactMeView extends StatefulWidget {
  const ContactMeView({super.key});

  @override
  State<ContactMeView> createState() => _ContactMeViewState();
}

class _ContactMeViewState extends State<ContactMeView> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _countryCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final Logger _logger = Logger();

  @override
  void dispose() {
    _nameController.dispose();
    _countryCodeController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController.clear();
    _countryCodeController.clear();
    _phoneController.clear();
    _emailController.clear();
    _messageController.clear();

    final PingServerService pingServerService = PingServerService();
    _pingUntilSuccess(pingServerService);
  }

  Future<void> _pingUntilSuccess(PingServerService pingServerService) async {
    final Logger logger = Logger();
    while (true) {
      try {
        final result = await pingServerService.ping();
        if (result == 'true') {
          logger.i('Server connected');
          break;
        } else {
          logger.w('Server not connected, try again');
        }
      } catch (e) {
        logger.e('Server not connected, try again');
      }
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  Future<void> _handleSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = _nameController.text.trim();
    final countryCode = _countryCodeController.text.trim();
    final phone = _phoneController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    final now = DateTime.now();
    final date = DateFormat('MMMM d, yyyy').format(now);
    final time = DateFormat('hh:mm a').format(now);
    final contactForm = ContactFormModel(
      name: name,
      countryCode: countryCode,
      phoneNumber: phone,
      email: email,
      message: message,
      date: date,
      time: time,
    );
    final AddContactService addContactService = AddContactService();
    final response = await addContactService.addContact(contactForm);
    _logger.i('Response from server: ${jsonEncode(contactForm.toJson())}');
    if (response == 'true') {
      showDecoratedToast('Message sent successfully');
      if (context.mounted) {
        Navigator.of(context).maybePop();
      }
    } else {
      showDecoratedToast('Failed to send message: \n$response');
      _logger.e('Failed to send message: $response');
    }
  }

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

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int minLines = 1,
    int maxLines = 1,
    double? width,
    TextInputType? keyboardType,
    required BuildContext context,
    required String? Function(String?) validator,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
  }) {
    final field = TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.start,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: _inputDecoration(label: label, icon: icon, context: context),
      validator: validator,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
    );
    return width != null ? SizedBox(width: width, child: field) : field;
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 600,
            height:
                (MediaQuery.of(context).size.height > 776
                    ? MediaQuery.of(context).size.height
                    : 776) -
                80,
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
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildTextFormField(
                              controller: _nameController,
                              label: 'Full Name',
                              icon: Atlas.users,
                              context: context,
                              validator: (value) =>
                                  value == null || value.trim().isEmpty
                                  ? 'Please enter your name'
                                  : null,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) => {_handleSubmit(context)},
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                _buildTextFormField(
                                  controller: _countryCodeController,
                                  label: 'Country Code',
                                  icon: Icons.flag_outlined,
                                  width: 100,
                                  keyboardType: TextInputType.phone,
                                  context: context,
                                  validator: (value) =>
                                      value == null || value.trim().isEmpty
                                      ? 'Code?'
                                      : null,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) => {
                                    _handleSubmit(context),
                                  },
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildTextFormField(
                                    controller: _phoneController,
                                    label: 'Phone Number',
                                    icon: Atlas.phonebook,
                                    keyboardType: TextInputType.phone,
                                    context: context,
                                    validator: (value) =>
                                        value == null || value.trim().isEmpty
                                        ? 'Phone?'
                                        : null,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (_) => {
                                      _handleSubmit(context),
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            _buildTextFormField(
                              controller: _emailController,
                              label: 'Email Address',
                              icon: Atlas.inbox_mailbox,
                              keyboardType: TextInputType.emailAddress,
                              context: context,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Email?';
                                }
                                final emailRegex = RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                );
                                if (!emailRegex.hasMatch(value.trim())) {
                                  return 'Invalid email';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) => {_handleSubmit(context)},
                            ),
                            const SizedBox(height: 20),
                            _buildTextFormField(
                              controller: _messageController,
                              label: 'Message',
                              icon: Icons.message_outlined,
                              minLines: 1,
                              maxLines: 8,
                              context: context,
                              validator: (value) =>
                                  value == null || value.trim().isEmpty
                                  ? 'Message?'
                                  : null,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (_) => {_handleSubmit(context)},
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () => {_handleSubmit(context)},
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
                                'Submit',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
}
