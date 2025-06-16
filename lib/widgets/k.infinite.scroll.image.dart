import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../domain/models/info.model.dart';

class KInfiniteScrollImage extends StatefulWidget {
  final List<InfoModel> items;
  final double height;
  final double imageWidth;
  final Duration scrollDuration;
  final Axis direction;

  const KInfiniteScrollImage({
    super.key,
    required this.items,
    this.height = 120,
    this.imageWidth = 180,
    this.scrollDuration = const Duration(seconds: 30),
    this.direction = Axis.horizontal,
  });

  @override
  State<KInfiniteScrollImage> createState() => _KInfiniteScrollImageState();
}

class _KInfiniteScrollImageState extends State<KInfiniteScrollImage>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  Timer? _timer;
  bool _isHovering = false;

  List<String> get _allImages => widget.items.expand((e) => e.images).toList();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startScrolling();
  }

  void _startScrolling() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (!_isHovering && _scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final current = _scrollController.offset;
        double next = current + 1;
        if (next >= maxScroll) {
          next = 0;
        }
        _scrollController.jumpTo(next);
      }
    });
  }

  void _stopScrolling() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = _allImages;
    if (images.isEmpty) return const SizedBox();
    // Repeat images many times for infinite effect
    const repeatCount = 10;
    final displayImages = List.generate(
      repeatCount,
      (_) => images,
    ).expand((e) => e).toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final minScroll = _scrollController.position.minScrollExtent;
      final current = _scrollController.offset;
      // If near the end, jump to the middle
      if (current >
          maxScroll -
              2 *
                  (widget.direction == Axis.horizontal
                      ? widget.imageWidth
                      : widget.height) *
                  images.length) {
        final middle = maxScroll / 2;
        _scrollController.jumpTo(middle);
      }
      // If near the start, jump to the middle
      if (current <
          minScroll +
              2 *
                  (widget.direction == Axis.horizontal
                      ? widget.imageWidth
                      : widget.height) *
                  images.length) {
        final middle = maxScroll / 2;
        _scrollController.jumpTo(middle);
      }
    });
    return MouseRegion(
      onEnter: (event) {
        setState(() => _isHovering = true);
        _stopScrolling();
      },
      onExit: (event) {
        setState(() => _isHovering = false);
        _startScrolling();
      },
      child: SizedBox(
        height: widget.direction == Axis.horizontal
            ? widget.height
            : double.infinity,
        width: widget.direction == Axis.horizontal
            ? double.infinity
            : widget.imageWidth,
        child: ListView(
          controller: _scrollController,
          scrollDirection: widget.direction,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            widget.direction == Axis.horizontal
                ? Row(
                    children: displayImages
                        .map(
                          (img) => CachedNetworkImage(
                            imageUrl: img,
                            height: widget.height,
                            width: widget.imageWidth,
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
                  )
                : Column(
                    children: displayImages
                        .map(
                          (img) => CachedNetworkImage(
                            imageUrl: img,
                            height: widget.height,
                            width: widget.imageWidth,
                            fit: BoxFit.fitWidth,
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
          ],
        ),
      ),
    );
  }
}
