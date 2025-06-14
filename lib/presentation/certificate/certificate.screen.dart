import 'package:amankrmj_portfolio/configs/certificate_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/axis.count.dart';
import '../../widgets/k.card.dart';
import 'controllers/certificate.controller.dart';

class CertificateScreen extends GetView<CertificateController> {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              child: Text(
                "RECENT CERTIFICATES",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "ShantellSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
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
              return KCard(info: cert);
            },
            childCount: certificateList.length,
          ),
        ],
      ),
    );
  }
}
