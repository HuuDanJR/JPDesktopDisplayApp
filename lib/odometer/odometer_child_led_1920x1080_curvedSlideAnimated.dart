

import 'package:flutter/material.dart';
import 'package:playtech_transmitter_app/SlideAnimation/version/Glassmorphism.dart';
import 'package:playtech_transmitter_app/odometer/odometer_child.dart';
import 'package:playtech_transmitter_app/odometer/odometer_number.dart';
import 'package:playtech_transmitter_app/odometer/slide_odometer.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';
import 'package:playtech_transmitter_app/service/widget/text_custom.dart';
import 'dart:async';
import 'package:playtech_transmitter_app/service/widget/text_style.dart';



class GameOdometerChildLed1920x1080CurvedSlideAnimated extends StatefulWidget {
  final double startValue;
  final double endValue;
  final double hiveValue; // New field for Hive initial value
  final String nameJP;
  final bool isSmall;

   const GameOdometerChildLed1920x1080CurvedSlideAnimated({
    super.key,
    required this.startValue,
    required this.endValue,
    required this.hiveValue,
    required this.nameJP,
    required this.isSmall,
  });

  @override
  _GameOdometerChildLed1920x1080CurvedSlideAnimatedState createState() => _GameOdometerChildLed1920x1080CurvedSlideAnimatedState();
}

class _GameOdometerChildLed1920x1080CurvedSlideAnimatedState extends State<GameOdometerChildLed1920x1080CurvedSlideAnimated> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<OdometerNumber> odometerAnimation;
  late ValueNotifier<double> currentValueNotifier;
  late int durationPerStep;
  late int durationPerStepHive;
  Timer? _animationTimer;
  final String fontFamily = 'sf-pro-display';
  bool _isFirstRun = true; // Flag to use hiveValue on first run
  static const Duration _debounceDuration = Duration(seconds: 0);
  DateTime? _lastUpdateTime;
  final bool _isDisposing = false;
  final double totalDuration = ConfigCustom.durationFinishCircleSpinNumberDouble; // 29.5 seconds


  @override
  void initState() {
    super.initState();
    final initialValue = widget.startValue == 0.0 ? widget.hiveValue : widget.startValue;
    currentValueNotifier = ValueNotifier<double>(initialValue);
    durationPerStep = calculationDurationPerStep(
      startValue: initialValue,
      endValue: widget.endValue,
    );
    _initializeAnimationController();
    _updateAnimation(currentValueNotifier.value, currentValueNotifier.value);
  }



  @override
  void didUpdateWidget(covariant GameOdometerChildLed1920x1080CurvedSlideAnimated oldWidget) {
    super.didUpdateWidget(oldWidget);
    final now = DateTime.now();
    if (widget.startValue != oldWidget.startValue || widget.endValue != oldWidget.endValue) {
      _animationTimer?.cancel();
      currentValueNotifier.value = widget.startValue == 0.0 ? widget.endValue : widget.startValue;
      durationPerStep = calculationDurationPerStep(
        startValue:_isFirstRun==true ? widget.hiveValue :  widget.startValue,
        endValue: widget.endValue,
      );
      animationController
        ..stop()
        ..duration = Duration(milliseconds: durationPerStep);
       _updateAnimation(currentValueNotifier.value, currentValueNotifier.value);

      if (_isFirstRun == true && widget.hiveValue > 0 && widget.hiveValue < widget.endValue) {
        _startAutoAnimation(widget.hiveValue);
      }
      if (widget.startValue != 0.0  || widget.startValue !=0 && !_isDisposing) {
        _startAutoAnimation(widget.startValue);
      }
      _isFirstRun = false; // Disable hiveValue after first run
      _lastUpdateTime = now;
    }
  }




  void _startAutoAnimation(double startValue) {
    const increment = 0.01;
    final interval = Duration(milliseconds:  durationPerStep.clamp(10,ConfigCustom.maxTimeToStartAnDecimalAnimationMs));
    _animationTimer?.cancel();
    currentValueNotifier.value = startValue;
    _updateAnimation(startValue, startValue);
    _animationTimer = Timer.periodic(interval, (timer) {
      if (!mounted || _isDisposing || currentValueNotifier.value >= widget.endValue) {
        timer.cancel();
        return;
      }
      if (currentValueNotifier.value >= widget.endValue || !mounted) {
        timer.cancel();
        return;
      }
      final nextValue = (currentValueNotifier.value + increment).clamp(currentValueNotifier.value, widget.endValue);
      _updateAnimation(currentValueNotifier.value, nextValue);
      currentValueNotifier.value = nextValue;
      animationController.forward(from: 0.0);

    });
  }

  @override
  void dispose() {
    _animationTimer?.cancel();
    animationController.dispose();
    currentValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

 return ClipRect(
      child: RepaintBoundary(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.translate(
              offset: const Offset(0, 1), // Shift text down by 2 pixels
              child: textCustom(
                value: widget.nameJP.toUpperCase(),
                size: 18,
              ),
            ),
            Glassmorphism(
              child: Container(
                // color:Colors.white10,
                alignment: Alignment.center,
                width: ConfigCustom.fixWidth_HD_led_curved / 8,
                height: ConfigCustom.odo_height_1920x1080_curved,
                child: Stack(
                  children: [
                    Positioned(
                      top: -ConfigCustom.odo_position_top_1920x1080_curved,
                      left: 0,
                      right: 0,
                      child: ValueListenableBuilder<double>(
                        valueListenable: currentValueNotifier,
                        builder: (context, value, child) {
                          if (value <= 0.01) {
                            return const SizedBox.shrink(); // Completely invisible, no space, no 0.00
                          }
                          return RepaintBoundary(
                            child: SlideOdometerTransition(
                              verticalOffset:  ConfigCustom.text_odo_letter_vertical_offset_1920x1080_curved,
                              groupSeparator: const Text(',', style:  textStyleOdo1920x1080_Curved,),
                              decimalSeparator: const Text('.', style:  textStyleOdo1920x1080_Curved,),
                              letterWidth:ConfigCustom.text_odo_letter_width_1920x1080_curved,
                              odometerAnimation: odometerAnimation,
                              numberTextStyle: textStyleOdo1920x1080_Curved,
                              decimalPlaces: 2,
                              integerDigits: 0,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _initializeAnimationController() {
    animationController = AnimationController(
      duration: Duration(milliseconds: durationPerStep),
      vsync: this,
    );
  }

  void _updateAnimation(double start, double end) {
    odometerAnimation = OdometerTween(
      begin: OdometerNumber((start * 100).round()),
      end: OdometerNumber((end * 100).round()),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
    );
  }
}


