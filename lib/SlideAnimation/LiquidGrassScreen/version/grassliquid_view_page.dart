
import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidGlassFullPage extends StatefulWidget {
  const LiquidGlassFullPage({super.key});

  @override
  State<LiquidGlassFullPage> createState() => _LiquidGlassFullPageState();
}

class _LiquidGlassFullPageState extends State<LiquidGlassFullPage>
    with SingleTickerProviderStateMixin {
  /// ===== SHADER =====
  FragmentShader? liquidShader;

  /// ===== ANIMATION =====
  late AnimationController _controller;
  late Animation<double> _slideAnim;

  /// ===== STATE =====
  bool startSliding = false;

  /// ===== ITEMS =====
  final List<String> items = [
    'FREQUENT',
    'DAILY',
    'DAILYGOLDEN',
    'WEEKLY',
    'MONTHLY',
    'MEGA',
    'SUPER',
    'JACKPOT',
    'VEGAS',
  ];

  static const double itemWidth = 240;
  static const double itemGap = 20;

  @override
  void initState() {
    super.initState();
    _initShader();
    _initAnimation();
    _startDelay();
  }

  /// ===== LOAD SHADER SAFELY =====
  Future<void> _initShader() async {
    try {
      final program = await FragmentProgram.fromAsset(
        'assets/shaders/liquid_glass.frag',
      );
      liquidShader = program.fragmentShader();
      setState(() {});
    } catch (e) {
      debugPrint('Shader load failed: $e');
    }
  }

  /// ===== ANIMATION SETUP =====
  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    );

    final totalWidth =
        (itemWidth + itemGap) * items.length;

    _slideAnim = Tween<double>(
      begin: 0,
      end: -totalWidth,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  /// ===== 30s DELAY BEFORE SLIDE =====
  void _startDelay() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      setState(() => startSliding = true);
      _controller.repeat();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// ===== UI =====
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: 1920,
          height: 140,
          child: ClipRect(
            child: startSliding
                ? _animatedView()
                : _staticView(),
          ),
        ),
      ),
    );
  }

  /// ===== STATIC VIEW (FIRST 30s) =====
  Widget _staticView() {
    return Row(
      children: items.map(_buildItem).toList(),
    );
  }

  /// ===== SLIDING VIEW (AFTER 30s) =====
  Widget _animatedView() {
    if (liquidShader == null) {
      // Safety fallback (no shader yet)
      return _staticView();
    }

    return AnimatedBuilder(
      animation: _slideAnim,
      builder: (_, __) {
        return Transform.translate(
          offset: Offset(_slideAnim.value, 0),
          child: CustomPaint(
            painter: LiquidGlassPainter(shader: liquidShader!),
            child: Row(
              children: items.map(_buildItem).toList(),
            ),
          ),
        );
      },
    );
  }

  /// ===== ITEM =====
  Widget _buildItem(String text) {
    return Container(
      width: itemWidth,
      margin: const EdgeInsets.only(right: itemGap),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}




class LiquidGlassPainter extends CustomPainter {
  final FragmentShader shader;

  LiquidGlassPainter({required this.shader});

  @override
  void paint(Canvas canvas, Size size) {
    shader
      ..setFloat(0, size.width)
      ..setFloat(1, size.height)
      ..setFloat(2, DateTime.now().millisecondsSinceEpoch / 1000);

    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Offset.zero & size,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
