// ignore_for_file: unused_import

import 'dart:ui';

import 'package:amankrmj_portfolio/configs/certificate_list.dart';
import 'package:amankrmj_portfolio/presentation/certificate/views/all_certificates_view.dart';
import 'package:amankrmj_portfolio/presentation/certificate/views/certificate_view.dart';
import 'package:amankrmj_portfolio/widgets/animated.navigate.button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/axis.count.dart';
import '../../utils/k.showGeneralDialog.dart';
import '../../widgets/k.card.dart';
import 'controllers/certificate.controller.dart';
import 'package:amankrmj_portfolio/domain/models/certificate_info.dart';

class CertificateScreen extends GetView<CertificateController> {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      return FutureBuilder<List<CertificateInfo>>(
        future: controller.fetchCertificates(),
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
              final certificateList = snapshot.data ?? [];
              if (certificateList.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'No data found.',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                );
              }
              return KSliverGrid(
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
    } catch (e) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            'A fatal error occurred. $e',
            style: const TextStyle(color: Colors.red, fontSize: 24),
          ),
        ),
      );
    }
  }
}
