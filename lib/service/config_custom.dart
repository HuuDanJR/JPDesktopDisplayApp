class ConfigCustom {

  // static const String endpointSocketMain = 'ws://192.168.101.58:8105';//TEST
  static const String endpointSocketMain = 'ws://192.168.101.58:8103';

  static const double fixWidth= 2080;//LEDWINGS SCREEN
  static const double fixHeight= 1560;//LEDWINGS SCREEN

  static const double fixWidth_led_vms= 2496; //LED VMS
  static const double fixHeight_led_vms= 624;//LED VMS


  static const double fixWidth_HD_led_stair= 1920; //LED VMS
  static const double fixHeight_HD_led_stair= 1080;//LED VMS
  
  static const double fixWidth_HD_led_lobby= 1080; //LED LOBBY
  static const double fixHeight_HD_led_lobby= 1920;//LED LOBBY


  // static const double fixWidth_HD_led_RL_Floor2= 3360; //LED LOBBY
  // static const double fixHeight_HD_led_RL_Floor2= 1350;//LED LOBBY
  static const double fixWidth_HD_led_RL_Floor2= 1920; //LED LOBBY
  static const double fixHeight_HD_led_RL_Floor2= 1080;//LED LOBBY

  // static const double fixWidth_HD_led_Floor3MegaBack= 1920; //LED FLOOR 3 MEGA BACK
  // static const double fixHeight_HD_led_Floor3MegaBack= 1080;//LED FLOOR 3 MEGA BACK
  static const double fixWidth_HD_led_Floor3MegaBack= 3360; //LED FLOOR 3 MEGA BACK
  static const double fixHeight_HD_led_Floor3MegaBack= 1350;//LED FLOOR 3 MEGA BACK


  static const double fixWidth_ledFloor3Mega= 5200; //LED F3
  static const double fixHeight_ledFloor3Mega= 1664;//LED F3

  static const double fixWidth_HD_led_curved= 1920; //LED VMS
  static const double fixHeight_HD_led_curved= 1080;//LED VMS

  static const double fixWidth_table= 1872; //TABLE Bc
  static const double fixHeight_table= 2600;//TABLE BC
  static const double fixWidthContent_table = 1872;//TABLE BC
  static const double fixHeightContent_table = 270;//TABLE BC
  static const double fixTopPositionHeight_table = 815;//TABLE BC

  static const int durationSwitchVideoSecond = 30; //swich video 1 and video background 2 after every 2min
  static const  double durationFinishCircleSpinNumberDouble = 30.0; // 29.5 seconds
  static const int dataFreshnessInterval = 30; //to check hasData or noData after 30s
  static const int durationGetDataToBloc = 1;
  static const int durationGetDataToBlocFirstMS = 100;
  static const int switchBetweeScreenDuration = 22;
  static const int switchBetweeScreenDurationForHitScreen = 0;
  static const int durationTimerVideoHitShow_Jackpot = 30; //show video hit for 30
  static const int durationTimerVideoHitShow_Hotseat = 20; //show video hit for 30
  static const int secondToReConnect = 30;


  static const int totalCountToRestart = 170; //90 current is 45min    , 150 is 1h15min , 1h25 min = 170       //1 count will be 30s | 1HOUR will be 1H
  // static const int totalCountToRestart = 150; //90 current is 45min    , 150 is 1h15min        //1 count will be 30s | 1HOUR will be 1H
    // static const int totalCountToRestart = 110; //50min LOBBY ONLY current is 45min    , 150 is 1h15min        //1 count will be 30s | 1HOUR will be 1H


  static const int additionSeconds = 0 ; //default to use in video bloc
  static int? firstDataTimeSeconds; // Store first data time from JackpotPriceBloc
  static const int maxTimeToStartAnDecimalAnimationMs = 5000;


  // Reset values
  static const double resetFrequentJP = 300.0;
  static const double resetDailyJP = 5000.0;
  static const double resetDailyGoldenJP = 10000.0;
  static const double resetDozenJP = 20000.0;
  static const double resetWeeklyJP = 50000.0;
  static const double resetHighLimitJP = 10000.0;
  static const double resetHighLimitJPNEW = 70000.0;//New Update
  static const double resetTripleJP = 30000.0;
  static const double resetMonthlyJP = 105000.0;
  static const double resetVegasJP = 100000.0;
  static const double resetVegasSpinJP = 25000.0; // ROULETTE PRICE 
  static const double resetGrandSpinJP = 5000.0; // ROULETTE PRICE
  static const double resetMajorSpinJP = 720.0; //ROULETTE PRICE


  // Levels
  static const int levelFrequent = 0;
  static const int levelDaily = 1;
  static const int levelDailyGolden = 34;
  static const int levelDozen = 2;
  static const int levelWeekly = 3;
  static const int levelHighLimit = 45;
  static const int levelHighLimitNEW = 48; //New update
  static const int levelTriple = 35;
  static const int levelMonthly = 46;
  static const int levelVegas = 4;
  static const int level7771st = 80;
  static const int level7771stAlt = 81;
  static const int level10001st = 88;
  static const int level10001stAlt = 89;
  static const int levelPpochiMonFri = 97;
  static const int levelPpochiMonFriAlt = 98;
  static const int levelRlPpochi = 109;
  static const int levelNew20Ppochi = 119;
  static const int levelVegasSpinJP = 43;
  static const int levelGrandSpinJP = 40;
  static const int levelMajorSpinJP = 41;
  

  // Jackpot names
  static const String tagFrequent = 'Frequent';
  static const String tagDaily = 'Daily';
  static const String tagDailyGolden = 'DailyGolden';
  static const String tagDailyGolden2 = 'Daily Golden';

  static const String tagDozen = 'Dozen';
  static const String tagWeekly = 'Weekly';
  static const String tagHighLimit = 'HighLimit';
  static const String tagHighLimit2 = 'High Limit';
  static const String tagHighLimitNEW = 'HighLimitNew';
  static const String tagHighLimitNEW2= 'High Limit';


  static const String tagTriple = 'Triple';
  static const String tagMonthly = 'Monthly';
  static const String tagVegas = 'Vegas';

  static const String tagVegasSpinJP = 'VegasSpinJP';
  static const String tagGrandSpinJP = 'GranSpinJP';
  static const String tagMajorSpinJP = 'MajorSpinJP';
  //RL Spin
  static const String tagVegasSpinJP2 = 'Vegas Spin JP';
  static const String tagGrandSpinJP2 = 'Gran Spin JP';
  static const String tagMajorSpinJP2 = 'Major Spin JP';
  


  static const String tag7771st = '7771st';
  static const String tag10001st = '10001st';
  static const String tagPpochiMonFri = 'PpochiMonFri';
  static const String tagRlPpochi = 'RlPpochi';
  static const String tagNew20Ppochi = 'New20Ppochi';



  static const  String  videoBackgroundScreen1 = 'asset/video/video_background.mp4';
  static const  String  videoBackgroundScreen2 = 'asset/video/video_background2.mp4';
  //LED WINGS
  static const  String  videoBackgroundScreenLedWingAll = 'asset/video/led_wings/background/background.mp4';
  static const  String  videoBackgroundScreenFull = 'asset/video/videobackgroundFull.mp4';

  static const  String  videoHitScreenLedWingsAll = 'asset/video/led_wings/hit/hit.mp4';


  //LED LOBBYS
  static const  String  videoBackgroundLedLobby = 'asset/video/led_lobby/background_lobby.mp4';
  //LED LOBBYS 


  //LED RL FLOOR 2 
  static const  String  videoBackgroundLedRLFLOOR2  = 'asset/video/led_rl_floor2/background.mp4';
  static const  String  videoHITLedRLFLOOR2  = 'asset/video/led_rl_floor2/hit.mp4';
  //LED RL FlOOR 2  

  //LED CUSTOM TRIPPLE & DAILY
  static const  String  videoBackgroundLedCustomTrippleDaily = 'asset/video/led_custom_tripledaily/background.mp4';
  //LED CUSTOM TRIPPLE & DAILY

  //LED CUSTOM TRIPPLE & DAILY
  static const  String  videoBackgroundLedFloor3Mega_Back = 'asset/video/led_floor3_mega_back/background2.mov';
  //LED CUSTOM TRIPPLE & DAILY
  //LED LED FLOOR 2 
  static const  String  videoBackgroundScreenLedFloor2 = 'asset/video/led_floor2/background.mp4';
  static const  String  videoBackgroundHDNoContainerBorder = 'asset/video/videobackgroundNoContainer.mp4';

  static const  String  videoHitScreenLedFloor2 = 'asset/video/led_floor2/hit.mp4';

  //LED LED FLOOR 3 MEGA 
  static const  String  videoBackgroundScreenLedFloor3Mega = '';
  static const  String  videoHitScreenLedFloor3Mega = 'asset/video/led_floor3_mega/hit_360.mp4';

  //LED VMS
  static const  String  videoBackgroundScreenLedVMS_2496x264 = 'asset/video/led_vms_2496x264/background/background_vms.mp4';
  static const  String  videoHITScreenLedVMS_2496x264 = 'asset/video/led_vms_2496x264/hit/hit.mp4';
  //LED HD Stair
  static const  String  videoBackgroundScreenLedStair_1920x1080 = 'asset/video/led_stair/background.mp4';
  static const  String  videoHitScreenLedStair_1920x1080 = 'asset/video/led_stair/hit.mp4';

  //LED HD Curved
  static const  String  videoBackgroundScreenLedCurved_1920x1080 = 'asset/video/led_curved/background.mp4';
  static const  String  videoHitScreenLedCurved_1920x1080 = 'asset/video/led_curved/hit.mp4';

  //LED HD MarX
  static const  String  videoBackgroundScreenLedMARX_1920x1080 = 'asset/video/led_marx/background.mp4';
  static const  String  videoHitScreenLedMARX_1920x1080 = 'asset/video/led_curved/hit.mp4';
  //LED HD ATM
  static const  String  videoBackgroundScreenLedATM_1920x1080 = 'asset/video/led_atm/background.mp4';
  static const  String  videoHitScreenLedATM_1920x1080 = 'asset/video/led_curved/hit.mp4';

  //LED HD NON-SMOKING
  static const  String  videoBackgroundScreenLedNon_Smoke_1920x1080 = 'asset/video/led_non_smoke/background.mp4';
  static const String  videoHitScreenLedNon_Smoke_1920x1080 = 'asset/video/led_non_smoke/hit.mp4';


  //COUNT DOWN
  static const String videoCountDown = 'asset/video/count_down/hit_countdown_led.mp4';
  static const String videoCountDownHD =     'asset/video/led_wings/countdown/countdown.mpg';
  static const String videoCountDownVMS = 'asset/video/count_down/hit_countdown_led_vms.mp4';
  static const String videoCountDownNonSmoke='asset/video/count_down/hit_countdown_led.mp4';
  static const String videoCountDownLedWings = 'asset/video/led_wings/countdown/countdown.mpg';
  static const String videoCountDownFloor2 = 'asset/video/led_floor2/countdown.mp4';
  static const String videoCountDownFloorHDFullCustomtripleDaily = 'asset/video/led_custom_tripledaily/jackpots/countdown.mpg';



  static const int duration_fade_animate_screen_switch_ms = 250;
  static const int duration_fade_animate_hit_jp_ms = 250;
  static const int duration_show_video_background_second = 30;
  static const int duration_show_video_background_jackpot_second = 30;
  static const int duration_show_video_background_hotseat_second = 30;

  static const String font_family = 'sf-pro-display';
  static const double text_hit_price_offset_dx = 0.0;
  static const double text_hit_price_offset_dy = 3.0;
  static const double text_hit_price_blur_radius = 4.0;



 //1560x2080
  static const double text_odo_size_small = 105.5;
  static const double text_odo_size = 58.5;
  static const double text_odo_letter_width = 33.5;
  static const double text_odo_letter_vertical_offset = 52;
  static const double odo_position_top = 13;
  static const double odo_height = 58.5;
 //1560x2080  SMALL
  static const double text_odo_letter_width_small = 32.5;
  static const double text_odo_letter_vertical_offset_small = 47;
  static const double odo_position_top_small = 19;
  static const double odo_height_small = 53;
  static const double text_hit_price_size = 125.0;
  static const double text_hit_price_dX= 1225.0;
  static const double text_hit_price_dY = 320.0;
  static const double text_hit_number_size = 65.0;
  static const double text_hit_number_dX = 815.5;
  static const double text_hit_number_dY = 385.5;



  //2496x624 LED VMS version
  static const double odo_height_2496x6244= 62.15;
  static const double text_odo_size_2496x624= 65.75;
  static const double text_odo_letter_width_2496x624 = 35;
  static const double text_odo_letter_vertical_offset_2496x624 = 57.75;
  static const double odo_position_top_2496x624 = 20.55;
  //2496x624 LED VMS version
  static const double odo_height_2496x6244_small= 54.5;
  static const double text_odo_size_2496x624_small= 54;
  static const double text_odo_letter_width_2496x6244_small= 32.5;
  static const double text_odo_letter_vertical_offset_2496x6244_small= 48;
  static const double odo_position_top_2496x6244_small= 13.15;




  //1560x2080
  static const double jp_frequent_screen_dX = -265;
  static const double jp_frequent_screen_dY = 529;
  static const double jp_daily_screen_dX = 478;
  static const double jp_daily_screen_dY = 529;
  static const double jp_dailygolden_screen_dX = -190.0;
  static const double jp_dailygolden_screen_dY = 529;
  static const double jp_dozen_screen_dX =  -260;
  static const double jp_dozen_screen_dY = 376;

  static const double jp_tripple_screen_dX = 560;
  static const double jp_tripple_screen_dY = 376;
   static const double jp_weekly_screen_dX = -188.0;
  static const double jp_weekly_screen_dY = 376;


  static const double jp_highlimit_screen_dX =-260;
  static const double jp_highlimit_screen_dY = 223;
  static const double jp_monthly_screen_dX = 487;
  static const double jp_monthly_screen_dY = 223;
  static const double jp_vegas_screen_dX = -188.0;
  static const double jp_vegas_screen_dY = 223;
  // tic const double jp_frequent_screen_dX = -265;
  // static const double jp_frequent_screen_dY = 529;
  // static const double jp_daily_screen_dX = 478;
  // static const double jp_daily_screen_dY = 529;
  // static const double jp_dailygolden_screen_dX = -190.0;
  // static const double jp_dailygolden_screen_dY = 529;
  // static const double jp_dozen_screen_dX = 482;
  // static const double jp_dozen_screen_dY = 377;
  // static const double jp_highlimit_screen_dX =-260;
  // static const double jp_highlimit_screen_dY = 377;
  // static const double jp_tripple_screen_dX = -185.0;
  // static const double jp_tripple_screen_dY = 377;
  //  static const double jp_weekly_screen_dX = -260;
  // static const double jp_weekly_screen_dY = 224;
  // static const double jp_monthly_screen_dX = 487;
  // static const double jp_monthly_screen_dY = 224;
  // static const double jp_vegas_screen_dX = -188.0;
  // static const double jp_vegas_screen_dY = 224;



  //LED STAIR 1920x1080
  static const double jp_dozen_screen_dX_ledstair = 810.5;
  static const double jp_dozen_screen_dY_ledstair = 46;
  static const double jp_tripple_screen_dX_ledstair = 571.5;
  static const double jp_tripple_screen_dY_ledstair = 46;
  static const double jp_weekly_screen_dX_ledstair = 330;
  static const double jp_weekly_screen_dY_ledstair = 46;
  static const double jp_monthly_screen_dX_ledstair = 53;
  static const double jp_monthly_screen_dY_ledstair = 46;
  static const double jp_vegas_screen_dX_ledstair = -250;
  static const double jp_vegas_screen_dY_ledstair = 46;
  
  //LED STAIR SLIDE ANIMATION VERSION 1920x1080

  static const double jp_vegas_screen_dX_ledstairSlideAnimation2 = 4340;
  static const double jp_vegas_screen_dY_ledstairSlideAnimation2 = 45;
  static const double jp_monthly_screen_dX_ledstairSlideAnimation2 = 4080;
  static const double jp_monthly_screen_dY_ledstairSlideAnimation2 = 45;
  static const double jp_highlimit_screen_dX_ledstairSlideAnimation2 = 3820;
  static const double jp_highlimit_screen_dY_ledstairSlideAnimation2 = 45;
  static const double jp_weekly_screen_dX_ledstairSlideAnimation2 = 3560;
  static const double jp_weekly_screen_dY_ledstairSlideAnimation2 = 45;
  static const double jp_triple_screen_dX_ledstairSlideAnimation2 = 3300;
  static const double jp_triple_screen_dY_ledstairSlideAnimation2 = 45;
  static const double jp_dozen_screen_dX_ledstairSlideAnimation2 = 3140;
  static const double jp_dozen_screen_dY_ledstairSlideAnimation2 = 45;
  static const double jp_dailygolden_screen_dX_ledstairSlideAnimation2 = 2880;
  static const double jp_dailygolden_screen_dY_ledstairSlideAnimation2 = 45;
  static const double jp_daily_screen_dX_ledstairSlideAnimation2 = 2620;
  static const double jp_daily_screen_dY_ledstairSlideAnimation2 = 45;
  static const double jp_frequent_screen_dX_ledstairSlideAnimation2 = 2360;
  static const double jp_frequent_screen_dY_ledstairSlideAnimation2 = 45;

  static const double jp_vegas_screen_dX_ledstairSlideAnimation = 2100;
  static const double jp_vegas_screen_dY_ledstairSlideAnimation = 45;
  static const double jp_monthly_screen_dX_ledstairSlideAnimation = 1840;
  static const double jp_monthly_screen_dY_ledstairSlideAnimation = 45;
  static const double jp_highlimit_screen_dX_ledstairSlideAnimation = 1580;
  static const double jp_highlimit_screen_dY_ledstairSlideAnimation = 45;
  static const double jp_weekly_screen_dX_ledstairSlideAnimation = 1320;
  static const double jp_weekly_screen_dY_ledstairSlideAnimation = 45;
  static const double jp_triple_screen_dX_ledstairSlideAnimation = 1060;
  static const double jp_triple_screen_dY_ledstairSlideAnimation = 45;
  static const double jp_dozen_screen_dX_ledstairSlideAnimation = 800;
  static const double jp_dozen_screen_dY_ledstairSlideAnimation = 45;
  static const double jp_dailygolden_screen_dX_ledstairSlideAnimation = 540;
  static const double jp_dailygolden_screen_dY_ledstairSlideAnimation = 45;
  static const double jp_daily_screen_dX_ledstairSlideAnimation = 280;
  static const double jp_daily_screen_dY_ledstairSlideAnimation = 45;
  static const double jp_frequent_screen_dX_ledstairSlideAnimation = 20;
  static const double jp_frequent_screen_dY_ledstairSlideAnimation = 45;
  //LED STAIR SLIDE ANIMATION VERSION 1920x1080



  //LED LOBBY 1080x1920
  static const double jp_daily_screen_dX_ledLobby = -20;
  static const double jp_daily_screen_dY_ledLobby = 1663;
  static const double jp_dailygolden_screen_dX_ledLobby = -18;
  static const double jp_dailygolden_screen_dY_ledLobby = 1415;
  static const double jp_highlimit_screen_dX_ledLobby = -18;
  static const double jp_highlimit_screen_dY_ledLobby = 1267;
  static const double jp_dozen_screen_dX_ledLobby = -10;
  static const double jp_dozen_screen_dY_ledLobby = 1165;
  static const double jp_tripple_screen_dX_ledLobby = -10;
  static const double jp_tripple_screen_dY_ledLobby = 915;
  static const double jp_weekly_screen_dX_ledLobby = -12;
  static const double jp_weekly_screen_dY_ledLobby = 665;
  static const double jp_monthly_screen_dX_ledLobby = -18;
  static const double jp_monthly_screen_dY_ledLobby = 413;
  static const double jp_vegas_screen_dX_ledLobby = -18;
  static const double jp_vegas_screen_dY_ledLobby = 164;
  //END LED LOBBY 1080x1920






  //LED MARX 1920x1080: MARX
  static const double jp_daily_screen_dX_ledMarX = 535;
  static const double jp_daily_screen_dY_ledMarX = 175;
  static const double jp_dailygolden_screen_dX_ledMarX = 210;
  static const double jp_dailygolden_screen_dY_ledMarX = 175;
  static const double jp_dozen_screen_dX_ledMarX = -60;
  static const double jp_dozen_screen_dY_ledMarX = 175;
  static const double jp_tripple_screen_dX_ledMarX = -360;
  static const double jp_tripple_screen_dY_ledMarX = 175;
  static const double jp_weekly_screen_dX_ledMarX = 625;
  static const double jp_weekly_screen_dY_ledMarX = 48.5;
  static const double jp_monthly_screen_dX_ledMarX = 215;
  static const double jp_monthly_screen_dY_ledMarX = 48.5;
  static const double jp_vegas_screen_dX_ledMarX = -220;
  static const double jp_vegas_screen_dY_ledMarX = 48.5;

  
  //LED MARX 1920x1080: MARX NEW NEW 
  static const double jp_dozen_screen_dX_ledMarXNEW = -320;
  static const double jp_dozen_screen_dY_ledMarXNEW = 175;
  static const double jp_dailygolden_screen_dX_ledMarXNEW = -45;
  static const double jp_dailygolden_screen_dY_ledMarXNEW = 175;
  static const double jp_daily_screen_dX_ledMarXNEW = 232;
  static const double jp_daily_screen_dY_ledMarXNEW = 175;
  static const double jp_frequent_screen_dX_ledMarXNEW = 507;
  static const double jp_frequent_screen_dY_ledMarXNEW = 175;

  static const double jp_tripple_screen_dX_ledMarXNEW = 675;
  static const double jp_tripple_screen_dY_ledMarXNEW = 48.5;
  static const double jp_weekly_screen_dX_ledMarXNEW = 400;
  static const double jp_weekly_screen_dY_ledMarXNEW = 48.5;
  static const double jp_monthly_screen_dX_ledMarXNEW = 100;
  static const double jp_monthly_screen_dY_ledMarXNEW = 48.5;
  static const double jp_vegas_screen_dX_ledMarXNEW = -220;
  static const double jp_vegas_screen_dY_ledMarXNEW = 48.5;

  //LED MARX 1920x1080: NON-SMOKE
  static const double jp_tripple_screen_dX_ledNon_Smoke = 272;
  static const double jp_tripple_screen_dY_ledNon_Smoke = 276;
  static const double jp_weekly_screen_dX_ledNon_Smoke = -253;
  static const double jp_weekly_screen_dY_ledNon_Smoke = 276;
  static const double jp_monthly_screen_dX_ledNon_Smoke = 435;
  static const double jp_monthly_screen_dY_ledNon_Smoke = 66.5;
  static const double jp_vegas_screen_dX_ledNon_Smoke = -145;
  static const double jp_vegas_screen_dY_ledNon_Smoke = 66.5;



  //LED ATM 1920x1080: ATM
  static const double jp_dailygolden_screen_dX_ledATM = 370;
  static const double jp_dailygolden_screen_dY_ledATM = 175;
  static const double jp_dozen_screen_dX_ledATM = 50;
  static const double jp_dozen_screen_dY_ledATM = 175;
  static const double jp_tripple_screen_dX_ledATM = -280;
  static const double jp_tripple_screen_dY_ledATM = 175;
  static const double jp_weekly_screen_dX_ledATM = 560;
  static const double jp_weekly_screen_dY_ledATM = 48.5;
  static const double jp_monthly_screen_dX_ledATM = 200;
  static const double jp_monthly_screen_dY_ledATM = 48.5;
  static const double jp_vegas_screen_dX_ledATM = -170;
  static const double jp_vegas_screen_dY_ledATM = 48.5;



  //LED CURVED PRICED : 1920x1080 
  static const double jp_dailygolden_screen_dX_ledCurved = 250;
  static const double jp_dailygolden_screen_dY_ledCurved = 175;
  static const double jp_dozen_screen_dX_ledCurved = -60;
  static const double jp_dozen_screen_dY_ledCurved = 175;
  static const double jp_tripple_screen_dX_ledCurved = -360;
  static const double jp_tripple_screen_dY_ledCurved = 175;

  static const double jp_weekly_screen_dX_ledCurved = 590;
  static const double jp_weekly_screen_dY_ledCurved = 48.5;
  static const double jp_monthly_screen_dX_ledCurved = 225;
  static const double jp_monthly_screen_dY_ledCurved = 48.5;
  static const double jp_vegas_screen_dX_ledCurved = -165;
  static const double jp_vegas_screen_dY_ledCurved = 48.5;

 //LED HD Stair 1920x1080
  static const double odo_height_1920x1080= 55;
  static const double text_odo_size_1920x1080= 47;
  static const double text_odo_letter_width_1920x1080 = 24;
  static const double text_odo_letter_vertical_offset_1920x1080= 47.1;
  static const double odo_position_top_1920x1080= 10.75;
  static const double text_hit_price_size_1920x1080 = 60.0;//text
  static const double text_hit_price_dX_1920x1080= 975;
  static const double text_hit_price_dY_1920x1080 = 7.5;
  static const double text_hit_number_size_1920x1080 = 60.0;
  static const double text_hit_number_dX_1920x1080 = 645.0;
  static const double text_hit_number_dY_1920x1080 = 9.5;
  static const double text_hit_number_size_1920x1080_onlyHotSeat = 50.0;
  static const double text_hit_number_dY_1920x1080_only_hotseat = 27.0;
  static const double text_hit_number_dX_1920x1080_only_hotseat = 1202.5;




 //LED HD CURVED 1920x1080: CURVED
  static const double odo_height_1920x1080_curved= 49;
  static const double text_odo_size_1920x1080_curved= 47;
  static const double text_odo_letter_width_1920x1080_curved = 24;
  static const double text_odo_letter_vertical_offset_1920x1080_curved= 44.5;
  static const double odo_position_top_1920x1080_curved= 11.75;
  static const double text_hit_price_size_1920x1080_curved = 60.0;//text
  static const double text_hit_price_dX_1920x1080_curved= 525;
  static const double text_hit_price_dY_1920x1080_curved = 137.5;
  static const double text_hit_number_size_1920x1080_curved = 60.0;
  static const double text_hit_number_dX_1920x1080_curved = 100;
  static const double text_hit_number_dY_1920x1080_curved = 137.5;
  static const double text_hit_number_size_1920x1080_onlyHotSeat_curved = 55.0;
  static const double text_hit_number_dY_1920x1080_only_hotseat_curved =150.0;
  static const double text_hit_number_dX_1920x1080_only_hotseat_curved = 545.5;

 //LED HD NON SMOKING 1920x1080: NON_SMOKING
  static const double odo_height_1920x1080_non_smoke= 83;
  static const double text_odo_size_1920x1080_non_smoke= 84;
  static const double text_odo_letter_width_1920x1080_non_smoke = 47;
  static const double text_odo_letter_vertical_offset_1920x1080_non_smoke= 70;
  static const double odo_position_top_1920x1080_non_smoke= 22;
  static const double text_hit_price_size_1920x1080_non_smoke = 60.0;//text
  static const double text_hit_price_dX_1920x1080_non_smoke= 635;
  static const double text_hit_price_dY_1920x1080_non_smoke = 247;
  static const double text_hit_number_size_1920x1080_non_smoke = 80.0;
  static const double text_hit_number_dX_1920x1080_non_smoke = 55;
  static const double text_hit_number_dY_1920x1080_non_smoke = 247;
  static const double text_hit_number_size_1920x1080_onlyHotSeat_non_smoke = 80.0;
  static const double text_hit_number_dY_1920x1080_only_hotseat_non_smoke =257.0;
  static const double text_hit_number_dX_1920x1080_only_hotseat_non_smoke = 732;


  


  //LED HD FLOOR 2 1920x1080
  // static const double jp_dozen_screen_dX_ledFloor2 = -340;
  // static const double jp_dozen_screen_dY_ledFloor2 = 326.5;
  // static const double jp_tripple_screen_dX_ledFloor2 = -340;
  // static const double jp_tripple_screen_dY_ledFloor2 = 255;
  // static const double jp_highlimit_screen_dX_ledFloor2 = -340;
  // static const double jp_highlimit_screen_dY_ledFloor2 = 255;
  // static const double jp_weekly_screen_dX_ledFloor2 = -340;
  // static const double jp_weekly_screen_dY_ledFloor2 = 183;
  static const double jp_tripple_screen_dX_ledFloor2 = -340;
  static const double jp_tripple_screen_dY_ledFloor2 = 326.5;
  static const double jp_highlimit_screen_dX_ledFloor2 = -340;
  static const double jp_highlimit_screen_dY_ledFloor2 = 183;
  static const double jp_weekly_screen_dX_ledFloor2 = -340;
  static const double jp_weekly_screen_dY_ledFloor2 = 255;
  static const double jp_monthly_screen_dX_ledFloor2 = -340;
  static const double jp_monthly_screen_dY_ledFloor2 = 112;
  static const double jp_vegas_screen_dX_ledFloor2 = -340;
  static const double jp_vegas_screen_dY_ledFloor2 = 40.5;

  static const double odo_height_1920x1080_floor2= 33;
  static const double text_odo_size_1920x1080_floor2= 32.5;
  static const double text_odo_letter_width_1920x1080_floor2 = 20;
  static const double text_odo_letter_vertical_offset_1920x1080_floor2= 30;
  static const double odo_position_top_1920x1080_floor2= 8.5;
  static const double text_hit_price_size_1920x1080_floor2 = 60.0;//text
  static const double text_hit_price_dX_1920x1080_floor2= 80;
  static const double text_hit_price_dY_1920x1080_floor2 = 262;
  static const double text_hit_number_size_1920x1080_floor2 = 35.0;
  static const double text_hit_number_size2_1920x1080_floor2 = 45.0;

  static const double text_hit_number_dX_1920x1080_floor2 = 95;
  static const double text_hit_number_dY_1920x1080_floor2 = 187;
  static const double text_hit_number_size_1920x1080_onlyHotSeat_floor2 = 35.0;
  static const double text_hit_number_dY_1920x1080_only_hotseat_floor2 =257.0;
  static const double text_hit_number_dX_1920x1080_only_hotseat_floor2 = 732;


  //LED LOBBY x 1080x1920
  static const double odo_height_1080x1920_lobby= 120;
  static const double text_odo_size_1080x1920_lobby= 111;
  static const double text_odo_letter_width_1080x1920_lobby = 63.5;
  static const double text_odo_letter_vertical_offset_1080x1920_lobby= 99;
  static const double odo_position_top_1080x1920_lobby= 25.5;
  static const double text_hit_price_size_1080x1920_lobby = 60.0;//text
  static const double text_hit_price_dX_1080x1920_lobby= 80;


  //LED Roulette Floor2 x 1920x1080
  static const double odo_height_1920x1080_RL_floor2= 158;
  static const double text_odo_size_1920x1080_RL_floor2= 148;
  static const double text_odo_letter_width_1920x1080_RL_floor2 = 90;
  static const double text_odo_letter_vertical_offset_1920x1080_RL_floor2= 133;
  static const double odo_position_top_1920x1080_RL_floor2= 33;
  static const double text_hit_price_size_1920x1080_RL_floor2 = 80.0;//text
  static const double text_hit_price_dX_1920x1080_RL_floor2= 50;
 //LED RL FLOOR2 3660x1650
  static const double jp_vegasSpin_screen_dX_ledRLFloor2 = 0;
  static const double jp_vegasSpin_screen_dY_ledRLFloor2 = 156;
  static const double jp_grandSpin_screen_dX_ledRLFloor2 = 0;
  static const double jp_grandSpin_screen_dY_ledRLFloor2 = 458;
  static const double jp_majorSpin_screen_dX_ledRLFloor2 = 0;
  static const double jp_majorSpin_screen_dY_ledRLFloor2 = 757;
  //END LED RL FLOOR2 360x1650


 //LED  CUSTOM TRIPLE DAILY
  static const double jp_triple_screen_dX_ledCustomTRIPLEDAILY = -6.5;
  static const double jp_triple_screen_dY_ledCustomTRIPLEDAILY = 107.5;
  static const double jp_dailygolden_screen_dX_ledCustomTRIPLEDAILY = -6.5;
  static const double jp_dailygolden_screen_dY_ledCustomTRIPLEDAILY = 430;
  static const double jp_frequent_screen_dX_ledCustomTRIPLEDAILY = -6.5;
  static const double jp_frequent_screen_dY_ledCustomTRIPLEDAILY = 740;
  static const double odo_height_1920x1080_ledCustomTRIPLEDAILY= 190;
  static const double text_odo_size_1920x1080_ledCustomTRIPLEDAILY= 182;
  static const double text_odo_letter_width_1920x1080_ledCustomTRIPLEDAILY = 104.5;
  static const double text_odo_letter_vertical_offset_1920x1080_ledCustomTRIPLEDAILY= 157.5;
  static const double odo_position_top_1920x1080_ledCustomTRIPLEDAILY= 43;
  static const double text_hit_price_size_1920x1080_ledCustomTRIPLEDAILY = 150.0;//text
  static const double text_hit_price_dX_1920x1080_ledCustomTRIPLEDAILY= 50;
  static const double text_hit_price_size_1920x1080_CustomTripleDaly = 60.0;//text
  static const double text_hit_price_dX_1920x1080_CustomTripleDaly= 625;
  static const double text_hit_price_dY_1920x1080_CustomTripleDaly = 385;
  static const double text_hit_number_size_1920x1080_CustomTripleDaly = 75.0;
  static const double text_hit_number_dX_1920x1080_CustomTripleDaly = 1625;
  static const double text_hit_number_dY_1920x1080_CustomTripleDaly = 945;
  static const double text_hit_number_size_1920x1080_onlyHotSeat_CustomTripleDaly = 75.0;
  static const double text_hit_number_dY_1920x1080_only_hotseat_CustomTripleDaly =942.0;
  static const double text_hit_number_dX_1920x1080_only_hotseat_CustomTripleDaly = 1675;


  //END LED  CUSTOM TRIPLE DAILY


  //LED HD FLOOR 3 5200x1664
  static const double jp_frequent_screen_dX_ledFloor3Mega = 3650;
  static const double jp_frequent_screen_dY_ledFloor3Mega = 78;
  static const double jp_daily_screen_dX_ledFloor3Mega = 3185;
  static const double jp_daily_screen_dY_ledFloor3Mega = 78;
  static const double jp_dailygolden_screen_dX_ledFloor3Mega = 2625;
  static const double jp_dailygolden_screen_dY_ledFloor3Mega = 78;
  static const double jp_highlimit_screen_dX_ledFloor3Mega = 300;
  static const double jp_highlimit_screen_dY_ledFloor3Mega = 78;
  //   static const double jp_highlimit_screen_dX_ledFloor3Mega = 2050;
  // static const double jp_highlimit_screen_dY_ledFloor3Mega = 78;
  static const double jp_dozen_screen_dX_ledFloor3Mega = 2050;//1485
  static const double jp_dozen_screen_dY_ledFloor3Mega = 78;
  static const double jp_tripple_screen_dX_ledFloor3Mega = 1485;//900
  static const double jp_tripple_screen_dY_ledFloor3Mega = 78;
  static const double jp_weekly_screen_dX_ledFloor3Mega = 900;//300
  static const double jp_weekly_screen_dY_ledFloor3Mega = 78;
  static const double jp_monthly_screen_dX_ledFloor3Mega = -300;
  static const double jp_monthly_screen_dY_ledFloor3Mega = 78;
  static const double jp_vegas_screen_dX_ledFloor3Mega = -950;
  static const double jp_vegas_screen_dY_ledFloor3Mega = 78;
  static const double odo_height_1920x1080_ledFloor3Mega= 85;
  static const double text_odo_size_1920x1080_ledFloor3Mega= 76;
  static const double text_odo_letter_width_1920x1080_ledFloor3Mega = 48;
  static const double text_odo_letter_vertical_offset_1920x1080_ledFloor3Mega= 70;
  static const double odo_position_top_1920x1080_ledFloor3Mega= 16.5;
  static const double text_hit_price_size_1920x1080_ledFloor3Mega = 100.0;//text
  static const double text_hit_price_size_1920x1080_ledFloor3MegaFull = 68.5;//text

  static const double text_hit_price_dX_1920x1080_ledFloor3Mega= 1145;
  static const double text_hit_price_dY_1920x1080_ledFloor3Mega = 60;
  static const double text_hit_number_size_1920x1080_ledFloor3Mega = 26.0;
  static const double text_hit_number_size2_1920x1080_ledFloor3Mega = 100.0;
  static const double text_hit_number_dX_1920x1080_ledFloor3Mega = 760;
  static const double text_hit_number_dY_1920x1080_ledFloor3Mega = 60;
  static const double text_hit_number_size_1920x1080_onlyHotSeat_ledFloor3Mega = 35.0;
  static const double text_hit_number_dY_1920x1080_only_hotseat_ledFloor3Mega =257.0;
  static const double text_hit_number_dX_1920x1080_only_hotseat_ledFloor3Mega = 732;


  
  //LED HD FLOOR 3 BACK 1920x1080
  static const double jp_frequent_screen_dX_ledFloor3MegaBACK = 1000;
  static const double jp_frequent_screen_dY_ledFloor3MegaBACK = 170;
  static const double jp_daily_screen_dX_ledFloor3MegaBACK = 635;
  static const double jp_daily_screen_dY_ledFloor3MegaBACK = 170;
  static const double jp_dailygolden_screen_dX_ledFloor3MegaBACK = 220;
  static const double jp_dailygolden_screen_dY_ledFloor3MegaBACK = 170;
  static const double jp_highlimit_screen_dX_ledFloor3MegaBACK = -175;
  static const double jp_highlimit_screen_dY_ledFloor3MegaBACK = 170;

  static const double jp_dozen_screen_dX_ledFloor3MegaBACK = 1225;
  static const double jp_dozen_screen_dY_ledFloor3MegaBACK = 60;
  static const double jp_tripple_screen_dX_ledFloor3MegaBACK = 825;
  static const double jp_tripple_screen_dY_ledFloor3MegaBACK = 60;
  static const double jp_weekly_screen_dX_ledFloor3MegaBACK = 450;
  static const double jp_weekly_screen_dY_ledFloor3MegaBACK = 60;
  static const double jp_monthly_screen_dX_ledFloor3MegaBACK = 50;
  static const double jp_monthly_screen_dY_ledFloor3MegaBACK = 60;
  static const double jp_vegas_screen_dX_ledFloor3MegaBACK =-365 ;
  static const double jp_vegas_screen_dY_ledFloor3MegaBACK = 60;

  static const double odo_height_1920x1080_ledFloor3MegaBACK= 61;
  static const double text_odo_size_1920x1080_ledFloor3MegaBACK= 53.5;
  static const double text_odo_letter_width_1920x1080_ledFloor3MegaBACK = 33.5;
  static const double text_odo_letter_vertical_offset_1920x1080_ledFloor3MegaBACK= 64;
  static const double odo_position_top_1920x1080_ledFloor3MegaBACK= 8;
  static const double text_hit_price_size_1920x1080_ledFloor3MegaBACK = 55.0;//text
  static const double text_hit_price_size_1920x1080_ledFloor3MegaBACKFull = 55.0;//text

  static const double text_hit_price_dX_1920x1080_ledFloor3MegaBACK= 1145;
  static const double text_hit_price_dY_1920x1080_ledFloor3MegaBACK = 60;
  static const double text_hit_number_size_1920x1080_ledFloor3MegaBACK = 26.0;
  static const double text_hit_number_size2_1920x1080_ledFloor3MegaBACK = 100.0;
  static const double text_hit_number_dX_1920x1080_ledFloor3MegaBACK = 760;
  static const double text_hit_number_dY_1920x1080_ledFloor3MegaBACK = 60;
  static const double text_hit_number_size_1920x1080_onlyHotSeat_ledFloor3MegaBACK = 35.0;
  static const double text_hit_number_dY_1920x1080_only_hotseat_ledFloor3MegaBACK =257.0;
  static const double text_hit_number_dX_1920x1080_only_hotseat_ledFloor3MegaBACK = 732;



  //ATM
  static const double text_hit_price_dX_1920x1080_atm= 530;
  static const double text_hit_price_dY_1920x1080_atm = 144;
  static const double text_hit_number_dY_1920x1080_only_hotseat_atm = 149;
  static const double text_hit_number_dX_1920x1080_only_hotseat_atm = 545.5;
  static const double text_hit_number_dX_1920x1080_atm= 45;
  static const double text_hit_number_dY_1920x1080_atm = 144;







  //2496x624 LED VMS
  static const double jp_frequent_2496x624_dX =1015;
  static const double jp_frequent_2496x624_dY = 246.5;
  static const double jp_daily_2496x624_dX = 640;
  static const double jp_daily_2496x624_dY = 246.5;
  static const double jp_dailygolden_2496x624_dX =975;
  static const double jp_dailygolden_2496x624_dY = 246.5;
  static const double jp_dozen_2496x624_dX = 1385;
  static const double jp_dozen_2496x624_dY = 99;
  static const double jp_tripple_2496x624_dX = 1015;
  static const double jp_tripple_2496x624_dY = 99;
  static const double jp_weekly_2496x624dX = 639;
  static const double jp_weekly_2496x624_dY = 99;
  static const double jp_monthly_2496x624_dX = 266.5;
  static const double jp_monthly_2496x624_dY = 99;
  static const double jp_vegas_2496x624_dX = 1375;
  static const double jp_vegas_2496x624_dY = 99;
  static const double text_hit_price_size_2496x264 = 115.0;//text
  static const double text_hit_price_dX_2496x264= 1355;
  static const double text_hit_price_dY_2496x264 = 110;
  static const double text_hit_number_size_2496x264 = 80.0;
  static const double text_hit_number_dX_2496x264 = 935.0;
  static const double text_hit_number_dY_2496x264 = 148.0;
  static const double text_hit_number_size_2496x264_onlyHotSeat = 55.0;
  static const double text_hit_number_dY_2496x264_only_hotseat =313.5;
  static const double text_hit_number_dX_2496x264_only_hotseat = 1342.0;





 


  //JACKPOT PATH
  static const int jp_id_frequent = 0;
  static const int jp_id_daily = 1;
  static const int jp_id_dailygolden = 34;
  static const int jp_id_dozen = 2;
  static const int jp_id_highlimit = 45;
  static const int jp_id_highlimitNEW = 48;//new update
  static const int jp_id_weekly = 3;
  static const int jp_id_monthly = 46;
  static const int jp_id_vegas = 4;
  static const int jp_id_tripple = 35;
  static const int hotseat_id_777_1st = 80;
  static const int hotseat_id_777_2nd = 81;
  static const int hotseat_id_1000_1st = 88;
  static const int hotseat_id_1000_2nd = 89;
  static const int hotseat_id_ppochi_Mon_Fri = 97;
  static const int hotseat_id_ppochi_Sat_Sun = 98;
  static const int hotseat_id_RL_ppochi = 109;
  static const int hotseat_id_New_20_ppochi = 119;


  static const String jp_id_hit_all = 'asset/video/hit/hit.mp4';
  // static const String jp_id_frequent_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_daily_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_dailygolden_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_dozen_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_weekly_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_highlimit_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_monthly_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_vegas_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_tripple_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_777_1st_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_777_2nd_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_1000_1st_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_1000_2nd_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_ppochi_Mon_Fri_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_ppochi_Sat_Sun_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_RL_ppochi_video_path = 'asset/video/hit/hit.mp4';
  // static const String jp_id_New_20_ppochi_video_path = 'asset/video/hit/hit.mp4';

  //HIT VMS LED 2946x624
  static const String jp_id_hit_all_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_frequent_video_path_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_daily_video_path_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_dailygolden_video_path_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_dozen_video_path_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_weekly_video_path_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_highlimit_video_path_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_monthly_video_path_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_vegas_video_path_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_tripple_video_path_2946x624 = videoHITScreenLedVMS_2496x264;
  static const String jp_id_777_1st_video_path_2946x624 = 'asset/video/led_vms_2496x264/hit/hotseat/triple777.mp4';
  static const String jp_id_777_2nd_video_path_2946x624 = 'asset/video/led_vms_2496x264/hit/hotseat/triple777.mp4';
  static const String jp_id_1000_1st_video_path_2946x624= 'asset/video/led_vms_2496x264/hit/hotseat/1000.mp4';
  static const String jp_id_1000_2nd_video_path_2946x624 = 'asset/video/led_vms_2496x264/hit/hotseat/1000.mp4';
  static const String jp_id_ppochi_Mon_Fri_video_path_2946x624 = 'asset/video/led_vms_2496x264/hit/hotseat/ppochi.mp4';
  static const String jp_id_ppochi_Sat_Sun_video_path_2946x624 = 'asset/video/led_vms_2496x264/hit/hotseat/ppochi.mp4';
  static const String jp_id_RL_ppochi_video_path_2946x624 = 'asset/video/led_vms_2496x264/hit/hotseat/ppochi_rl.mp4';
  static const String jp_id_New_20_ppochi_video_path_2946x624 = 'asset/video/led_vms_2496x264/hit/hotseat/ppochi_slot.mp4';
  static const String jp_id_888_video_path_2946x624 = 'asset/video/led_vms_2496x264/hit/hotseat/888.mp4';

  


  //HIT LED STAIR 1920x1080
  static const String jp_id_hit_all_ledstair = videoHitScreenLedStair_1920x1080;
  static const String jp_id_777_1st_video_path_ledstair1920x1080 = 'asset/video/led_stair/hotseat/777.mp4';
  static const String jp_id_777_2nd_video_path_ledstair1920x1080 = 'asset/video/led_stair/hotseat/777.mp4';
  static const String jp_id_1000_1st_video_path_ledstair1920x1080= 'asset/video/led_stair/hotseat/1000.mp4';
  static const String jp_id_1000_2nd_video_path_ledstair1920x1080 = 'asset/video/led_stair/hotseat/1000.mp4';
  static const String jp_id_ppochi_Mon_Fri_video_path_ledstair1920x1080 = 'asset/video/led_stair/hotseat/ppochi_300.mp4';
  static const String jp_id_ppochi_Sat_Sun_video_path_ledstair1920x1080 = 'asset/video/led_stair/hotseat/ppochi_300.mp4';
  static const String jp_id_RL_ppochi_video_path_ledstair1920x1080 = 'asset/video/led_stair/hotseat/ppochi_rl.mp4';
  static const String jp_id_New_20_ppochi_video_path_ledstair1920x1080 = 'asset/video/led_stair/hotseat/ppochi_slot.mp4';
    static const String jp_id_888_video_path_ledstair1920x1080 = 'asset/video/led_stair/hotseat/888.mp4';


  
  //HIT LED CURVED 1920x1080: CURVED
  static const String jp_id_hit_all_ledcurved = videoHitScreenLedCurved_1920x1080;
  static const String jp_id_hit_all_ledATM = 'asset/video/led_atm/hit.mp4';
  static const String jp_id_hit_all_ledATM_old = 'asset/video/led_atm/hit_old.mp4';

  static const String jp_id_777_1st_video_path_ledcurved1920x1080 = 'asset/video/led_curved/hotseat/777.mp4';
  static const String jp_id_777_2nd_video_path_ledcurved1920x1080 = 'asset/video/led_curved/hotseat/777.mp4';
  static const String jp_id_1000_1st_video_path_ledcurved1920x1080= 'asset/video/led_curved/hotseat/1000.mp4';
  static const String jp_id_1000_2nd_video_path_ledcurved1920x1080 = 'asset/video/led_curved/hotseat/1000.mp4';
  static const String jp_id_ppochi_Mon_Fri_video_path_ledcurved1920x1080 = 'asset/video/led_curved/hotseat/ppochi_300.mp4';
  static const String jp_id_ppochi_Sat_Sun_video_path_ledcurved1920x1080 = 'asset/video/led_curved/hotseat/ppochi_300.mp4';
  static const String jp_id_RL_ppochi_video_path_ledcurved1920x1080 = 'asset/video/led_curved/hotseat/ppochi_rl.mp4';
  static const String jp_id_New_20_ppochi_video_path_ledcurved1920x1080 = 'asset/video/led_curved/hotseat/ppochi_slot.mp4';
  static const String jp_id_888_video_path_ledcurved1920x1080 = 'asset/video/led_curved/hotseat/888.mp4';


  
  //HIT LED CUSTOM TRIPLE DIALY 1920x1080: CURVED
  static const String jp_id_frequent_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/jackpots/frequent.mpg';
  static const String jp_id_daily_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/jackpots/daily.mpg';
  static const String jp_id_dailygolden_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/jackpots/dailygolden.mpg';
  static const String jp_id_monthly_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/jackpots/vegas.mpg';
  static const String jp_id_weekly_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/jackpots/weekly.mpg';
  static const String jp_id_vegas_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/jackpots/vegas.mpg';
  static const String jp_id_triple_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/jackpots/triple.mpg';
  static const String jp_id_dozen_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/jackpots/dozen.mpg';
  static const String jp_id_highlimit_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/jackpots/highlimit.mpg';

  static const String jp_id_777_1st_video_path_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/hotseats/777.mpg';
  static const String jp_id_1000_1st_video_path_ledCustomTripleDaily= 'asset/video/led_custom_tripledaily/hotseats/1000.mpg';
  static const String jp_id_ppochi_Sat_Sun_video_path_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/hotseats/ppochi.mp4';
  static const String jp_id_RL_ppochi_video_path_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/hotseats/ppochi_rl.mp4';
  static const String jp_id_New_20_ppochi_video_path_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/hotseats/ppochi_slot.mpg';
  static const String jp_id_888_video_path_ledCustomTripleDaily = 'asset/video/led_custom_tripledaily/hotseats/888.mpg';



  //HIT LED NON-SMOKE 1920x1080: NON-SMOKE
  static const String jp_id_hit_all_lednonsmoke= videoHitScreenLedNon_Smoke_1920x1080;
  static const String jp_id_777_1st_video_path_lednonsmoke = 'asset/video/led_non_smoke/hotseat/777.mp4';
  static const String jp_id_1000_1st_video_path_lednonsmoke= 'asset/video/led_non_smoke/hotseat/1000.mp4';
  static const String jp_id_ppochi_Mon_Fri_video_path_lednonsmoke = 'asset/video/led_non_smoke/hotseat/ppochi.mp4';
  static const String jp_id_RL_ppochi_video_path_lednonsmoke = 'asset/video/led_non_smoke/hotseat/ppochi_rl.mp4';
  static const String jp_id_New_20_ppochi_video_path_lednonsmoke = 'asset/video/led_non_smoke/hotseat/ppochi_slot.mp4';
  static const String jp_id_888_video_path_lednonsmoke = 'asset/video/led_non_smoke/hotseat/888.mp4';
  


  // Helper methods
  static String? getJackpotNameByLevel(String level) {
    switch (level) {
      case '$levelFrequent': return tagFrequent;
      case '$levelDaily':  return tagDaily;
      case '$levelDailyGolden': return tagDailyGolden;
      case '$levelDozen': return tagDozen;
      case '$levelWeekly': return tagWeekly;
      case '$levelHighLimit': return tagHighLimit;
      case '$levelHighLimitNEW': return tagHighLimitNEW;//new update
      case '$levelTriple': return tagTriple;
      case '$levelMonthly': return tagMonthly;
      case '$levelVegas': return tagVegas;
      case '$level7771st':
      case '$level7771stAlt': return tag7771st;
      case '$level10001st':
      case '$level10001stAlt': return tag10001st;
      case '$levelPpochiMonFri':
      case '$levelPpochiMonFriAlt': return tagPpochiMonFri;
      case '$levelRlPpochi': return tagRlPpochi;
      case '$levelNew20Ppochi': return tagNew20Ppochi;
      //roulette 
      case '$levelVegasSpinJP': return tagVegasSpinJP;
      case '$levelGrandSpinJP': return tagGrandSpinJP;
      case '$levelMajorSpinJP': return tagMajorSpinJP;
      default:
      return null;
    }
  }


static const List<String> selectedJackpotNames = [
    'Frequent',
    'Daily',
    'Dozen',
    'Weekly',
    'Vegas',
    'DailyGolden',
    'Triple',
    'HighLimit',
    'HighLimitNew',
    'Monthly',
  ];




  static double? getResetValueByLevel(String level) {
    switch (level) {
      case '$levelFrequent': return resetFrequentJP;
      case '$levelDaily': return resetDailyJP;
      case '$levelDailyGolden':return resetDailyGoldenJP;
      case '$levelDozen': return resetDozenJP;
      case '$levelWeekly': return resetWeeklyJP;

      case '$levelHighLimit':  return resetHighLimitJP;
      case '$levelHighLimitNEW': return resetHighLimitJPNEW;//New UPdate
      case '$levelTriple': return resetTripleJP;
      case '$levelMonthly': return resetMonthlyJP;
      case '$levelVegas': return resetVegasJP;
      //Roulette
      case '$levelVegasSpinJP': return resetVegasSpinJP;
      case '$levelGrandSpinJP': return resetGrandSpinJP;
      case '$levelMajorSpinJP': return resetMajorSpinJP;

      default:
        return null;
    }
  }



  static List<String> get validJackpotNames => [
        tagFrequent,
        tagDaily,
        tagDailyGolden,
        tagDozen,
        tagWeekly,
        tagHighLimit,
        tagHighLimitNEW,
        tagTriple,
        tagMonthly,
        tagVegas,
        tag7771st,
        tag10001st,
        tagPpochiMonFri,
        tagRlPpochi,
        tagNew20Ppochi,
        //roulette
        tagVegasSpinJP,
        tagGrandSpinJP,
        tagMajorSpinJP,
  ];

  static const List<int> excludedJackpotIds = [
    80,  // hotseat_id_777_1st
    81,  // hotseat_id_777_2nd
    88,  // hotseat_id_1000_1st
    89,  // hotseat_id_1000_2nd
    97,  // hotseat_id_ppochi_Mon_Fri
    98,  // hotseat_id_ppochi_Sat_Sun
    109, // hotseat_id_RL_ppochi
    119, // hotseat_id_New_20_ppochi
    121, //hotseat 888
    122, //hotseat 888
    123 //hotseat 888
  ];

  static const Map<int, String> defaultJackpotValues = {//APPLY FOR ALL HOTSEATS 
    80: '777',
    81: '777',
    88: '1000',
    89: '1000',
    97: '300', //PPOCHI
    98: '300', // PPOCHI 
    // 97: '600', //PPOCHI
    // 98: '600', // PPOCHI 
    // 109: '300',//RL 
    109: '600',//RL TEMPORARY

    119: '500',
    121: '888',
    122: '888',
    123: '888',
  };//APPLY FOR ALL HOTSEATS


  static const Map<int, String> defaultJackpotValueOnlyRL = {//APPLY FOR ALL HOTSEATS 
    97: '300',
    98: '300',
    // 97: '600',
    // 98: '600',
    // 109: '300',
    109: '600',
    119: '500',
  };//APPLY FOR ALL HOTSEATS




  //ONLY FOR TABLE BACARRAT
  //small version
  static const double text_odo_size_small_table = 52.5;
  static const double text_odo_letter_width_small_table = 32.5;
  static const double odo_position_top_small_table = 18.5;
  static const double odo_height_small_table_small = 54;
  static const double odo_height_table = 66.5;
  //hd version
  static const double text_odo_size_hd_horizontal = 74.5;
  static const double text_odo_letter_width_hd_horizontal = 38.5;
  static const double text_odo_letter_vertical_offset_hd_horizontal = 54.5;
  static const double text_odo_letter_vertical_offset_small_table = 50;
  static const double odo_position_top_table = 9.5;
  static const double text_odo_size_table = 58.5;




}

