// import 'package:flutter/material.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/version/marqueeItem.dart';




// class MarqueeStack extends StatefulWidget {
//   final List<MarqueeItem> items;
//   final Duration duration;

//   const MarqueeStack({
//     super.key,
//     required this.items,
//     this.duration = const Duration(seconds: 10),
//   });

//   @override
//   State<MarqueeStack> createState() => _MarqueeStackState();
// }

// class _MarqueeStackState extends State<MarqueeStack>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   bool _firstRun = true;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: widget.duration,
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (_, constraints) {
//         final startX = _firstRun ? 540.0 : constraints.maxWidth;
//         final endX = -constraints.maxWidth;

//         // PRE-BUILD children here so they aren't recreated inside the builder
//         final List<Widget> staticItems = widget.items.map((item) {
//           return RepaintBoundary(child: item.child);
//         }).toList();

//         return ClipRect(
//           child: AnimatedBuilder(
//             animation: _controller,
//             // Pass the pre-built items to the 'child' parameter
//             child: Stack(children: staticItems),
//             builder: (context, childStack) {
//               final baseX = startX + (endX - startX) * _controller.value;

//               if (_controller.value > 0.01) {
//                 _firstRun = false;
//               }

//               // Use the cached childStack but wrap individual items in Transform.
//               // Note: For 9 items, shifting the entire Stack or using 
//               // a custom MultiChildLayoutDelegate would be even faster.
//               return Stack(
//                 children: List.generate(widget.items.length, (index) {
//                   final item = widget.items[index];
//                   return Transform.translate(
//                     offset: Offset(baseX + item.offset.dx, item.offset.dy),
//                     child: staticItems[index],
//                   );
//                 }),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'marqueeItem.dart';

class MarqueeStack extends StatefulWidget {
  final List<MarqueeItem> items;
  final Duration duration;

  const MarqueeStack({
    super.key,
    required this.items,
    this.duration = const Duration(seconds: 10),
  });

  @override
  State<MarqueeStack> createState() => _MarqueeStackState();
}

class _MarqueeStackState extends State<MarqueeStack>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  /// Width of ONE full strip (based on your offsets)
  /// From ~20 ? ~2360
  static const double _stripWidth = 2340;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(); // endless
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Pre-build children ONCE (performance critical)
    final List<Widget> staticItems = widget.items
        .map((item) => RepaintBoundary(child: item.child))
        .toList();

    return ClipRect(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          // Move continuously left
          final double dx = -_controller.value * _stripWidth;

          return Stack(
            children: [
              // First strip
              _buildStrip(dx, staticItems),

              // Second strip (right after first)
              _buildStrip(dx + _stripWidth, staticItems),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStrip(double baseX, List<Widget> staticItems) {
    return Stack(
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        return Transform.translate(
          offset: Offset(
            baseX + item.offset.dx,
            item.offset.dy,
          ),
          child: staticItems[index],
        );
      }),
    );
  }
}
