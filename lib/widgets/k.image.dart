import 'package:portfolio/configs/constant_strings.dart';
import 'package:flutter/material.dart';

// Helper widget for displaying an image from any InfoModel
class KImage extends StatelessWidget {
  final String url;

  const KImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final imageUrl = url.isNotEmpty ? url : '';
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          assetGithubUrl + imageUrl,
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
