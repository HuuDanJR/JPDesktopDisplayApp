import 'package:flutter/material.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';



class LiquidGlassProfileScreen extends StatefulWidget {
  const LiquidGlassProfileScreen({super.key});

  @override
  State<LiquidGlassProfileScreen> createState() => _LiquidGlassProfileScreenState();
}

class _LiquidGlassProfileScreenState extends State<LiquidGlassProfileScreen> {
  final viewController = LiquidGlassViewController();
  final lensController = LiquidGlassController();

  bool _showLens = true;

  @override
  void initState() {
    super.initState();
    // Optional: take initial snapshot if not using real-time
    Future.delayed(const Duration(milliseconds: 300), () {
      viewController.captureOnce();
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      
      body: LiquidGlassView(
        controller: viewController,
        // Nice gradient + subtle pattern background (you can use Image.network/asset too)
        backgroundWidget: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1E3A8A), Color(0xFF312E81), Color(0xFF4C1D95)],
            ),
          ),
          child: Center(
            child: Opacity(
              opacity: 0.15,
              child: Icon(Icons.waves_rounded, size: 400, color: Colors.white),
            ),
          ),
        ),
        // Use real-time if background animates; false + captureOnce for static
        realTimeCapture: false,
        useSync: true,
        pixelRatio: 1.0,           // lower to 0.7?0.8 if performance needed
        refreshRate: LiquidGlassRefreshRate.deviceRefreshRate,
        children: [
            LiquidGlass(
              controller: lensController,
              // Center it, but draggable anywhere
              position: const LiquidGlassAlignPosition(alignment: Alignment.center),
              width: 280,
              height: 360,
              magnification: 1.085,          // slight zoom inside lens
              distortion: 0.1,             // gentle wave/distortion
              distortionWidth: 65,
              chromaticAberration: 0.003,   // subtle color split (real glass feel)
              blur: const LiquidGlassBlur(sigmaX: 1.2, sigmaY: 1.2), // soft focus
              draggable: true,
              outOfBoundaries: true,        // can drag outside screen edges
              enableInnerRadiusTransparent: false,
              diagonalFlip: 0,

              // Modern rounded glass look with nice lighting
              shape: RoundedRectangleShape(
                cornerRadius: 44,
                borderWidth: 1.5,
                borderSoftness: 4.0,
                lightIntensity: 1.6,
                oneSideLightIntensity: 0.5,
                lightDirection: 45.0,       // 45° gives nice diagonal highlight
              ),
              color: Colors.white.withAlpha(35),
              
            ),
        ],
      ),
      
    );
  }

}