import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../domain/models/info.model.dart';

class KInfiniteScrollImage extends StatefulWidget {
  final List<InfoModel> items;
  final double height;
  final double imageWidth;
  final Duration scrollDuration;

  const KInfiniteScrollImage({
    super.key,
    required this.items,
    this.height = 120,
    this.imageWidth = 180,
    this.scrollDuration = const Duration(seconds: 30),
  });

  @override
  State<KInfiniteScrollImage> createState() => _KInfiniteScrollImageState();
}

class _KInfiniteScrollImageState extends State<KInfiniteScrollImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool _isHovering = false;

  List<String> get _allImages => widget.items.expand((e) => e.images).toList();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.scrollDuration,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEnterEvent event) {
    setState(() => _isHovering = true);
    _controller.stop();
  }

  void _onExit(PointerExitEvent event) {
    setState(() => _isHovering = false);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final images = _allImages;
    if (images.isEmpty) return const SizedBox();
    // Duplicate images for seamless infinite scroll
    final displayImages = [...images, ...images];
    final totalWidth = displayImages.length * widget.imageWidth;

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: SizedBox(
        height: widget.height,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final offset = _animation.value * images.length * widget.imageWidth;
            return Stack(
              children: [
                Transform.translate(
                  offset: Offset(-offset, 0),
                  child: Row(
                    children: displayImages
                        .map(
                          (img) => CachedNetworkImage(
                            imageUrl: img,
                            height: widget.height,
                            fit: BoxFit.fitHeight,
                            errorWidget: (c, e, s) => const SizedBox(),
                            placeholder: (context, url) => SizedBox(
                              width: widget.imageWidth,
                              height: widget.height,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
