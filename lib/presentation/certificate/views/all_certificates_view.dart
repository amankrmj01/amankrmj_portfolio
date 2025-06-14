// ignore_for_file: unused_import

import 'dart:ui';

import 'package:amankrmj_portfolio/configs/certificate_list.dart';
import 'package:amankrmj_portfolio/domain/models/info.model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:amankrmj_portfolio/widgets/k.card.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:animations/animations.dart';

import '../../../domain/models/certificate_info.dart';
import '../../../infrastructure/dal/daos/certificate.infoo.dart';
import '../../../utils/axis.count.dart';
import '../../../utils/k.showGeneralDialog.dart';
import '../../../utils/k.transition.container.transform.dart';
import '../controllers/certificate.controller.dart';
import 'certificate_view.dart';

class AllCertificatesView extends GetView<CertificateController> {
  const AllCertificatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      tooltip: 'Back',
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "ALL Certificates",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "ShantellSans",
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        letterSpacing: 1.2,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            KSliverGrid(
              fetchData: controller.fetchCertificates,
              onCardTap: (cert, context) {
                showBlurredGeneralDialog(
                  context: context,
                  builder: (context) => CertificateView(
                    certificate: cert,
                    onClose: () => Navigator.of(context).maybePop(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class KSliverGrid extends StatelessWidget {
  final Future<List<InfoModel>> Function() fetchData;
  final void Function(InfoModel cert, BuildContext context) onCardTap;
  final bool _home;

  const KSliverGrid({
    super.key,
    required this.fetchData,
    required this.onCardTap,
    bool home = false,
  }) : _home = home;

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
                  return KCard(
                    info: item,
                    onTap: () => onCardTap(item, context),
                  );
                } catch (e) {
                  return const SizedBox.shrink();
                }
              },
              childCount: _home
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
