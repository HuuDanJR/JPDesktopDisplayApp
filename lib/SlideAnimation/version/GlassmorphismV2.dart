import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget? child;
  final double blurStrength;
  final double borderRadius;
  final double borderWidth;
  final bool animate;
  final Duration animationDuration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color glassColor;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;

  const GlassContainer({
    Key? key,
    this.child,
    this.blurStrength = 10,
    this.borderRadius = 20,
    this.borderWidth = 1.0,
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.padding,
    this.margin,
    this.glassColor = Colors.white,
    this.borderColor,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: margin ?? const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurStrength,
            sigmaY: blurStrength,
          ),
          child: AnimatedContainer(
            duration: animate ? animationDuration : Duration.zero,
            padding: padding ?? const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: glassColor.withOpacity(0.1),
              border: Border.all(
                color: borderColor ?? Colors.white.withOpacity(0.2),
                width: borderWidth,
              ),
              boxShadow: boxShadow ??
                  [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.08),
                      blurRadius: 12,
                      offset: Offset(-2, -2),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 14,
                      offset: Offset(2, 2),
                    ),
                  ],
            ),
            child: child ?? const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
