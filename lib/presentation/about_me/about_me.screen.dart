import '../../configs/about_me.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/about_me.controller.dart';

class AboutMeScreen extends GetView<AboutMeController> {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final summary = aboutMe['summary'] ?? '';
    final profession = aboutMe['profession'] ?? '';
    final education = aboutMe['education'] ?? '';
    final email = aboutMe['email'] ?? '';
    final interests = aboutMe['interests'] as List<dynamic>?;
    final experience = aboutMe['experience'] ?? '';
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.70,
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 68,
            bottom: 16,
          ),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.lerp(Colors.transparent, Colors.white, 0.30)!,
                Color.lerp(Colors.transparent, Colors.white, 0.25)!,
                Color.lerp(Colors.transparent, Colors.white, 0.20)!,
                Color.lerp(Colors.transparent, Colors.white, 0.15)!,
                Color.lerp(Colors.transparent, Colors.white, 0.05)!,
                Color.lerp(Colors.transparent, Colors.white, 0.10)!,
                Color.lerp(Colors.transparent, Colors.white, 0.15)!,
                Color.lerp(Colors.transparent, Colors.white, 0.20)!,
                Color.lerp(Colors.transparent, Colors.white, 0.25)!,
                Color.lerp(Colors.transparent, Colors.white, 0.30)!,
                Color.lerp(Colors.transparent, Colors.white, 0.30)!,
                Color.lerp(Colors.transparent, Colors.white, 0.20)!,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summary,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Icon(Icons.work_outline, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Profession: $profession',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.school_outlined, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Education: $education',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.timeline, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Experience: $experience',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.email_outlined, size: 20),
                  const SizedBox(width: 8),
                  Text('Email: $email', style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 16),
              if (interests != null) ...[
                const Text(
                  'Interests:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: interests
                      .map(
                        (interest) => Chip(
                          label: Text(interest.toString()),
                          backgroundColor: Colors.blue.shade50,
                          labelStyle: const TextStyle(color: Colors.blue),
                        ),
                      )
                      .toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
