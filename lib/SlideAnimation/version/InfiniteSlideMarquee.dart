import 'package:flutter/material.dart';

class InfiniteSlideMarquee extends StatefulWidget {
  final Widget child;
  final double speed; // pixels per second

  const InfiniteSlideMarquee({
    super.key,
    required this.child,
    this.speed = 30,
  });

  @override
  State<InfiniteSlideMarquee> createState() => _InfiniteSlideMarqueeState();
}

class _InfiniteSlideMarqueeState extends State<InfiniteSlideMarquee>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  double _width = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(days: 365),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _width = constraints.maxWidth;

        return ClipRect(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              final dx = -(_animation.value * widget.speed) % _width;

              return Stack(
                children: [
                  Transform.translate(
                    offset: Offset(dx, 0),
                    child: SizedBox(
                      width: _width,
                      child: widget.child,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(dx + _width, 0),
                    child: SizedBox(
                      width: _width,
                      child: widget.child,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
