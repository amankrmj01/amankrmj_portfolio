import 'dart:ui';

import 'package:amankrmj_portfolio/configs/certificate_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:amankrmj_portfolio/widgets/k.card.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:animations/animations.dart';

import '../../../infrastructure/dal/daos/certificate.info.dart';
import '../../../utils/axis.count.dart';
import '../../../utils/k.transition.container.transform.dart';
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
                return Builder(
                  builder: (context) => KCard(
                    info: cert,
                    onTap: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: 'Certificate',
                        barrierColor: Colors.black.withOpacity(0.4),
                        pageBuilder: (context, anim1, anim2) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                            child: CertificateView(
                              certificate: cert,
                              onClose: () => Navigator.of(context).maybePop(),
                            ),
                          );
                        },
                        transitionBuilder: (context, anim1, anim2, child) {
                          return FadeTransition(
                            opacity: CurvedAnimation(
                              parent: anim1,
                              curve: Curves.easeInOut,
                            ),
                            child: child,
                          );
                        },
                      );
                    },
                  ),
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
