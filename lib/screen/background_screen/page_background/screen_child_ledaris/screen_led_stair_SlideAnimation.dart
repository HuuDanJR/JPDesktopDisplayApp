import 'package:flutter/material.dart';
import 'package:playtech_transmitter_app/SlideAnimation/version/marqueeItem.dart';
import 'package:playtech_transmitter_app/SlideAnimation/version/marqueeStack.dart';
import 'package:playtech_transmitter_app/screen/background_screen/page_background/jackpot_screen_page.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';

Widget screenLedStairSLIDEANIMATION(
  BuildContext context,
  Map<String, double> hiveValues,
  Map<String, double> prev,
  Map<String, double> value,
) {
  return MarqueeStack(
    duration: const Duration(seconds: 100),
    items: [
      MarqueeItem(
        offset: Offset(
          ConfigCustom.jp_frequent_screen_dX_ledstairSlideAnimation,
          ConfigCustom.jp_frequent_screen_dY_ledstairSlideAnimation,
        ),
        child: 
        JackpotOdometer(
          nameJP: ConfigCustom.tagFrequent,
          valueKey: ConfigCustom.tagFrequent,
          hiveValue: hiveValues[ConfigCustom.tagFrequent] ?? 0.0,
          isSmall: false,
        ),
        // Container(width:100,height:100,color:Colors.red)
      ),

      MarqueeItem(
        offset: Offset(
          ConfigCustom.jp_daily_screen_dX_ledstairSlideAnimation,
          ConfigCustom.jp_daily_screen_dY_ledstairSlideAnimation,
        ),
        child: JackpotOdometer(
          nameJP: ConfigCustom.tagDaily,
          valueKey: ConfigCustom.tagDaily,
          hiveValue: hiveValues[ConfigCustom.tagDaily] ?? 0.0,
          isSmall: false,
        ),
      ),

      MarqueeItem(
        offset: Offset(
          ConfigCustom.jp_dailygolden_screen_dX_ledstairSlideAnimation,
          ConfigCustom.jp_dailygolden_screen_dY_ledstairSlideAnimation,
        ),
        child: JackpotOdometer(
          nameJP: ConfigCustom.tagDailyGolden2,
          valueKey: ConfigCustom.tagDailyGolden,
          hiveValue: hiveValues[ConfigCustom.tagDailyGolden] ?? 0.0,
          isSmall: false,
        ),
      ),

      MarqueeItem(
        offset: Offset(
          ConfigCustom.jp_dozen_screen_dX_ledstairSlideAnimation,
          ConfigCustom.jp_dozen_screen_dY_ledstairSlideAnimation,
        ),
        child: JackpotOdometer(
          nameJP: ConfigCustom.tagDozen,
          valueKey: ConfigCustom.tagDozen,
          hiveValue: hiveValues[ConfigCustom.tagDozen] ?? 0.0,
          isSmall: false,
        ),
      ),

      MarqueeItem(
        offset: Offset(
          ConfigCustom.jp_triple_screen_dX_ledstairSlideAnimation,
          ConfigCustom.jp_triple_screen_dY_ledstairSlideAnimation,
        ),
        child: JackpotOdometer(
          nameJP: ConfigCustom.tagTriple,
          valueKey: ConfigCustom.tagTriple,
          hiveValue: hiveValues[ConfigCustom.tagTriple] ?? 0.0,
          isSmall: false,
        ),
      ),

      MarqueeItem(
        offset: Offset(
          ConfigCustom.jp_weekly_screen_dX_ledstairSlideAnimation,
          ConfigCustom.jp_weekly_screen_dY_ledstairSlideAnimation,
        ),
        child: JackpotOdometer(
          nameJP: ConfigCustom.tagWeekly,
          valueKey: ConfigCustom.tagWeekly,
          hiveValue: hiveValues[ConfigCustom.tagWeekly] ?? 0.0,
          isSmall: false,
        ),
      ),

      MarqueeItem(
        offset: Offset(
          ConfigCustom.jp_highlimit_screen_dX_ledstairSlideAnimation,
          ConfigCustom.jp_highlimit_screen_dY_ledstairSlideAnimation,
        ),
        child: JackpotOdometer(
          nameJP: ConfigCustom.tagHighLimitNEW2,
          valueKey: ConfigCustom.tagHighLimitNEW,
          hiveValue: hiveValues[ConfigCustom.tagHighLimitNEW] ?? 0.0,
          isSmall: false,
        ),
      ),

      MarqueeItem(
        offset: Offset(
          ConfigCustom.jp_monthly_screen_dX_ledstairSlideAnimation,
          ConfigCustom.jp_monthly_screen_dY_ledstairSlideAnimation,
        ),
        child: JackpotOdometer(
          nameJP: ConfigCustom.tagMonthly,
          valueKey: ConfigCustom.tagMonthly,
          hiveValue: hiveValues[ConfigCustom.tagMonthly] ?? 0.0,
          isSmall: false,
        ),
      ),

      MarqueeItem(
        offset: Offset(
          ConfigCustom.jp_vegas_screen_dX_ledstairSlideAnimation,
          ConfigCustom.jp_vegas_screen_dY_ledstairSlideAnimation,
        ),
        child: JackpotOdometer(
          nameJP: ConfigCustom.tagVegas,
          valueKey: ConfigCustom.tagVegas,
          hiveValue: hiveValues[ConfigCustom.tagVegas] ?? 0.0,
          isSmall: false,
        ),
      ),



      // //2 PARTs 
      // MarqueeItem(
      //   offset: Offset(
      //     ConfigCustom.jp_frequent_screen_dX_ledstairSlideAnimation2,
      //     ConfigCustom.jp_frequent_screen_dY_ledstairSlideAnimation2,
      //   ),
      //   child: 
      //   JackpotOdometer(
      //     nameJP: ConfigCustom.tagFrequent,
      //     valueKey: ConfigCustom.tagFrequent,
      //     hiveValue: hiveValues[ConfigCustom.tagFrequent] ?? 0.0,
      //     isSmall: false,
      //   ),
      //   // Container(width:100,height:100,color:Colors.red)
      // ),

      // MarqueeItem(
      //   offset: Offset(
      //     ConfigCustom.jp_daily_screen_dX_ledstairSlideAnimation2,
      //     ConfigCustom.jp_daily_screen_dY_ledstairSlideAnimation2,
      //   ),
      //   child: JackpotOdometer(
      //     nameJP: ConfigCustom.tagDaily,
      //     valueKey: ConfigCustom.tagDaily,
      //     hiveValue: hiveValues[ConfigCustom.tagDaily] ?? 0.0,
      //     isSmall: false,
      //   ),
      // ),

      // MarqueeItem(
      //   offset: Offset(
      //     ConfigCustom.jp_dailygolden_screen_dX_ledstairSlideAnimation2,
      //     ConfigCustom.jp_dailygolden_screen_dY_ledstairSlideAnimation2,
      //   ),
      //   child: JackpotOdometer(
      //     nameJP: ConfigCustom.tagDailyGolden2,
      //     valueKey: ConfigCustom.tagDailyGolden,
      //     hiveValue: hiveValues[ConfigCustom.tagDailyGolden] ?? 0.0,
      //     isSmall: false,
      //   ),
      // ),

      // MarqueeItem(
      //   offset: Offset(
      //     ConfigCustom.jp_dozen_screen_dX_ledstairSlideAnimation2,
      //     ConfigCustom.jp_dozen_screen_dY_ledstairSlideAnimation2,
      //   ),
      //   child: JackpotOdometer(
      //     nameJP: ConfigCustom.tagDozen,
      //     valueKey: ConfigCustom.tagDozen,
      //     hiveValue: hiveValues[ConfigCustom.tagDozen] ?? 0.0,
      //     isSmall: false,
      //   ),
      // ),

      // MarqueeItem(
      //   offset: Offset(
      //     ConfigCustom.jp_triple_screen_dX_ledstairSlideAnimation2,
      //     ConfigCustom.jp_triple_screen_dY_ledstairSlideAnimation2,
      //   ),
      //   child: JackpotOdometer(
      //     nameJP: ConfigCustom.tagTriple,
      //     valueKey: ConfigCustom.tagTriple,
      //     hiveValue: hiveValues[ConfigCustom.tagTriple] ?? 0.0,
      //     isSmall: false,
      //   ),
      // ),

      // MarqueeItem(
      //   offset: Offset(
      //     ConfigCustom.jp_weekly_screen_dX_ledstairSlideAnimation2,
      //     ConfigCustom.jp_weekly_screen_dY_ledstairSlideAnimation2,
      //   ),
      //   child: JackpotOdometer(
      //     nameJP: ConfigCustom.tagWeekly,
      //     valueKey: ConfigCustom.tagWeekly,
      //     hiveValue: hiveValues[ConfigCustom.tagWeekly] ?? 0.0,
      //     isSmall: false,
      //   ),
      // ),

      // MarqueeItem(
      //   offset: Offset(
      //     ConfigCustom.jp_highlimit_screen_dX_ledstairSlideAnimation2,
      //     ConfigCustom.jp_highlimit_screen_dY_ledstairSlideAnimation2,
      //   ),
      //   child: JackpotOdometer(
      //     nameJP: ConfigCustom.tagHighLimitNEW2,
      //     valueKey: ConfigCustom.tagHighLimitNEW,
      //     hiveValue: hiveValues[ConfigCustom.tagHighLimitNEW] ?? 0.0,
      //     isSmall: false,
      //   ),
      // ),

      // MarqueeItem(
      //   offset: Offset(
      //     ConfigCustom.jp_monthly_screen_dX_ledstairSlideAnimation2,
      //     ConfigCustom.jp_monthly_screen_dY_ledstairSlideAnimation2,
      //   ),
      //   child: JackpotOdometer(
      //     nameJP: ConfigCustom.tagMonthly,
      //     valueKey: ConfigCustom.tagMonthly,
      //     hiveValue: hiveValues[ConfigCustom.tagMonthly] ?? 0.0,
      //     isSmall: false,
      //   ),
      // ),

      // MarqueeItem(
      //   offset: Offset(
      //     ConfigCustom.jp_vegas_screen_dX_ledstairSlideAnimation2,
      //     ConfigCustom.jp_vegas_screen_dY_ledstairSlideAnimation2,
      //   ),
      //   child: JackpotOdometer(
      //     nameJP: ConfigCustom.tagVegas,
      //     valueKey: ConfigCustom.tagVegas,
      //     hiveValue: hiveValues[ConfigCustom.tagVegas] ?? 0.0,
      //     isSmall: false,
      //   ),
      // ),
    ],
  );
}
