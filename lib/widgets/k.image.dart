import 'package:amankrmj_portfolio/configs/constant_strings.dart';
import 'package:flutter/material.dart';

import '../domain/models/info.model.dart';

// Helper widget for displaying an image from any InfoModel
class KImage extends StatelessWidget {
  final InfoModel info;

  const KImage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final imageUrl = (info.images.isNotEmpty)
        ? info.images[0]
        : 'https://placehold.co/600x400/000000/FFFFFF/png';
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          assetGithubUrl + imageUrl,
          // height: 700,
          fit: BoxFit.fitHeight,
          errorBuilder: (context, error, stackTrace) {
            debugPrint(assetGithubUrl + imageUrl);
            return Container(
              color: Colors.grey[300],
              child: Icon(
                Icons.broken_image,
                size: 40,
                color: Colors.grey[700],
              ),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: Colors.grey[200],
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
