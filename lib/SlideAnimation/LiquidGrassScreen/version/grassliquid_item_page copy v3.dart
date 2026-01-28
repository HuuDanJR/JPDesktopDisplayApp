import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/image_view_page.dart';
import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_video_bg_page_no_delay.dart';
class LiquidGlassViewPage extends StatefulWidget {
  const LiquidGlassViewPage({super.key});

  @override
  State<LiquidGlassViewPage> createState() => _LiquidGlassViewPageState();
}
class _LiquidGlassViewPageState extends State<LiquidGlassViewPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const double screenWidth = 1920;
  static const double itemWidth = 240;
  static const double itemHeight = 50;
  static const double gap = 20;
  static const double itemStep = itemWidth + gap;
  static const int itemCount = 3;
  static const double stripWidth = itemStep * itemCount; // 2340
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  double mathCalculation(double baseX) {
    final double travel = _controller.value * stripWidth;
    final double x = (baseX - travel + stripWidth) % stripWidth;
    return x;
  }
   
   List<double> items = [1,2,3,4,5,6];

  LiquidGlass buildGlassItem({
    required int index,
    required double y,
  }) {
    final double baseX = index * itemStep;
    final double x = mathCalculation(baseX);
    final bool isVisible =  x > 0 && x < screenWidth;
    return LiquidGlass(
      width: itemWidth,
      height: itemHeight,
      distortion: 0.1,
      magnification: 1,
      distortionWidth: 30,
      chromaticAberration: 0.0015,
      saturation: 1,
      draggable: false,
      visibility: isVisible,
      outOfBoundaries: !isVisible,
      position: LiquidGlassOffsetPosition(
        left: x,
        top: y,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return LiquidGlassView(
            realTimeCapture: true,
            backgroundWidget: const ImageViewPage(),
            children: List.generate(
              items.length,
              (i) => buildGlassItem(
                index: i,
                y: 45,
              ),
            ),
          );
        },
      ),
    );
  }
}


