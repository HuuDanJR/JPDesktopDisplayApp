import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

class GlassContainer {
  static LiquidGlass build({
    required double width,
    required double height,
    required Alignment alignment,
    required Widget child,
  }) {
    return LiquidGlass(
      position: LiquidGlassAlignPosition(alignment: alignment),
      width: width,
      height: height,
      magnification: 1,
      distortion: 0.001,
      distortionWidth: 30,
      chromaticAberration: 0.001,
      blur: const LiquidGlassBlur(sigmaX: 0.1, sigmaY: 0.3),
      outOfBoundaries: true,
      color: Colors.white.withAlpha(30),
      shape: RoundedRectangleShape(
        cornerRadius: 48,
        borderWidth: 1,
        borderSoftness: 5,
        lightIntensity: 1,
        lightDirection: 45,
      ),
      child: Center(child: child),
    );
  }
}


