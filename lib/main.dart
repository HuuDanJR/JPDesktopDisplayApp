import 'dart:async';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/grass_liquid.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/test/background_view_page.dart';
import 'package:playtech_transmitter_app/SlideAnimation/LiquidGrassScreen/grassliquid_data_page.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/test/grassliquid_listview.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/test/version/grassliquid_view_page.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/version/liquidGrassExample.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_video_bg_page_no_delay.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/jackpot_video_BGPage_NoDelayNoFrame.dart';
import 'package:playtech_transmitter_app/service/hive_service/jackpot_hive_service.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc_jp_price/main/jackpot_price_bloc.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc_socket_time/jackpot_bloc_socket.dart';
import 'package:playtech_transmitter_app/service/jackpot_config_service.dart';
import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_hit_page_hdled_1920x1080.dart';
import 'package:window_manager/window_manager.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';
import 'package:playtech_transmitter_app/screen/background_screen/bloc/video_bloc.dart';
import 'package:media_kit/media_kit.dart';


// import 'package:hive/hive.dart' as hive;
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_SlideAnimation1920x1080.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_page.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_page_1080x1920_lobby.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_page_5200x1664Floor3Mega.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_page__hd_1920x1080_RL_FLOOR2.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_page_hd_led_1920x1080.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_video_bg_page.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_asset_config.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_hit_page_custom_hdled_1920x1080_TRIPLEDAILY.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_hit_page_hdled_1920x1080Floor2.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_hit_page_hdled_2080x1560.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_hit_page_hdled_2496_624_VMS.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_hit_page_led_1920x1080LedRLFloor2.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_hit_page_led_5200x1664Floor3Mega.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_hit_page_led_5200x1664Floor3Mega_BACK.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_hit_page_led_5200x1664Floor3Mega_No_BG.dart';
// import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_video_bghit_page_hd_led_1920x1080_VMS.dart';
// import 'package:playtech_transmitter_app/SlideAnimation/version/InfiniteSlideMarquee.dart';
// import 'screen/background_screen/page_hit/jackpot_video_bghit_page_hd_led_1920x1080_stair_F.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await JackpotConfigService().initialize();
  MediaKit.ensureInitialized();

  // Load Hive BEFORE everything
  final hiveService = JackpotHiveService();
  await Hive.initFlutter();
  await hiveService.initHive();
  // Pre-load the latest values so they are ready instantly
  // await hiveService.getJackpotHistory(); // triggers caching

  await windowManager.ensureInitialized();
  await windowManager.setFullScreen(true);

  await Window.initialize();
  await Window.setWindowBackgroundColorToClear();

  runApp(Phoenix(child: const MyApp()));

  doWhenWindowReady(() {
    appWindow
      ..size = const Size(
        // ConfigCustom.fixWidth, //LED WINGS 
        // ConfigCustom.fixHeight, //LED WINGS
        // ConfigCustom.fixWidth_table,
        // ConfigCustom.fixHeight_table
        // ConfigCustom.fixWidth_led_vms,
        // ConfigCustom.fixHeight_led_vms
        // ConfigCustom.fixWidth_HD_led_lobby,
        // ConfigCustom.fixHeight_HD_led_lobby

        ConfigCustom.fixWidth_HD_led_stair,
        ConfigCustom.fixHeight_HD_led_stair,

        // ConfigCustom.fixWidth_HD_led_RL_Floor2,
        // ConfigCustom.fixHeight_HD_led_RL_Floor2,

        // ConfigCustom.fixWidth_HD_led_Floor3MegaBack,
        // ConfigCustom.fixHeight_HD_led_Floor3MegaBack,
       



        // ConfigCustom.fixWidth_ledFloor3Mega,
        // ConfigCustom.fixHeight_ledFloor3Mega,
      )
      // ..alignment = Alignment.center
      // ..minimize()
      // ..maximizeOrRestore()
      // ..startDragging()
      // ..title = 'App Build All'
      ..show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
      home: const MyAppBody(),
    );
  }
}

class MyAppBody extends StatefulWidget {
  const MyAppBody({super.key});
  @override
  MyAppBodyState createState() => MyAppBodyState();
}

class MyAppBodyState extends State<MyAppBody> with WindowListener {
  Timer? _restartTimer;
  // WindowEffect effect = WindowEffect.transparent;
  WindowEffect effect = WindowEffect.aero;


  @override
  void initState() {
    super.initState();
    Window.setEffect(
      // effect: WindowEffect.selection,
      effect: WindowEffect.transparent,
      color: Colors.transparent,
      dark: false,
    );
    _initWindowManager();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    _restartTimer?.cancel();
    super.dispose();
  }

