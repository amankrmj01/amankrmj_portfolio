import 'dart:ui';

import 'package:amankrmj_portfolio/configs/certificate_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:amankrmj_portfolio/widgets/k.card.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:animations/animations.dart';

import '../../../utils/axis.count.dart';
import 'certificate_view.dart';

class AllCertificatesView extends GetView {
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
                child: Text(
                  "ALL CERTIFICATES",
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "ShantellSans",
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 1.2,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            SliverMasonryGrid.count(
              crossAxisCount: getCrossAxisCount(context),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              itemBuilder: (context, index) {
                final cert = certificateList[index];
                return OpenContainer(
                  closedElevation: 0,
                  openElevation: 0,
                  closedColor: Colors.transparent,
                  openColor: Colors.transparent,
                  transitionType: ContainerTransitionType.fadeThrough,
                  transitionDuration: const Duration(milliseconds: 500),
                  closedBuilder: (context, openContainer) =>
                      KCard(info: cert, onTap: openContainer),
                  openBuilder: (context, _) =>
                      CertificateView(certificate: cert),
                );
              },
              childCount: certificateList.length,
            ),
          ],
        ),
      ),
    );
  }
}
