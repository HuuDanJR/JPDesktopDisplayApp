import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'package:playtech_transmitter_app/screen/background_screen/bloc_socket_time/jackpot_bloc_socket.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc_socket_time/jackpot_event_socket.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc/video_bloc.dart';
import 'package:playtech_transmitter_app/service/widget/circlar_progress.dart';


class JackpotBackgroundShowNoDelayWLiquidGrassBG extends StatefulWidget {
  const JackpotBackgroundShowNoDelayWLiquidGrassBG({super.key});
  @override
  _JackpotBackgroundShowNoDelayWLiquidGrassBGState createState() => _JackpotBackgroundShowNoDelayWLiquidGrassBGState();
}

class _JackpotBackgroundShowNoDelayWLiquidGrassBGState extends State<JackpotBackgroundShowNoDelayWLiquidGrassBG>
    with SingleTickerProviderStateMixin {
  late final Player _player;
  late final VideoController _controller;
  String? _currentVideoPath;
  bool _isInitialized = false;
  bool _isSwitching = false;
  int _retryCount = 0;
  static const int _maxRetries = 10;
  final Media _media1 = Media('asset://${ConfigCustom.videoBackgroundHDNoContainerBorder}');
  final Media _media2 = Media('asset://${ConfigCustom.videoBackgroundHDNoContainerBorder}');

  @override
  void initState() {
    super.initState();
    MediaKit.ensureInitialized();
    // GlassRegistry.init(); // ? ADD THIS LINE


    // Initialize player and controller
    _player = Player();
    _controller = VideoController(
      _player,
      configuration: const VideoControllerConfiguration(
        enableHardwareAcceleration: true,
      ),
    );

    // Load initial video
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadVideo(ConfigCustom.videoBackgroundHDNoContainerBorder);
    });

    // Handle errors
    _player.stream.error.listen((error) {
      if (mounted && _retryCount < _maxRetries) {
        _retryCount++;
        setState(() {
          _isInitialized = false;
          _currentVideoPath = null;
        });
        Future.delayed(const Duration(milliseconds: 10), () {
          if (mounted) {
            _loadVideo(_currentVideoPath ?? ConfigCustom.videoBackgroundHDNoContainerBorder);
          }
        });
      }
    });

    // Ensure playback unless jackpot hit
    _player.stream.playing.listen((playing) {
      if (!playing && mounted && context.read<JackpotBloc2>().state is! JackpotHitReceived && !_isSwitching) {
        _player.play();
      }
    });

    // Update initialization state
    _player.stream.width.listen((width) {
      if (width != null && width > 0 && mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    });
  }

  Future<void> _loadVideo(String videoPath) async {
    if (_currentVideoPath == videoPath || _isSwitching) {
      if (_player.state.playing) return;
      await _player.play();
      return;
    }

    _isSwitching = true;
    try {
      await _player.pause();
      await Future.delayed( const Duration(milliseconds: 100)); // Delay to stabilize libmpv| 100ms 

      _currentVideoPath = videoPath;
      final media = videoPath == ConfigCustom.videoBackgroundHDNoContainerBorder ? _media1 : _media2;
      await _player.open(media, play: false);
      await _player.setVolume(0.0);
      await _player.play();
      if (mounted) {
      }
      _retryCount = 0;
    } catch (error) {
      if (mounted && _retryCount < _maxRetries) {
        _retryCount++;
        setState(() {
          _isInitialized = false;
          _currentVideoPath = null;
        });
        Future.delayed(const Duration(milliseconds: 10), () {
          if (mounted) {
            _loadVideo(videoPath);
          }
        });
      }
    } finally {
      _isSwitching = false;
    }
  }

  @override
  void dispose() {
    _player.pause();
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final jackpotState = context.read<JackpotBloc2>().state;
    if (jackpotState is JackpotHitReceived) {
      // _player.pause();
    } else if (!_player.state.playing && !_isSwitching) {
      _player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VideoBloc, ViddeoState, ({String currentVideo, int count, bool isRestart})>(
  selector: (state) => (
    currentVideo: state.currentVideo,
    count: state.count,
    isRestart: state.isRestart,
  ),
  builder: (context, value) {
    // Optional: reload video if changed (your existing logic)
    if (_currentVideoPath != value.currentVideo && !context.read<JackpotBloc2>().state.showImagePage) {
      _loadVideo(value.currentVideo);
    }
    return LiquidGlassView(
      controller: LiquidGlassViewController(), // create one here or as class field
      backgroundWidget: Stack(
        fit: StackFit.expand,
        children: [
          // Your video (core background)
          if (_isInitialized)
            RepaintBoundary(
              child: Video(
                controls: (_) => const SizedBox.shrink(),
                controller: _controller,
                fit: BoxFit.fill,
              ),
            )
          else   circularProgessCustom(),
          // Your existing overlay (LED jackpot animation, text, etc.)
          // const RepaintBoundary(child: JackpotDisplayScreenSlideAnimationLedHD1920x1080WLiquidGrass()), //VIEW PAGE IMPORTANT
        ],
      ),

      // ?? Important settings for video ??
      realTimeCapture: true,                     // MUST be true for moving video
      refreshRate: LiquidGlassRefreshRate.deviceRefreshRate, // usually 60fps or 120fps
      useSync: true,                             // better perf on video (async capture)
      pixelRatio: 0.6,       
      // children: GlassRegistry.consume(),
      
      children: [
        // Example: one nice draggable lens in center
        LiquidGlass(
          position: const LiquidGlassAlignPosition(alignment: Alignment.center),
          width: 320,
          height: 100,
          magnification: 1,
          distortion: 0.05,
          distortionWidth: 40,
          chromaticAberration: 0.003,
          blur: const LiquidGlassBlur(sigmaX: 0.5, sigmaY: 0.5),
          draggable: true,
          outOfBoundaries: true,
          // child: Text('100,00.87',textAlign: TextAlign.center,style:TextStyle(color:Colors.white,fontSize: 68)),
          shape:const RoundedRectangleShape(
            cornerRadius: 48,
            borderWidth: 1,
            borderSoftness: 5.0,
            lightIntensity: 1,
            lightDirection: 45,
          ),
          color: Colors.white.withAlpha(30),
          
        ),
        // Add more lenses if you want (e.g. smaller ones in corners)
      ],
    );
  },
);
  }
}









// children: [
      //   // Example: one nice draggable lens in center
      //   LiquidGlass(
      //     position: const LiquidGlassAlignPosition(alignment: Alignment.center),
      //     width: 320,
      //     height: 100,
      //     magnification: 1,
      //     distortion: 0.05,
      //     distortionWidth: 40,
      //     chromaticAberration: 0.003,
      //     blur: const LiquidGlassBlur(sigmaX: 0.5, sigmaY: 0.5),
      //     draggable: true,
      //     outOfBoundaries: true,
      //     // child: Text('100,00.87',textAlign: TextAlign.center,style:TextStyle(color:Colors.white,fontSize: 68)),
      //     shape:const RoundedRectangleShape(
      //       cornerRadius: 48,
      //       borderWidth: 1,
      //       borderSoftness: 5.0,
      //       lightIntensity: 1,
      //       lightDirection: 45,
      //     ),
      //     color: Colors.white.withAlpha(30),
          
      //   ),
      //   // Add more lenses if you want (e.g. smaller ones in corners)
      // ],