  Future<void> _initWindowManager() async {
    await windowManager.setPreventClose(true);
    await windowManager.setBackgroundColor(Colors.transparent);
    setState(() {});
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose && mounted) {

    }
  }

  void _restartApp() {
    final start = DateTime.now();
    Phoenix.rebirth(context);
    final end = DateTime.now();
    debugPrint('----------------------------------------------------------------------');
    debugPrint('RESTART ACTION TAKE: ${end.difference(start).inMilliseconds}ms');
    debugPrint('----------------------------------------------------------------------');

  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => JackpotBloc2(), lazy: false),
        BlocProvider(create: (context) => JackpotPriceBloc(), lazy: false),
        BlocProvider(
          create: (context) => VideoBloc(
            videoBg: ConfigCustom.videoBackgroundScreenLedFloor2,
            context: context,
          ),
          lazy: false,
        ),
      ],
      child: BlocListener<VideoBloc, ViddeoState>(
        listener: (context, state) {
          // Cancel any pending timers or futures if applicable
          if (state.isRestart) {
                debugPrint( 'RESTART APP VIA BLOCLISTENER');
                context.read<JackpotPriceBloc>().close();
                _restartApp();
          }
        },
        child:
        // LiquidGlassProfileScreen()
        // Scaffold(
        //   body:GrassLiquidDataPage()
        //   // body:LiquidGlassPage()
        // )
        

        
          const Scaffold(
          backgroundColor: Colors.transparent,
          body:  Stack(
            alignment: Alignment.center,
            children: [

              //Slide Animation New Version 
              // RepaintBoundary(child:JackpotDisplayScreenSlideAnimationLedHD1920x1080()),

              // Container(width:width, height:200,
              //   color:Colors.blueGrey,
              //   child: InfiniteSlideMarquee(child: Container(height:50,width:50,color:Colors.red))
              // ),
              //SLide Animation New Version (End)


              // //Video BG Non-Stop 
              // RepaintBoundary(child: JackpotBackgroundShowNoDelay()), // WORK WELL MUST FOR MAINTAIN BACKGROUND STABLE 
              // //Video BG Non-Stop (End)


              //WORK FOR LIQUID GRASS 
              RepaintBoundary(child: GrassLiquidDataPage()), // WORK WELL MUST FOR MAINTAIN BACKGROUND STABLE 
              //Video BG Non-Stop (End)W LIQUIDGRASS


              // RepaintBoundary(child: JackpotDisplayScreenLedLobbyHD1080x1920()), //NO BACKGROUND 
              // RepaintBoundary(child: JackpotDisplayScreenLedRLFloor2HD()), //NO BACKGROUND RL FLOOR2 NEW 
              // RepaintBoundary(child: JackpotDisplayScreen()), //NO BACKGROUND RL FLOOR2 NEW 

              // RepaintBoundary(child:JackpotDisplayScreen5200x1664LedMega()),
              // RepaintBoundary(child: JackpotHitShowScreenHdLed1920x1080Floor2()),
              // RepaintBoundary(child: JackpotHitShowScreenHdLed1920x1080()),


              // RepaintBoundary(child: JackpotHitShowScreen5200x1664Led3MegaNoBG()), //CURRENT LED FLOOR3 
              // RepaintBoundary(child: JackpotHitShowScreen1920x1080LedRLFloor2()), //LED RL FLoor2 NEW                           


              //HIT PAGE 
              // RepaintBoundary(child: JackpotHitShowScreenCustomHdLed1920x1080TripleDaily()), //LED CUSTOM ONLY 2 PRICES TRIPLE & DAILY
              // RepaintBoundary(child: JackpotHitShowScreen5200x1664Led3MegaBACK()), //LED CUSTOM ONLY 2 PRICES TRIPLE & DAILY
              // RepaintBoundary(child: JackpotHitShowScreen5200x1664Led3Mega()), //LED CUSTOM ONLY 2 PRICES TRIPLE & DAILY
              //  RepaintBoundary(child: JackpotHitShowScreen5200x1664Led3MegaNoBG()), //LED MEGA FLOOR 3 NO BACKGROUND VIDEO HIT 



              RepaintBoundary(child: JackpotHitShowScreenHdLed1920x1080()),  //CURRENT FOR ALL HD HIT




              // JackpotConfigPageView()
              // RepaintBoundary(child: JackpotHitShowScreenCustomHdLed1920x1080TripleDaily()), //CUSTOM TRIPLE DAILY SHOW HIT 
              

              // RepaintBoundary(child: JackpotHitShowScreenHdLedWings()), //LED WINGS SHOW HIT
              // RepaintBoundary(child: JackpotHitShowScreen2496x624VMS()), //LED VMS SHOW HIT

                           
              //  RepaintBoundary(child: JackpotHitShowScreen1920x1080LedRLFloor2()), //LED RL FLoor2 NEW 
              // RepaintBoundary(child: JackpotHitShowScreenHdLed1920x1080Floor2()),//LED BANKEND FLOOR 2 

            ],
          ),
        )

      ),
    );
  }
}
