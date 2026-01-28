
import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/grassliquid_odometer.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/image_view_page.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';
import 'package:playtech_transmitter_app/service/widget/text_custom.dart';

class LiquidGlassListViewPageFullPrizes extends StatefulWidget {
  final Map<String, double> hiveValues;
  const LiquidGlassListViewPageFullPrizes({
    super.key,
    required this.hiveValues,
  });
  @override
  State<LiquidGlassListViewPageFullPrizes> createState() =>
      _LiquidGlassListViewPageFullPrizesState();
}

class _LiquidGlassListViewPageFullPrizesState extends State<LiquidGlassListViewPageFullPrizes>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  // ================= Layout =================
  static const double screenWidth = 1920;
  static const double itemWidth = 240;
  static const double itemHeight = 53;
  static const double gap = 30;
  static const double itemStep = itemWidth + gap;
  static const double speed = 85.0; // px/sec
  late double stripWidth;
  late List<_JackpotItem> items;
  late final List<_JackpotItem> allItems;
  int startIndex = 0;
  double travelOffset = 0.0;
  late int prevStep;

  @override
  void initState() {
    super.initState();
    allItems = const [
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
      _JackpotItem(
        nameJP: ConfigCustom.tagWeekly,
        valueKey: ConfigCustom.tagWeekly,
      ),
      _JackpotItem(
        nameJP: ConfigCustom.tagMonthly,
        valueKey: ConfigCustom.tagMonthly,
      ),
      _JackpotItem(
        nameJP: ConfigCustom.tagVegas,
        valueKey: ConfigCustom.tagVegas,
      ),
    ];
    items = List.generate(6, (i) => allItems[i]);
    stripWidth = itemStep * 6; // Always 6 visible
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: ((stripWidth / speed) * 1000).round(),
      ),
    )..repeat();
    prevStep = 0;
    _controller.addListener(() {
      final double effectiveTravel =
          _controller.value * stripWidth + travelOffset;
      final int currentStep = (effectiveTravel / itemStep).floor();
      if (currentStep > prevStep) {
        setState(() {
          startIndex = (startIndex + 1) % allItems.length;
          items = List.generate(
              6, (i) => allItems[(startIndex + i) % allItems.length]);
          travelOffset -= itemStep;
        });
        prevStep = currentStep;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ================= Marquee math =================
  double _calculateX(double baseX) {
    final double travel = _controller.value * stripWidth + travelOffset;
    double x = (baseX - travel) % stripWidth;
    if (x < 0) x += stripWidth;
    return x;
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
      distortion: 0.155,
      distortionWidth: 42.5,
      magnification: 1.125,
      chromaticAberration: 0.00225,
      saturation: 1,
      draggable: false,
      visibility: true,
      outOfBoundaries: false,
      blur: const LiquidGlassBlur(
        sigmaX: 2.5,
        sigmaY: 2.5,
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
      left: x, // ? SAME X AS GLASS
      top: y,
      width: itemWidth, // ? SAME WIDTH AS GLASS
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
              realTimeCapture: true,
              backgroundWidget: const RepaintBoundary(
                // child: JackpotBackgroundShowNoDelayNoFrame(),
                child: ImageViewPage(),
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
  final String nameJP; // Display text
  final String valueKey; // Hive / Bloc key
  const _JackpotItem({
    required this.nameJP,
    required this.valueKey,
  });
}