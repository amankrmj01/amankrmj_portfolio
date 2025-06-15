import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';
import 'package:amankrmj_portfolio/infrastructure/dal/services/certificate_service.dart';
import 'package:amankrmj_portfolio/domain/models/certificate.model.dart';
import 'package:amankrmj_portfolio/widgets/k.temp.image.dart';

class HomeTabletScreen extends GetView<HomeController> {
  const HomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<CertificateModel>>(
          future: controller.fetchCertificates(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                ),
              );
            } else if (snapshot.hasData) {
              final certs = snapshot.data!;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: certs.map((e) {
                    if (e.type == 'jpg' && e.images.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: KTempImage(imageUrl: e.images.first),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }).toList(),
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
        ),
      ),
    );
  }
}

extension on HomeController {
  Future<List<CertificateModel>> fetchCertificates() async {
    final service = Get.find<CertificateService>();
    return await service.fetchAll();
  }
}

// class PdfImageTestWidget extends StatefulWidget {
//   const PdfImageTestWidget({super.key});
//
//   @override
//   State<PdfImageTestWidget> createState() => _PdfImageTestWidgetState();
// }
//
// class _PdfImageTestWidgetState extends State<PdfImageTestWidget> {
//   String? pdfUrl;
//   bool loading = true;
//   String? error;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadCertificateUrl();
//   }
//
//   Future<void> _loadCertificateUrl() async {
//     try {
//       final service = Get.find<CertificateService>();
//       final certificates = await service.fetchAll();
//       debugPrint("Fetched certificates: \\n");
//       for (var cert in certificates) {
//         debugPrint(cert.toJson().toString());
//       }
//       if (certificates.isNotEmpty && certificates.first.images.isNotEmpty) {
//           certificates.first.images != null &&
//           certificates.first.images.isNotEmpty) {
//         setState(() {
//           pdfUrl = certificates.first.images.first;
//           loading = false;
//         });
//       } else {
//         setState(() {
//           error = 'No certificate or screenshot found';
//           loading = false;
//         });
//       }
//     } catch (e) {
//       debugPrint('Error fetching certificates: $e');
//       setState(() {
//         error = e.toString();
//         loading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (loading) return Center(child: CircularProgressIndicator());
//     if (error != null) return Center(child: Text('Error: $error'));
//     if (pdfUrl == null) return Center(child: Text('No PDF URL'));
//     // return PdfImageLoader(pdfUrl: pdfUrl!);
//     return SizedBox(); // Placeholder for now
//   }
// }

// class PdfImageLoader extends StatelessWidget {
//   final String pdfUrl;
//
//   const PdfImageLoader({required this.pdfUrl, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String>(
//       future: DefaultAssetBundle.of(context).loadString('assets/certificates/certificates.json'),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: \\${snapshot.error}'));
//         } else if (snapshot.hasData) {
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Text(snapshot.data ?? '', style: const TextStyle(fontFamily: 'monospace')),
//           );
//         } else {
//           return const Center(child: Text('No data found.'));
//         }
//       },
//     );
//   }
// }
