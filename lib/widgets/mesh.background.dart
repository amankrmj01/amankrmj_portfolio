import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class SharedMeshBackground extends StatefulWidget {
  const SharedMeshBackground({super.key});

  @override
  State<SharedMeshBackground> createState() => _SharedMeshBackgroundState();
}

class _SharedMeshBackgroundState extends State<SharedMeshBackground> {
  late final AnimatedMeshGradientController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimatedMeshGradientController()..start();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedMeshGradient(
        colors: const [
          Color(0xFF1A1A2E),
          Color(0xFF1A1A2E),
          Color(0xFF16213E),
          Color(0xFF16213E),
        ],
        controller: _controller,
        options: AnimatedMeshGradientOptions(
          speed: 0.4,
          frequency: 1.0,
          amplitude: 1.0,
          grain: 0.0,
        ),
      ),
    );
  }
}
