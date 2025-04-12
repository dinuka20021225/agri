import 'package:flutter/material.dart';

class HoverZoomEffect extends StatefulWidget {
  final Widget child;
  final double zoomScale;
  final Duration duration;
  final Curve curve;

  const HoverZoomEffect({
    super.key,
    required this.child,
    this.zoomScale = 1.05,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
  });

  @override
  State<HoverZoomEffect> createState() => _HoverZoomEffectState();
}

class _HoverZoomEffectState extends State<HoverZoomEffect> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedScale(
        scale: _isHovering ? widget.zoomScale : 1.0,
        duration: widget.duration,
        curve: widget.curve,
        child: widget.child,
      ),
    );
  }
}