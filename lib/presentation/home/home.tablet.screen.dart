import 'dart:io';

import 'package:amankrmj_portfolio/presentation/home/views/home_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';

import 'controllers/home.controller.dart';
import 'package:amankrmj_portfolio/utils/pdf.render.image.dart';
import 'package:amankrmj_portfolio/infrastructure/dal/services/certificate_service.dart';

class HomeTabletScreen extends GetView<HomeController> {
  const HomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: PdfImageTestWidget()));
  }
}

class PdfImageTestWidget extends StatefulWidget {
  const PdfImageTestWidget({super.key});

  @override
  State<PdfImageTestWidget> createState() => _PdfImageTestWidgetState();
}

class _PdfImageTestWidgetState extends State<PdfImageTestWidget> {
  String? pdfUrl;
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadCertificateUrl();
  }

  Future<void> _loadCertificateUrl() async {
    try {
      final service = Get.find<CertificateService>();
      final certificates = await service.fetchAll();
      debugPrint("Fetched certificates: \\n");
      for (var cert in certificates) {
        debugPrint(cert.toJson().toString());
      }
      if (certificates.isNotEmpty && certificates.first.images.isNotEmpty) {
          certificates.first.images != null &&
          certificates.first.images.isNotEmpty) {
        setState(() {
          pdfUrl = certificates.first.images.first;
          loading = false;
        });
      } else {
        setState(() {
          error = 'No certificate or screenshot found';
          loading = false;
        });
      }
    } catch (e) {
      debugPrint('Error fetching certificates: $e');
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return Center(child: CircularProgressIndicator());
    if (error != null) return Center(child: Text('Error: $error'));
    if (pdfUrl == null) return Center(child: Text('No PDF URL'));
    return PdfImageLoader(pdfUrl: pdfUrl!);
  }
}

class PdfImageLoader extends StatefulWidget {
  final String pdfUrl;

  const PdfImageLoader({required this.pdfUrl, super.key});

  @override
  State<PdfImageLoader> createState() => _PdfImageLoaderState();
}

class _PdfImageLoaderState extends State<PdfImageLoader> {
  final GlobalKey<PdfImageState> _pdfImageKey = GlobalKey<PdfImageState>();
  bool _called = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_called) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pdfImageKey.currentState?.renderPdfFromUrl(widget.pdfUrl);
      });
      _called = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PdfImage(key: _pdfImageKey);

  }
}
