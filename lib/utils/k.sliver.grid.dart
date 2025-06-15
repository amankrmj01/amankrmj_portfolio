import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../domain/models/info.model.dart';
import '../widgets/k.card.dart';
import 'axis.count.dart';

class KSliverGrid extends StatelessWidget {
  final Future<List<InfoModel>> Function() fetchData;
  final void Function(InfoModel cert, BuildContext context) onCardTap;
  final bool home;

  const KSliverGrid({
    super.key,
    required this.fetchData,
    required this.onCardTap,
    this.home = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<InfoModel>>(
      future: fetchData(),
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Error: Something went wrong.',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            final list = snapshot.data ?? [];
            if (list.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'No data found.',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
              );
            }
            return SliverMasonryGrid.count(
              crossAxisCount: getCrossAxisCount(context),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              itemBuilder: (context, index) {
                try {
                  final item = list[index];
                  return Container(
                    height: Get.height - 120,
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 32.0,
                    ),
                    child: KCard(
                      info: item,
                      onTap: () => onCardTap(item, context),
                    ),
                  );
                } catch (e) {
                  return const SizedBox.shrink();
                }
              },
              childCount: home
                  ? (list.length < 3 ? list.length : 3)
                  : list.length,
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'No data found.',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            );
          }
        } catch (e) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'An unexpected error occurred.',
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
            ),
          );
        }
      },
    );
  }
}
