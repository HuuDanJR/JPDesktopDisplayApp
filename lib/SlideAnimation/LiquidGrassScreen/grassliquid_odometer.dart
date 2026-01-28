
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/grassliquid_odometer_body.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc_jp_price/main/jackpot_price_bloc.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc_jp_price/main/jackpot_price_state.dart';

class JackpotOdometerGrasslLiquid extends StatelessWidget {
  final String nameJP;
  final String valueKey;
  final double hiveValue;
  final bool isSmall;

  const JackpotOdometerGrasslLiquid({
    super.key,
    required this.nameJP,
    required this.valueKey,
    required this.hiveValue,
    required this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<JackpotPriceBloc, JackpotPriceState, ({double startValue, double endValue})>(
      selector: (state) {
        final blocStartValue = state.previousJackpotValues[valueKey] ?? 0.0;
        final endValue = state.jackpotValues[valueKey] ?? 0.0;
        return (startValue: blocStartValue, endValue: endValue);
      },
      builder: (context, values) {
        return RepaintBoundary(
          child: GrassLiquidOdometerBodyPage(
            startValue: values.startValue,
            endValue: values.endValue,
            nameJP: nameJP,
            hiveValue: hiveValue,
            isSmall: isSmall,
          ),
        );
        
      },
    );
  }
}







