import 'package:flutter/material.dart';
import 'package:portfolio/infrastructure/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/widgets/k.image.dart';
import '../../../domain/models/certificate.model.dart';

class CertificateMobileView extends StatelessWidget {
  final CertificateModel certificate;
  final VoidCallback? onClose;

  const CertificateMobileView({
    super.key,
    required this.certificate,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: onClose ?? () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          certificate.name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "ShantellSans",
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.2,
            decoration: TextDecoration.none,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: KImage(url: certificate.images[0]),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              certificate.name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: KColor.primaryColor,
                fontFamily: 'ShantellSans',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              certificate.description,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 14),
            Text(
              certificate.largeDescription,
              style: TextStyle(fontSize: 15, color: Colors.white60),
            ),
            const SizedBox(height: 20),
            if (certificate.url.isNotEmpty)
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrl(Uri.parse(certificate.url))) {
                    await launchUrl(
                      Uri.parse(certificate.url),
                      mode: LaunchMode.externalApplication,
                      webOnlyWindowName: '_blank',
                    );
                  }
                },
                child: Row(
                  children: [
                    const Icon(Icons.link, size: 18, color: Colors.blue),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        certificate.url,
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
