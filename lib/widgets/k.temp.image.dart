import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../configs/constant_strings.dart';

class KTempImage extends StatefulWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const KTempImage({
    required this.imageUrl,
    this.height,
    this.width,
    super.key,
  });

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
      height: widget.height ?? 700,
      width: widget.width ?? double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // Optional: rounded corners
        child: CachedNetworkImage(
          imageUrl: assetGithubUrl + widget.imageUrl,
          fit: BoxFit.fitHeight,
          height: widget.height,
          width: widget.width,
          memCacheHeight: ((widget.height ?? 700) * 0.5).toInt(),
          errorWidget: (c, e, s) => const SizedBox(),
          placeholder: (context, url) => SizedBox(
            height: 700,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
      ),
    );
  }
}
