// // import 'package:flutter/material.dart';
// // import 'package:liquid_glass_easy/liquid_glass_easy.dart';
// // import 'package:playtech_transmitter_app/SlideAnimation/test/image_view_page.dart';
// // import 'package:playtech_transmitter_app/service/config_custom.dart';

// // class LiquidGlassListViewPage extends StatefulWidget {
// //   final Map<String, double> hiveValues;
// //   final Map<String, double> previousJackpotValues;
// //   final Map<String, double> jackpotValues;

// //   const LiquidGlassListViewPage(
// //     this.hiveValues,
// //     this.previousJackpotValues,
// //     this.jackpotValues, {
// //     super.key,
// //   });

// //   @override
// //   State<LiquidGlassListViewPage> createState() =>
// //       _LiquidGlassListViewPageState();
// // }

// // class _LiquidGlassListViewPageState extends State<LiquidGlassListViewPage>
// //     with SingleTickerProviderStateMixin {
// //   late final AnimationController _controller;

// //   // ================= Layout =================
// //   static const double screenWidth = 1920;
// //   static const double itemWidth = 240;
// //   static const double itemHeight = 120;
// //   static const double gap = 30;
// //   static const double itemStep = itemWidth + gap;

// //   final List<String> keys = const [
// //     ConfigCustom.tagFrequent,
// //     ConfigCustom.tagDaily,
// //     ConfigCustom.tagDailyGolden,
// //     ConfigCustom.tagDozen,
// //     ConfigCustom.tagTriple,
// //     ConfigCustom.tagWeekly,
// //   ];

// //   late final double stripWidth;
// //   late final double stripDurationSeconds;

// //   // ================= Motion =================
// //   static const double speed = 20.0; // px/sec

// //   @override
// //   void initState() {
// //     super.initState();

// //     stripWidth = itemStep * keys.length;
// //     stripDurationSeconds = stripWidth / speed;

// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(
// //         milliseconds: (stripDurationSeconds * 1000).round(),
// //       ),
// //     )..repeat();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   // ================= Marquee math =================
// //   double _calculateX(double baseX) {
// //     final travel = _controller.value * stripWidth;
// //     return (baseX - travel) % stripWidth;
// //   }

// //   // ================= Glass builder =================
// //   LiquidGlass? _buildGlassItem({
// //     required int index,
// //     required double y,
// //   }) {
// //     final baseX = index * itemStep;
// //     final x = _calculateX(baseX);

// //     if (x < -itemWidth || x > screenWidth) return null;

// //     final key = keys[index];
// //     final hive = widget.hiveValues[key] ?? 0.0;
// //     final prev = widget.previousJackpotValues[key] ?? 0.0;
// //     final live = widget.jackpotValues[key] ?? 0.0;

