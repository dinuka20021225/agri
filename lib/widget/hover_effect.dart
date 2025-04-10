import 'package:flutter/material.dart';

class HoverZoomImage extends StatefulWidget {
  final String imagePath;
  final double width;
  final String? fit;

  const HoverZoomImage({
    super.key,
    required this.imagePath,
    required this.width,
    this.fit,
  });

  @override
  State<HoverZoomImage> createState() => _HoverZoomImageState();
}

class _HoverZoomImageState extends State<HoverZoomImage> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Image.asset(
          widget.imagePath,
          width: widget.width,
        ),
      ),
    );
  }
}
