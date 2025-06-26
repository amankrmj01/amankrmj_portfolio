import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/models/info.model.dart';
import '../widgets/k.card.dart';

class KSliverList extends StatelessWidget {
  final List<InfoModel> items;
  final void Function(InfoModel project, BuildContext context) onCardTap;

  const KSliverList({super.key, required this.items, required this.onCardTap});

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
      height: (Get.height > 776 ? Get.height : 776) - 120,
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
            return KCard(
              info: item,
              onTap: () => onCardTap(item, context),
              height: 360,
            );
          },
        ),
      ),
    );
  }
}
