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
//   // SCREEN DEBUG GUIDES
//   // =======================
//   Widget debugScreenGuides() {
//     if (!debugOverlay) return const SizedBox.shrink();

//     return Stack(
//       children: [
//         // LEFT EDGE
//         Positioned(
//           left: 0,
//           top: 0,
//           bottom: 0,
//           child: Container(width: 2, color: Colors.red),
//         ),

//         // RIGHT EDGE (1920)
//         Positioned(
//           left: screenWidth,
//           top: 0,
//           bottom: 0,
//           child: Container(width: 2, color: Colors.red),
//         ),

//         Positioned(
//           left: 10,
//           top: 10,
//           child: Container(
//             padding: const EdgeInsets.all(6),
//             color: Colors.black.withOpacity(0.6),
//             child: const Text(
//               "RED = Screen Bounds (0 ? 1920)",
//               style: TextStyle(color: Colors.white, fontSize: 12),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // =======================
//   // BUILD
//   // =======================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           AnimatedBuilder(
//             animation: _controller,
//             builder: (_, __) {
//               return LiquidGlassView(
//                 realTimeCapture: true,
//                 pixelRatio: 1.25,
//                 useSync: true,
//                 refreshRate: LiquidGlassRefreshRate.deviceRefreshRate,
//                 backgroundWidget: const ImageViewPage(),
//                 children: List.generate(
//                   labels.length,
//                   (i) => buildGlassItem(
//                     index: i,
//                     y: 45,
//                     text: labels[i],
//                   ),
//                 ),
//               );
//             },
//           ),

//           // DEBUG OVERLAY
//           debugScreenGuides(),
//         ],
//       ),
//     );
//   }
// }
