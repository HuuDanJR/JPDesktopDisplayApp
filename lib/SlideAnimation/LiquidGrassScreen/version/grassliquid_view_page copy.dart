// import 'package:flutter/material.dart';
// import 'package:liquid_glass_easy/liquid_glass_easy.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/test/background_view_page.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/test/grassliquid_item_page.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/test/image_view_page.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/version/marqueeStack.dart';
// import 'package:playtech_transmitter_app/service/config_custom.dart';
// import 'package:playtech_transmitter_app/service/widget/text_custom.dart';



// // class LiquidGlassViewPage extends StatelessWidget {
// //   const LiquidGlassViewPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: LiquidGlassView(
// //   realTimeCapture: true,
// //   pixelRatio: 0.7,
// //   backgroundWidget: const BackgroundPageWidget(),
// //   children: [
// //     MarqueeStack(
// //       duration: const Duration(seconds: 20),
// //       items: LiquidGlassItemsPage.build(),
// //     ),
// //   ],
// // )
// //     );
// //   }
// // }



// class LiquidGlassViewPage extends StatefulWidget {
//   const LiquidGlassViewPage({super.key});

//   @override
//   State<LiquidGlassViewPage> createState() => _LiquidGlassViewPageState();
// }

// class _LiquidGlassViewPageState extends State<LiquidGlassViewPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   static const double stripWidth = 2340; // > 1920 (important)

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

//   double slideX(double baseX) {
//     return baseX - (_controller.value * stripWidth);
//   }

//   double marqueeX(double baseX, double itemWidth) {
//   final double totalWidth = stripWidth + itemWidth;
//   final double travel = _controller.value * stripWidth;

//   final double x = baseX - travel;

//   // wrap smoothly from left ? right
//   return (x + totalWidth) % totalWidth - itemWidth;
// }

//   @override
//   Widget build(BuildContext context) {
//     final double itemWidth = ConfigCustom.fixWidth_HD_led_curved / 8;
//     final double itemHeight =  ConfigCustom.odo_height_1920x1080_curved;

//     LiquidGlass buildGlass(double baseX, double baseY) {
//       return LiquidGlass(
//         width: itemWidth,
//         height: itemHeight,
//         distortion: 0.12,
//         magnification: 1.0,
//         position: LiquidGlassOffsetPosition(
//           left: slideX(baseX),
//           top: baseY,
//         ),
//       );
//     }
//     LiquidGlass buildGlassChild(double baseX, double baseY, String text) {
//   return LiquidGlass(
//     width: itemWidth,
//     height: itemHeight,
//     distortion: 0.4,
//     magnification: 1.2,
//     draggable: true,
//     enableInnerRadiusTransparent: true,
//     child: Center(
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ),
//     position: LiquidGlassOffsetPosition(
//       left: marqueeX(baseX, itemWidth),
//       top: baseY,
//     ),
//   );
// }



//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: _controller,
//         builder: (_, __) {
//           return LiquidGlassView(
//             realTimeCapture: true,
//             pixelRatio: 1,
//             backgroundWidget: const ImageViewPage(),
//             children: [
//               buildGlassChild(
//                 ConfigCustom.jp_frequent_screen_dX_ledstairSlideAnimation,
//                 ConfigCustom.jp_frequent_screen_dY_ledstairSlideAnimation,
//                 "FREQUENT"
//               ),
//               buildGlassChild(
//                 ConfigCustom.jp_daily_screen_dX_ledstairSlideAnimation,
//                 ConfigCustom.jp_daily_screen_dY_ledstairSlideAnimation,
//                 "DAILY"
//               ),
//               buildGlassChild(
//                 ConfigCustom.jp_dailygolden_screen_dX_ledstairSlideAnimation,
//                 ConfigCustom.jp_dailygolden_screen_dY_ledstairSlideAnimation,
//                 "DAILYGOLDEN"
//               ),
//               buildGlassChild(
//                 ConfigCustom.jp_dozen_screen_dX_ledstairSlideAnimation,
//                 ConfigCustom.jp_dozen_screen_dY_ledstairSlideAnimation,
//                 "DOZEN"
//               ),
//               buildGlassChild(
//                 ConfigCustom.jp_triple_screen_dX_ledstairSlideAnimation,
//                 ConfigCustom.jp_triple_screen_dY_ledstairSlideAnimation,
//                 "TRIPLE"
//               ),
//               buildGlassChild(
//                 ConfigCustom.jp_weekly_screen_dX_ledstairSlideAnimation,
//                 ConfigCustom.jp_weekly_screen_dY_ledstairSlideAnimation,
//                 "WEEKLY"
//               ),
//               buildGlassChild(
//                 ConfigCustom.jp_highlimit_screen_dX_ledstairSlideAnimation,
//                 ConfigCustom.jp_highlimit_screen_dY_ledstairSlideAnimation,
//                 "HIGHLIMIT"
//               ),
//               buildGlassChild(
//                 ConfigCustom.jp_monthly_screen_dX_ledstairSlideAnimation,
//                 ConfigCustom.jp_monthly_screen_dY_ledstairSlideAnimation,
//                 "MONTHLY"
//               ),
//               buildGlassChild(
//                 ConfigCustom.jp_vegas_screen_dX_ledstairSlideAnimation,
//                 ConfigCustom.jp_vegas_screen_dY_ledstairSlideAnimation,
//                 "VEGAS"
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
