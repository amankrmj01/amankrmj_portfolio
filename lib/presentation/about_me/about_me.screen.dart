import 'dart:ui';

import 'package:portfolio/domain/models/about.me.info.model.dart';
import 'package:portfolio/domain/models/experience.model.dart';
import 'package:portfolio/presentation/about_me/widgets/animated.experience.card.dart';
import 'package:portfolio/presentation/about_me/widgets/animated.tools.widget.dart';
import 'package:portfolio/presentation/experience/experience.screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/experience.dart';
import '../../utils/k.navigate.dart';
import '../experience/controllers/experience.controller.dart';
import 'controllers/about_me.controller.dart';

class AboutMeScreen extends GetView<AboutMeController> {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        height: height * 0.70,
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
                Color.lerp(Colors.transparent, Colors.black, 0.30)!,
                Color.lerp(Colors.transparent, Colors.black, 0.25)!,
                Color.lerp(Colors.transparent, Colors.black, 0.20)!,
                Color.lerp(Colors.transparent, Colors.black, 0.15)!,
                Color.lerp(Colors.transparent, Colors.black, 0.05)!,
                Color.lerp(Colors.transparent, Colors.black, 0.10)!,
                Color.lerp(Colors.transparent, Colors.black, 0.15)!,
                Color.lerp(Colors.transparent, Colors.black, 0.20)!,
                Color.lerp(Colors.transparent, Colors.black, 0.25)!,
                Color.lerp(Colors.transparent, Colors.black, 0.30)!,
                Color.lerp(Colors.transparent, Colors.black, 0.30)!,
                Color.lerp(Colors.transparent, Colors.black, 0.20)!,
              ],
            ),
          ),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : width > 1000
                ? Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: AboutMeDetailsColumn(
                          summary: controller.aboutMeInfo.value?.summary,
                          profession: controller.aboutMeInfo.value?.profession,
                          education: controller.aboutMeInfo.value?.education,
                          experience: controller.aboutMeInfo.value?.experience,
                          email: controller.aboutMeInfo.value?.email,
                          interests: controller.aboutMeInfo.value?.interests,
                        ),
                      ),
                      const SizedBox(width: 60),
                      Flexible(
                        flex: 3,
                        child: AboutMeToolsColumn(
                          tools: controller.aboutMeInfo.value!.tools,
                          experiences: experiences,
                        ),
                      ),
                    ],
                  )
                : ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(
                      scrollbars: false,
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AboutMeDetailsColumn(
                            summary: controller.aboutMeInfo.value?.summary,
                            profession:
                                controller.aboutMeInfo.value?.profession,
                            education: controller.aboutMeInfo.value?.education,
                            experience:
                                controller.aboutMeInfo.value?.experience,
                            email: controller.aboutMeInfo.value?.email,
                            interests: controller.aboutMeInfo.value?.interests,
                          ),
                          const SizedBox(height: 24),
                          AboutMeToolsColumn(
                            tools: controller.aboutMeInfo.value!.tools,
                            experiences: experiences,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class AboutMeDetailsColumn extends StatelessWidget {
  final String? summary;
  final String? profession;
  final String? education;
  final String? experience;
  final String? email;
  final List<String>? interests;

  const AboutMeDetailsColumn({
    super.key,
    this.summary,
    this.profession,
    this.education,
    this.experience,
    this.email,
    this.interests,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          summary ?? '',
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
            Text('Education: $education', style: const TextStyle(fontSize: 16)),
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
        const Text(
          'Interests:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        if (interests != null)
          Wrap(
            spacing: 8,
            children: interests!
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
    );
  }
}

class AboutMeToolsColumn extends StatelessWidget {
  final List<ToolModel> tools;
  final List<ExperienceModel> experiences;

  const AboutMeToolsColumn({
    super.key,
    required this.tools,
    required this.experiences,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '   Tools I Use:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            AnimatedToolsWidget(tools: tools),
          ],
        ),
        InkWell(
          onTap: () {
            if (!Get.isRegistered<ExperienceController>()) {
              Get.put(ExperienceController());
            }
            navigateWithSlideTransition(context, const ExperienceScreen());
          },
          child: LayoutBuilder(
            builder: (context, constraints) => AnimatedExperienceCard(
              experiences: experiences,
              width: constraints.maxWidth,
            ),
          ),
        ),
      ],
    );
  }
}
