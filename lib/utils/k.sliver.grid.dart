import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../domain/models/info.model.dart';
import '../widgets/k.card.dart';
import 'axis.count.dart';

class KSliverGrid extends StatelessWidget {
  final List<InfoModel> items;
  final bool home;
  final void Function(InfoModel cert, BuildContext context) onCardTap;

  const KSliverGrid({
    super.key,
    required this.items,
    this.home = false,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text(
            'No data found.',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
      );
    }
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      sliver: SliverMasonryGrid.count(
        crossAxisCount: getCrossAxisCount(context),
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return KCard(info: item, onTap: () => onCardTap(item, context));
        },
      ),
    );
  }
}
