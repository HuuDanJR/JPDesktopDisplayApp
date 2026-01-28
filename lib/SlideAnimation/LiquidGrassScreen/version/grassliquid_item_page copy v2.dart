// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:liquid_glass_easy/liquid_glass_easy.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/test/image_view_page.dart';

// class LiquidGlassViewPage extends StatefulWidget {
//   const LiquidGlassViewPage({super.key});

//   @override
//   State<LiquidGlassViewPage> createState() => _LiquidGlassViewPageState();
// }

// class _LiquidGlassViewPageState extends State<LiquidGlassViewPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   // =======================
//   // DEBUG FLAGS
//   // =======================
//   static const bool debugLogs = true;
//   static const bool debugOverlay = true;

//   // =======================
//   // LAYOUT CONFIG
//   // =======================
//   static const double screenWidth = 1920;

//   static const double itemWidth = 240;
//   static const double itemHeight = 50;
//   static const double gap = 20;

//   static const double itemStep = itemWidth + gap;
//   static const int itemCount = 9;

//   static const double stripWidth = itemStep * itemCount; // 2340

//   final List<String> labels = const [
//     "FREQUENT",
//     "DAILY",
//     "DAILYGOLDEN",
//     "DOZEN",
//     "TRIPLE",
//     "WEEKLY",
//     "HIGHLIMIT",
//     "MONTHLY",
//     "VEGAS",
//   ];

//   // =======================
//   // LIFECYCLE
//   // =======================
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 20),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   // =======================
//   // MARQUEE CORE MATH
//   // =======================
//   double marqueeX(double baseX) {
//     final double travel = _controller.value * stripWidth;
//     final double x = (baseX - travel + stripWidth) % stripWidth;
//     return x;
//   }

//   // =======================
//   // GLASS ITEM (DEBUG)
//   // =======================
//   LiquidGlass buildGlassItem({
//     required int index,
//     required double y,
//     required String text,
//   }) {
//     final double baseX = index * itemStep;
//     final double x = marqueeX(baseX);

//     final bool isVisible =
//         x > -itemWidth && x < screenWidth + itemWidth;

//     // =======================
//     // DEBUG LOGS
//     // =======================
//     if (debugLogs && index == 0) {
//       log(
//         "FRAME t=${_controller.value.toStringAsFixed(3)}",
//         name: "MARQUEE",
//       );
//     }

//     if (debugLogs) {
//       log(
//         "[#$index] baseX=${baseX.toStringAsFixed(1)} "
//         "x=${x.toStringAsFixed(1)} "
//         "visible=$isVisible",
//         name: "ITEM",
//       );
//     }

//     return LiquidGlass(
//       width: itemWidth,
//       height: itemHeight,
//       distortion: 0.4,
//       magnification: 1.2,
//       distortionWidth: 60,
//       chromaticAberration: 0.0085,
//       saturation: 1,
//       draggable: false,

//       visibility: isVisible,
//       outOfBoundaries: !isVisible,

//       position: LiquidGlassOffsetPosition(
//         left: x,
//         top: y,
//       ),

//       // =======================
//       // DEBUG OVERLAY INSIDE GLASS
//       // =======================
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),

//           if (debugOverlay)
//             Positioned(
//               bottom: 2,
//               child: Text(
//                 "#$index  x:${x.toStringAsFixed(0)}",
//                 style: const TextStyle(
//                   fontSize: 10,
//                   color: Colors.yellow,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

  
//   // =======================
//   // BUILD
//   // =======================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: _controller,
//         builder: (_, __) {
//           return LiquidGlassView(
//             realTimeCapture: true,
//             pixelRatio: 1,
//             useSync: false,
//             refreshRate: LiquidGlassRefreshRate.deviceRefreshRate,
//             backgroundWidget: const ImageViewPage(),
//             children: List.generate(
//               labels.length,
//               (i) => buildGlassItem(
//                 index: i,
//                 y: 45,
//                 text: labels[i],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }





// class ScrollItem {
//   final int index;
//   final double baseX;

//   double x = 0;
//   double left = 0;
//   double right = 0;
//   bool visible = false;

//   ScrollItem({
//     required this.index,
//     required this.baseX,
//   });
// }


// class InfiniteHorizontalScroller {
//   final List<ScrollItem> items;

//   final double itemWidth;
//   final double viewportWidth;
//   final double speed; // px per second

//   double travel = 0.0;

//   InfiniteHorizontalScroller({
//     required this.items,
//     required this.itemWidth,
//     required this.viewportWidth,
//     required this.speed,
//   });

