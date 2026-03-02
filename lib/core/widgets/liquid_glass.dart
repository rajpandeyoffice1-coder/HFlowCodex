import 'dart:ui';

import 'package:flutter/material.dart';

class LiquidGlassCard extends StatelessWidget {
  const LiquidGlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.16)),
            gradient: LinearGradient(
              colors: [Colors.white.withOpacity(0.14), Colors.white.withOpacity(0.03)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
