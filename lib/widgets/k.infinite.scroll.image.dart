import 'package:portfolio/configs/constant_strings.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class KInfiniteScrollImage extends StatefulWidget {
  final List<String> images;
  final double height;
  final double imageWidth;
  final Duration scrollDuration;
  final String direction; // 'horizontal' or 'vertical'

  const KInfiniteScrollImage({
    super.key,
    required this.images,
    this.height = 120,
    this.imageWidth = 180,
    this.scrollDuration = const Duration(seconds: 30),
    this.direction = 'horizontal',
  });

  @override
  State<KInfiniteScrollImage> createState() => _KInfiniteScrollImageState();
}

class _KInfiniteScrollImageState extends State<KInfiniteScrollImage>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;
  bool _isHovering = false;
  double _lastOffset = 0.0;

  Axis get _axis =>
      widget.direction == 'vertical' ? Axis.vertical : Axis.horizontal;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.scrollDuration,
    )..addListener(_onAnimate);
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _onAnimate() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final value = _animationController.value;
    // Reduce scroll speed by multiplying value by a factor less than 1
    final offset = value * maxScroll * 0.1; // 0.5 = 50% speed, adjust as needed
    _scrollController.jumpTo(offset);
    _lastOffset = offset;
    // Looping effect
    if (offset >= maxScroll - 1) {
      _animationController.value = 0;
    }
  }

  void _startScrolling() {
    if (!_isHovering && !_animationController.isAnimating) {
      _animationController.repeat();
    }
  }

  void _stopScrolling() {
    _animationController.stop();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images;
    if (images.isEmpty) return const SizedBox();
    const repeatCount = 10;
    final displayImages = List.generate(
      repeatCount,
      (_) => images,
    ).expand((e) => e).toList();

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovering = true);
        _stopScrolling();
      },
      onExit: (_) {
        setState(() => _isHovering = false);
        _startScrolling();
      },
      child: SizedBox(
        height: _axis == Axis.horizontal ? widget.height : double.infinity,
        width: _axis == Axis.horizontal ? double.infinity : widget.imageWidth,
        child: ListView(
          controller: _scrollController,
          scrollDirection: _axis,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _axis == Axis.horizontal
                ? Row(
                    children: displayImages
                        .map(
                          (img) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CachedNetworkImage(
                              imageUrl: assetGithubUrl + img,
                              // height: widget.height,
                              // width: widget.imageWidth,
                              fit: BoxFit.fitHeight,
                              memCacheHeight: (widget.height * 0.1).toInt(),
                              // Reduce quality to ~50%
                              // memCacheWidth: (widget.imageWidth * 0.5).toInt(), // Reduce quality to ~50%
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
                          ),
                        )
                        .toList(),
                  )
                : Column(
                    children: displayImages
                        .map(
                          (img) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: CachedNetworkImage(
                              imageUrl: assetGithubUrl + img,
                              height: widget.height,
                              width: widget.imageWidth,
                              fit: BoxFit.fitHeight,
                              memCacheHeight: (widget.height * 0.5).toInt(),
                              // Reduce quality to ~50%
                              memCacheWidth: (widget.imageWidth * 0.5).toInt(),
                              // Reduce quality to ~50%
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
