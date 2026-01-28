import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';

class GlassRegistry {
  static final List<LiquidGlass> _glasses = [];

  /// Call once (safe to call multiple times)
  static void init() {
    if (_glasses.isNotEmpty) return;

    _glasses.add(
      LiquidGlass(
        position: const LiquidGlassAlignPosition(
          alignment: Alignment.center,
        ),

        width: ConfigCustom.fixWidth_HD_led_curved,
        height: ConfigCustom.odo_height_1920x1080_curved + 100,

        magnification: 1.05,
        distortion: 0.08,
        distortionWidth: 60,
        chromaticAberration: 0.004,

        blur: const LiquidGlassBlur(
          sigmaX: 1.2,
          sigmaY: 1.2,
        ),

        draggable: false,
        outOfBoundaries: true,

        shape: const RoundedRectangleShape(
          cornerRadius: 64,
          borderWidth: 1,
          borderSoftness: 8,
          lightIntensity: 1,
          lightDirection: 45,
        ),

        color: Colors.white.withAlpha(25),
      ),
    );
  }

  /// MUST return List<LiquidGlass>
  static List<LiquidGlass> consume() => _glasses;
}
