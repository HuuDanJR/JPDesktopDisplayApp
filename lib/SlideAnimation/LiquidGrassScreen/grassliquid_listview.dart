import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/jackpot_video_BGPage_NoDelayNoFrame.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/grassliquid_odometer.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/image_view_page.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_page.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';
import 'package:playtech_transmitter_app/service/widget/text_custom.dart';

class LiquidGlassListViewPage extends StatefulWidget {
  final Map<String, double> hiveValues;

  const LiquidGlassListViewPage({
    super.key,
    required this.hiveValues,
  });

  @override
  State<LiquidGlassListViewPage> createState() =>
      _LiquidGlassListViewPageState();
}

class _LiquidGlassListViewPageState extends State<LiquidGlassListViewPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // ================= Layout =================
  static const double screenWidth = 1920;
  static const double itemWidth = 240;
  static const double itemHeight = 53;
  static const double gap = 30;
  static const double itemStep = itemWidth + gap;
  static const double speed = 80.0; // px/sec

  late final double stripWidth;

  final List<_JackpotItem> items = const [
    _JackpotItem(
      nameJP: ConfigCustom.tagWeekly,
      valueKey: ConfigCustom.tagWeekly,
    ),
    _JackpotItem(
      nameJP: ConfigCustom.tagFrequent,
      valueKey: ConfigCustom.tagFrequent,
    ),
    _JackpotItem(
      nameJP: ConfigCustom.tagDaily,
      valueKey: ConfigCustom.tagDaily,
    ),
    _JackpotItem(
      nameJP: ConfigCustom.tagDailyGolden2, // display name
      valueKey: ConfigCustom.tagDailyGolden, // value source
    ),
    _JackpotItem(
      nameJP: ConfigCustom.tagDozen,
      valueKey: ConfigCustom.tagDozen,
    ),
    _JackpotItem(
      nameJP: ConfigCustom.tagTriple,
      valueKey: ConfigCustom.tagTriple,
    ),
    
  ];

  @override
  void initState() {
    super.initState();

    stripWidth = itemStep * items.length;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: ((stripWidth / speed) * 1000).round(),
      ),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ================= Marquee math =================
  double _calculateX(double baseX) {
    final travel = _controller.value * stripWidth;
    return (baseX - travel) % stripWidth;
  }

  // ================= GLASS =================
  LiquidGlass? _buildGlassItem({
    required int index,
    required double y,
  }) {
    final baseX = index * itemStep;
    final x = _calculateX(baseX);

    if (x < -itemWidth || x > screenWidth) return null;

    final item = items[index];

    return LiquidGlass(
      width: itemWidth,
      height: itemHeight,
      distortion: 0.175,
      distortionWidth: 45,
      magnification: 1.125,
      chromaticAberration: 0.0025,
      saturation: 1,
      draggable: false,
      visibility: true,
      outOfBoundaries: false,
      blur: const LiquidGlassBlur(
        sigmaX: 2.5,
        sigmaY: 1.5,
      ),
      position: LiquidGlassOffsetPosition(
        left: x,
        top: y,
      ),
      child: RepaintBoundary(
        child: JackpotOdometerGrasslLiquid(
          nameJP: item.nameJP,
          valueKey: item.valueKey,
          hiveValue: widget.hiveValues[item.valueKey] ?? 0.0,
          isSmall: false,
        ),
      ),
    );
  }

  // ================= TITLE (OUTSIDE GLASS) =================
  Widget? _buildTitle({
  required int index,
  required double y,
}) {
  final baseX = index * itemStep;
  final x = _calculateX(baseX);

  if (x < -itemWidth || x > screenWidth) return null;

  final item = items[index];

  return Positioned(
    left: x,               // ? SAME X AS GLASS
    top: y,
    width: itemWidth,      // ? SAME WIDTH AS GLASS
    child: Center(
      child: textCustom(
        size: 20,
        value: item.nameJP.toUpperCase(),
      ),
    ),
  );
}

  // ================= BUILD =================
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Stack(
          children: [
            // ===== LIQUID GLASS LAYER =====
            LiquidGlassView(
              realTimeCapture: false,
              backgroundWidget: const RepaintBoundary(
                // child: JackpotBackgroundShowNoDelayNoFrame(),
                child:ImageViewPage()
              ),
              children: List.generate(
                items.length,
                (i) => _buildGlassItem(index: i, y: 60),
              ).whereType<LiquidGlass>().toList(),
            ),

            // ===== TITLE OVERLAY =====
            IgnorePointer(
              child: Stack(
                children: List.generate(
                  items.length,
                  (i) => _buildTitle(index: i, y: 35),
                ).whereType<Widget>().toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ================= MODEL =================
class _JackpotItem {
  final String nameJP;   // Display text
  final String valueKey; // Hive / Bloc key

  const _JackpotItem({
    required this.nameJP,
    required this.valueKey,
  });
}