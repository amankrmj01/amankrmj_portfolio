import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/models/info.model.dart';
import '../widgets/k.card.dart';

class KSliverList extends StatelessWidget {
  final Future<List<InfoModel>> Function() fetchData;
  final void Function(InfoModel project, BuildContext context) onCardTap;

  const KSliverList({
    super.key,
    required this.fetchData,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<InfoModel>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: Something went wrong.',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          );
        } else if (snapshot.hasData) {
          final list = snapshot.data ?? [];
          if (list.isEmpty) {
            return const Center(
              child: Text(
                'No data found.',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            );
          }
          return SizedBox(
            height: (Get.height > 776 ? Get.height : 776) - 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              itemCount: list.length < 4 ? list.length : 4,
              separatorBuilder: (context, index) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                final item = list[index];
                return KCard(
                  info: item,
                  onTap: () => onCardTap(item, context),
                  height: 360,
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text(
              'No data found.',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          );
        }
      },
    );
  }
}
