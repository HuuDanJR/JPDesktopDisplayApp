import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/screen_led_stair_SlideAnimationWLiquidGrass.dart';
import 'package:playtech_transmitter_app/service/hive_service/jackpot_hive_service.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc_jp_price/main/jackpot_price_bloc.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc_jp_price/main/jackpot_price_state.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';
import 'package:playtech_transmitter_app/screen/setting/setting_service.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc/video_bloc.dart';
import 'package:playtech_transmitter_app/service/widget/circlar_progress.dart';

class JackpotDisplayScreenSlideAnimationLedHD1920x1080WLiquidGrass extends StatefulWidget {
  const JackpotDisplayScreenSlideAnimationLedHD1920x1080WLiquidGrass({super.key});

  @override
  State<JackpotDisplayScreenSlideAnimationLedHD1920x1080WLiquidGrass> createState() => _JackpotDisplayScreenSlideAnimationLedHD1920x1080WLiquidGrassState();
}

class _JackpotDisplayScreenSlideAnimationLedHD1920x1080WLiquidGrassState extends State<JackpotDisplayScreenSlideAnimationLedHD1920x1080WLiquidGrass> {
  final SettingsService settingsService = SettingsService();
  late Future<Map<String, double>> _hiveValuesFuture;

  @override
  void initState() {
    super.initState();
    // Fetch Hive data once on initialization
    _hiveValuesFuture = JackpotHiveService().getJackpotHistory().then((state) => state.first );
    debugPrint('getJackpotHistory INitstate: ${_hiveValuesFuture}');
  }

  @override
  Widget build(BuildContext context) {
    return
    FutureBuilder<Map<String, double>>(
      future: _hiveValuesFuture,
      builder: (context, snapshot) {
        Map<String, double> hiveValues = {};
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          hiveValues = snapshot.data!;
        } else if (snapshot.hasError) {
          debugPrint('Error loading Hive data: ${snapshot.error}');
        }

        return BlocBuilder<VideoBloc, ViddeoState>(
          buildWhen: (previous, current) => previous.id != current.id,
          builder: (context, state) {
            return BlocBuilder<JackpotPriceBloc, JackpotPriceState>(
              buildWhen: (previous, current) =>
                  previous.isConnected != current.isConnected ||
                  previous.error != current.error ||
                  previous.jackpotValues != current.jackpotValues ||
                  previous.previousJackpotValues != current.previousJackpotValues,
              builder: (context, priceState) {
                return Center(
                  child: priceState.isConnected
                      ?  SizedBox(
                          width: ConfigCustom.fixWidth_HD_led_curved,
                          height: ConfigCustom.fixWidth_HD_led_curved,
                          child: RepaintBoundary(child: screenLedStairSLIDEANIMATIONWLiquidGrass(context, hiveValues,priceState.previousJackpotValues,priceState.jackpotValues)),
                        )
                      :
                      priceState.error != null ? Container() : circularProgessCustom()
                );
               
              },
            );
          },
        );
      },
    );
  }
}
