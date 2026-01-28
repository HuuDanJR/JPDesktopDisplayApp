import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc_socket_time/jackpot_bloc_socket.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc_socket_time/jackpot_event_socket.dart';
import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_SlideAnimation1920x1080.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc/video_bloc.dart';
import 'package:playtech_transmitter_app/service/widget/circlar_progress.dart';


class BackgroundPageWidget extends StatefulWidget {
  const BackgroundPageWidget({super.key});
  @override
  _BackgroundPageWidgetState createState() => _BackgroundPageWidgetState();
}

class _BackgroundPageWidgetState extends State<BackgroundPageWidget>
    with SingleTickerProviderStateMixin {
  late final Player _player;
  late final VideoController _controller;
  String? _currentVideoPath;
  bool _isInitialized = false;
  bool _isSwitching = false;
  int _retryCount = 0;
  static const int _maxRetries = 10;
  final Media _media1 = Media('asset://${ConfigCustom.videoBackgroundScreenFull}');
  final Media _media2 = Media('asset://${ConfigCustom.videoBackgroundScreenFull}');

  @override
  void initState() {
    super.initState();
    MediaKit.ensureInitialized();


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
      _loadVideo(ConfigCustom.videoBackgroundScreenFull);
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
            _loadVideo(_currentVideoPath ?? ConfigCustom.videoBackgroundScreenFull);
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
      // await Future.delayed( const Duration(milliseconds: ConfigCustom.switchBetweeScreenDuration)); // Delay to stabilize libmpv
      await Future.delayed( const Duration(milliseconds: 1500)); // Delay to stabilize libmpv| 1.5s 

      _currentVideoPath = videoPath;
      final media = videoPath == ConfigCustom.videoBackgroundScreenFull ? _media1 : _media2;
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
            if (_currentVideoPath != value.currentVideo && !context.read<JackpotBloc2>().state.showImagePage) {
              // debugPrint('BackgroundPageWidget: Loading new video from VideoBloc: ${value.currentVideo}');
              _loadVideo(value.currentVideo);
            }
            // debugPrint('BackgroundPageWidget: Rendering UI, currentVideo=${value.currentVideo}, count=${value.count}, isRestart=${value.isRestart}');
            return RepaintBoundary(
              child: SizedBox.expand(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _isInitialized
                        ? RepaintBoundary(
                            child: Video(
                              // fill: Colors.transparent,
                              controls: (state) => Container(),
                              controller: _controller,
                              fit: BoxFit.fill,
                            ),
                          )
                        : circularProgessCustom(),
                  ],
                ),
              ),
            );
          },
        );
  }
}
