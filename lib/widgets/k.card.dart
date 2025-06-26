import 'package:flutter/material.dart';

import '../domain/models/info.model.dart';
import '../infrastructure/theme/colors.dart';
import 'k.image.dart';

class KCard extends StatefulWidget {
  final InfoModel info;
  final VoidCallback? onTap;

  final double? width;
  final double? height;

  const KCard({
    super.key,
    required this.info,
    this.onTap,
    this.width = 500,
    this.height,
  });

  @override
  State<KCard> createState() => _KCardState();
}

class _KCardState extends State<KCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: isHover ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          margin: const EdgeInsets.all(8),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: widget.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Color.lerp(Colors.orange, Colors.pinkAccent, 0.7)!,
                blurRadius: 0,
                offset: isHover ? Offset(0, 0) : Offset(-5, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: widget.height,
                child: KImage(info: widget.info),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.info.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.info.description,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.info.largeDescription,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        decoration: TextDecoration.none,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