//   double get totalWidth => items.length * itemWidth;

//   void update(double deltaTime) {
//     // 1?? accumulate travel (ONLY THIS ACCUMULATES)
//     travel += speed * deltaTime;

//     // keep travel bounded (prevents floating-point drift)
//     travel %= totalWidth;

//     // 2?? update each item
//     for (final item in items) {
//       double x = item.baseX - travel;

//       // wrap
//       if (x < -itemWidth) {
//         x += totalWidth;
//       } else if (x > totalWidth) {
//         x -= totalWidth;
//       }

//       item.x = x;
//       item.left = x;
//       item.right = x + itemWidth;

//       // visibility
//       item.visible =
//           item.right > 0 && item.left < viewportWidth;
//     }
//   }
// }




import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/image_view_page.dart';

class LiquidGlassViewPage extends StatefulWidget {
  const LiquidGlassViewPage({super.key});

  @override
  State<LiquidGlassViewPage> createState() => _LiquidGlassViewPageState();
}

class _LiquidGlassViewPageState extends State<LiquidGlassViewPage>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;

  // =======================
  // DEBUG FLAGS
  // =======================
  static const bool debugLogs = true;
  static const bool debugOverlay = true;

  // =======================
  // LAYOUT CONFIG
  // =======================
  static const double screenWidth = 1920;

  static const double itemWidth = 240;
  static const double itemHeight = 50;
  static const double gap = 20;

  static const double itemStep = itemWidth + gap;
  static const int itemCount = 9;

  static const double speed = 120; // px / second

  static const double stripWidth = itemStep * itemCount;

  final List<String> labels = const [
    "FREQUENT",
    "DAILY",
    "DAILYGOLDEN",
    "DOZEN",
    "TRIPLE",
    "WEEKLY",
    "HIGHLIMIT",
    "MONTHLY",
    "VEGAS",
  ];

  // =======================
  // STATE
  // =======================
  double _travel = 0.0;
  double _lastTime = 0.0;

  // =======================
  // LIFECYCLE
  // =======================
  @override
  void initState() {
    super.initState();

    _ticker = Ticker(_onTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  // =======================
  // TICK UPDATE
  // =======================
  void _onTick(Duration elapsed) {
    final double t = elapsed.inMicroseconds / 1e6;
    final double dt = (_lastTime == 0) ? 0 : t - _lastTime;
    _lastTime = t;

    _travel += speed * dt;
    _travel %= stripWidth;

    if (debugLogs) {
      log(
        'FRAME travel=${_travel.toStringAsFixed(2)}',
        name: 'MARQUEE',
      );
    }

    setState(() {});
  }

  // =======================
  // POSITION MATH (FIXED)
  // =======================
  double itemX(int index) {
    final double baseX = index * itemStep;
    double x = baseX - _travel;

    // PERFECT wrap (no drift, no jump)
    if (x < -itemStep) {
      x += stripWidth;
    } else if (x >= stripWidth) {
      x -= stripWidth;
    }

    return x;
  }

  bool isVisible(double x) {
    return x + itemWidth > 0 && x < screenWidth;
  }

  // =======================
  // GLASS ITEM
  // =======================
  LiquidGlass buildGlassItem({
    required int index,
    required double y,
    required String text,
  }) {
    final double x = itemX(index);
    final bool visible = isVisible(x);

    if (debugLogs) {
      log(
        '[#$index] x=${x.toStringAsFixed(1)} visible=$visible',
        name: 'ITEM',
      );
    }

    return LiquidGlass(
      width: itemWidth,
      height: itemHeight,
      distortion: 0.4,
      magnification: 1.2,
      distortionWidth: 60,
      chromaticAberration: 0.0085,
      saturation: 1,
      draggable: false,

      visibility: visible,
      outOfBoundaries: !visible,

      position: LiquidGlassOffsetPosition(
        left: x,
        top: y,
      ),

      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          if (debugOverlay)
            Positioned(
              bottom: 2,
              child: Text(
                '#$index  x:${x.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.yellow,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // =======================
  // BUILD
  // =======================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidGlassView(
        realTimeCapture: true,
        pixelRatio: 1,
        useSync: false,
        refreshRate: LiquidGlassRefreshRate.deviceRefreshRate,
        backgroundWidget: const ImageViewPage(),
        children: List.generate(
          labels.length,
          (i) => buildGlassItem(
            index: i,
            y: 45,
            text: labels[i],
          ),
        ),
      ),
    );
  }
}
