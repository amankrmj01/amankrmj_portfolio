import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class KTempImage extends StatefulWidget {
  final String imageUrl;

  const KTempImage({required this.imageUrl, super.key});

  @override
  State<KTempImage> createState() => _KTempImageState();
}

class _KTempImageState extends State<KTempImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl.isEmpty) {
      return const Center(child: Text('No image URL.'));
    }
    return SizedBox(
      height: 700, // You can adjust the height as needed
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // Optional: rounded corners
        child: CachedNetworkImage(
          imageUrl: widget.imageUrl,
          fit: BoxFit.fitHeight,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Center(child: Text('Error loading image')),
        ),
      ),
    );
  }
}
