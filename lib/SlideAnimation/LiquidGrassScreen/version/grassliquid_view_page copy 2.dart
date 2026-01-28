import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/image_view_page.dart';

class LiquidGlassViewPage extends StatefulWidget {
  const LiquidGlassViewPage({super.key});

  @override
  State<LiquidGlassViewPage> createState() => _LiquidGlassViewPageState();
}

class _LiquidGlassViewPageState extends State<LiquidGlassViewPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  /// One full logical strip (must cover ALL items)
  static const double stripWidth = 2340;

  /// Screen width
  static const double screenWidth = 1920;

  /// Item size
  static const double itemWidth = 240;
  static const double itemHeight = 50;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Core marquee math (stable & continuous)
  double marqueeX(double baseX) {
    final double travel = _controller.value * stripWidth;
    double x = baseX - travel;

    /// wrap seamlessly
    if (x < -stripWidth) {
      x += stripWidth;
    }
    return x;
  }

  LiquidGlass buildGlassChild({
  required double baseX,
  required double baseY,
  required String text,
}) {
  final double x = marqueeX(baseX);

  return LiquidGlass(
    width: itemWidth,
    height: itemHeight,
    distortion: 0.4,
    magnification: 1.2,
    distortionWidth: 60,
    chromaticAberration: 0.0085,
    saturation: 1,
    enableInnerRadiusTransparent: true,
    draggable: false,

    visibility: true,
    outOfBoundaries: false,

    position: LiquidGlassOffsetPosition(
      left: x,
      top: baseY,
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}


  List<LiquidGlass> buildStrip(double offsetX) {
  return [
    buildGlassChild(baseX: 20 + offsetX,   baseY: 45, text: "FREQUENT"),
    buildGlassChild(baseX: 228 + offsetX,  baseY: 45, text: "DAILY"),
    buildGlassChild(baseX: 540 + offsetX,  baseY: 45, text: "DAILYGOLDEN"),
    buildGlassChild(baseX: 800 + offsetX,  baseY: 45, text: "DOZEN"),
    buildGlassChild(baseX: 1060 + offsetX, baseY: 45, text: "TRIPLE"),
    buildGlassChild(baseX: 1320 + offsetX, baseY: 45, text: "WEEKLY"),
    buildGlassChild(baseX: 1580 + offsetX, baseY: 45, text: "HIGHLIMIT"),
    buildGlassChild(baseX: 1840 + offsetX, baseY: 45, text: "MONTHLY"),
    buildGlassChild(baseX: 2100 + offsetX, baseY: 45, text: "VEGAS"),
  ];
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return LiquidGlassView(
            realTimeCapture: true,
            pixelRatio: 1,
            backgroundWidget: const ImageViewPage(),

            /// ? DOUBLE STRIP = ZERO STICKING
            children: [
              ...buildStrip(0),
              // ...buildStrip(stripWidth),
            ],
          );
        },
      ),
    );
  }
}