// //     return LiquidGlass(
// //       diagonalFlip: 0.1,
// //       blur: const LiquidGlassBlur(sigmaX: 2, sigmaY: 5),
// //       width: itemWidth,
// //       height: itemHeight,
// //       distortion: 0.25,
// //       distortionWidth: 45,
// //       magnification: 1.15,
// //       chromaticAberration: 0.003,
// //       saturation: 1,
// //       draggable: false,
// //       visibility: true,
// //       outOfBoundaries: false,
// //       position: LiquidGlassOffsetPosition(
// //         left: x,
// //         top: y,
// //       ),
// //       child: _GlassContent(
// //         title: key,
// //         hive: hive,
// //         previous: prev,
// //         current: live,
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedBuilder(
// //       animation: _controller,
// //       builder: (_, __) {
// //         return LiquidGlassView(
// //           realTimeCapture: true,
// //           backgroundWidget: const RepaintBoundary(
// //             child: ImageViewPage(),
// //           ),
// //           children: List.generate(
// //             keys.length,
// //             (i) => _buildGlassItem(index: i, y: 40),
// //           ).whereType<LiquidGlass>().toList(),
// //         );
// //       },
// //     );
// //   }
// // }

// // // ================= CONTENT INSIDE GLASS =================

// // class _GlassContent extends StatelessWidget {
// //   final String title;
// //   final double hive;
// //   final double previous;
// //   final double current;

// //   const _GlassContent({
// //     required this.title,
// //     required this.hive,
// //     required this.previous,
// //     required this.current,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(6),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Text(
// //             title,
// //             style: const TextStyle(
// //               color: Colors.white70,
// //               fontSize: 12,
// //             ),
// //           ),
// //           const SizedBox(height: 4),
// //           // Text(
// //           //   current.toStringAsFixed(0),
// //           //   style: const TextStyle(
// //           //     color: Colors.white,
// //           //     fontSize: 22,
// //           //     fontWeight: FontWeight.bold,
// //           //   ),
// //           // ),
// //           // const SizedBox(height: 2),
// //           // Text(
// //           //   'Prev: ${previous.toStringAsFixed(0)}',
// //           //   style: const TextStyle(
// //           //     color: Colors.white60,
// //           //     fontSize: 11,
// //           //   ),
// //           // ),
// //           // Text(
// //           //   'Hive: ${hive.toStringAsFixed(0)}',
// //           //   style: const TextStyle(
// //           //     color: Colors.white38,
// //           //     fontSize: 10,
// //           //   ),
// //           // ),

// //           JackpotOdometer(
// //           nameJP: ConfigCustom.tagFrequent,
// //           valueKey: ConfigCustom.tagFrequent,
// //           hiveValue: hiveValues[ConfigCustom.tagFrequent] ?? 0.0,
// //           isSmall: false,
// //         ),

// //         ],
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:liquid_glass_easy/liquid_glass_easy.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/jackpot_video_BGPage_NoDelayNoFrame.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/test/image_view_page.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_page.dart';
// import 'package:playtech_transmitter_app/service/config_custom.dart';

// class LiquidGlassListViewPage extends StatefulWidget {
//   final Map<String, double> hiveValues;

//   const LiquidGlassListViewPage({
//     super.key,
//     required this.hiveValues,
//   });

//   @override
//   State<LiquidGlassListViewPage> createState() =>
//       _LiquidGlassListViewPageState();
// }

// class _LiquidGlassListViewPageState extends State<LiquidGlassListViewPage>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;

//   // ================= Layout =================
//   static const double screenWidth = 1920;
//   static const double itemWidth = 240;
//   static const double itemHeight = 90;
//   static const double gap = 30;
//   static const double itemStep = itemWidth + gap;
//   static const double speed = 20.0; // px/sec

//   late final double stripWidth;

// final List<_JackpotItem> items = const [
//   _JackpotItem(
//     nameJP: ConfigCustom.tagFrequent,
//     valueKey: ConfigCustom.tagFrequent,
//   ),
//   _JackpotItem(
//     nameJP: ConfigCustom.tagDaily,
//     valueKey: ConfigCustom.tagDaily,
//   ),
//   _JackpotItem(
//     nameJP: ConfigCustom.tagDailyGolden2, // ? display name
//     valueKey: ConfigCustom.tagDailyGolden, // ? value source
//   ),
//   _JackpotItem(
//     nameJP: ConfigCustom.tagDozen,
//     valueKey: ConfigCustom.tagDozen,
//   ),
//   _JackpotItem(
//     nameJP: ConfigCustom.tagTriple,
//     valueKey: ConfigCustom.tagTriple,
//   ),
//   _JackpotItem(
//     nameJP: ConfigCustom.tagWeekly,
//     valueKey: ConfigCustom.tagWeekly,
//   ),
  
// ];

//   @override
//   void initState() {
//     super.initState();

//     stripWidth = itemStep * items.length;

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(
//         milliseconds: ((stripWidth / speed) * 1000).round(),
//       ),
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   // ================= Marquee math =================
//   double _calculateX(double baseX) {
//     final travel = _controller.value * stripWidth;
//     return (baseX - travel) % stripWidth;
//   }

//   // ================= Glass builder =================
//   LiquidGlass? _buildGlassItem({
//     required int index,
//     required double y,
//   }) {
//     final baseX = index * itemStep;
//     final x = _calculateX(baseX);

//     if (x < -itemWidth || x > screenWidth) return null;

//     final item = items[index];

//     return LiquidGlass(
//       width: itemWidth,
//       height: itemHeight,
//       distortion: 0.2,
//       blur: LiquidGlassBlur(sigmaX: 2.5,sigmaY: 2.5),
//       distortionWidth: 40,
//       magnification: 1.075,
//       chromaticAberration: 0.001,
//       saturation: 1,
//       draggable: false,
//       visibility: true,
//       outOfBoundaries: false,
//       position: LiquidGlassOffsetPosition(
//         left: x,
//         top: y,
//       ),

//       // ? TITLE OUTSIDE (VISUAL) + ODOMETER INSIDE
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.center,
//         children: [
//           // ===== TITLE ABOVE GLASS =====
//           Positioned(
//             top: -22,
//             child: Text(
//               item.nameJP,
//               style: const TextStyle(
//                 color: Colors.white70,
//                 fontSize: 13,
//                 fontWeight: FontWeight.w600,
//                 shadows: [
//                   Shadow(
//                     blurRadius: 6,
//                     color: Colors.black45,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // ===== ODOMETER =====
//           RepaintBoundary(
//             child:
//             JackpotOdometer(
//             nameJP: item.nameJP,
//             valueKey: item.valueKey,
//             hiveValue: widget.hiveValues[item.valueKey] ?? 0.0,
//             isSmall: false,
//             )
//             ),
//         ],
//       ),
//     );
//   }

//   // ================= BUILD =================
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, __) {
//         return LiquidGlassView(
//           realTimeCapture: true,
//           backgroundWidget: const RepaintBoundary(
//             child: JackpotBackgroundShowNoDelayNoFrame(),
//           ),
//           children: List.generate(
//             items.length,
//             (i) => _buildGlassItem(index: i, y: 60),
//           ).whereType<LiquidGlass>().toList(),
//         );
//       },
//     );
//   }
// }

// class _JackpotItem {
//   final String nameJP;     // what JackpotOdometer displays
//   final String valueKey;   // where the value comes from (Hive / Bloc)

//   const _JackpotItem({
//     required this.nameJP,
//     required this.valueKey,
//   });
// }


import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/jackpot_video_BGPage_NoDelayNoFrame.dart';
import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_page.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';

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
  static const double itemHeight = 90;
  static const double gap = 30;
  static const double itemStep = itemWidth + gap;
  static const double speed = 20.0; // px/sec

  late final double stripWidth;

  final List<_JackpotItem> items = const [
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

  // ================= Glass item =================
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
      distortion: 0.25,
      distortionWidth: 45,
      magnification: 1.15,
      chromaticAberration: 0.003,
      saturation: 1,
      draggable: false,
      visibility: true,
      outOfBoundaries: false,
      position: LiquidGlassOffsetPosition(
        left: x,
        top: y,
      ),

      // ================= CONTENT =================
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // ===== TITLE (OUTSIDE GLASS, ABOVE) =====
          Positioned(
            top: -24,
            child: Text(
              item.nameJP,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 6,
                    color: Colors.black45,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),

          // ===== ODOMETER (INSIDE GLASS) =====
          RepaintBoundary(
            child: JackpotOdometer(
              nameJP: item.nameJP,
              valueKey: item.valueKey,
              hiveValue: widget.hiveValues[item.valueKey] ?? 0.0,
              isSmall: false,
            ),
          ),
        ],
      ),
    );
  }

  // ================= BUILD =================
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return LiquidGlassView(
          realTimeCapture: true,
          backgroundWidget: const RepaintBoundary(
            child: JackpotBackgroundShowNoDelayNoFrame(),
          ),
          children: List.generate(
            items.length,
            (i) => _buildGlassItem(index: i, y: 60),
          ).whereType<LiquidGlass>().toList(),
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
