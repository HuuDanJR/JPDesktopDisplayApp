import 'package:flutter/material.dart';

class MarqueeItem extends StatefulWidget {
  final Widget child;
  final double speed; // pixels per second
  final VoidCallback onFinish;

  const MarqueeItem({
    super.key,
    required this.child,
    required this.speed,
    required this.onFinish,
  });

  @override
  State<MarqueeItem> createState() => _MarqueeItemState();
}

class _MarqueeItemState extends State<MarqueeItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _xAnimation;

  @override
  void initState() {
    super.initState();

    final screenWidth = MediaQueryData.fromWindow(
      WidgetsBinding.instance.window,
    ).size.width;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: ((screenWidth / widget.speed) * 1000).toInt(),
      ),
    );

    _xAnimation = Tween<double>(
      begin: screenWidth,
      end: 0,
    ).animate(_controller)
      ..addListener(() {
        if (_xAnimation.value <= 0) {
          widget.onFinish(); // ? FINISH SIGNAL
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _xAnimation,
      builder: (_, child) {
        return Positioned(
          left: _xAnimation.value,
          bottom: 120, // adjust vertical position
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}
