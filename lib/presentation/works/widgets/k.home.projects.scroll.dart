import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/domain/models/project.model.dart';
import 'package:portfolio/presentation/works/widgets/k.project.card.dart';

class KProjectsScrollList extends StatelessWidget {
  final List<ProjectModel> items;
  final void Function(ProjectModel project, BuildContext context) onCardTap;

  const KProjectsScrollList({
    super.key,
    required this.items,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No data found.',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      );
    }
    return SizedBox(
      height: 656,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          physics: const BouncingScrollPhysics(),
          itemCount: items.length < 4 ? items.length : 4,
          separatorBuilder: (context, index) => const SizedBox(width: 24),
          itemBuilder: (context, index) {
            final item = items[index];
            return KProjectCard(
              project: item,
              onTap: () => onCardTap(item, context),
              height: 360,
            );
          },
        ),
      ),
    );
  }
}
