import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_text_display.dart';
import 'package:playtech_transmitter_app/screen/background_screen/page_hit/jackpot_text_display_full.dart';
import 'package:playtech_transmitter_app/service/config_custom.dart';
import 'package:playtech_transmitter_app/service/widget/text_style.dart';

class JackpotBackgroundVideoHit5200x1664LedFloor3MegaNoBG extends StatefulWidget {
  final String number;
  final String value;
  final String id;

  const JackpotBackgroundVideoHit5200x1664LedFloor3MegaNoBG({
    super.key,
    required this.number,
    required this.value,
    required this.id,
  });

  @override
  _JackpotBackgroundVideoHit5200x1664LedFloor3MegaNoBGState createState() => _JackpotBackgroundVideoHit5200x1664LedFloor3MegaNoBGState();
}




class _JackpotBackgroundVideoHit5200x1664LedFloor3MegaNoBGState extends State<JackpotBackgroundVideoHit5200x1664LedFloor3MegaNoBG>
   {
  final NumberFormat _numberFormat = NumberFormat('#,##0.00', 'en_US');


  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(JackpotBackgroundVideoHit5200x1664LedFloor3MegaNoBG oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return
    SizedBox(
      width: screenSize.width,
      height: screenSize.height, // Full screen container
      child: Stack(
        // fit: StackFit.expand,
        children: [
          // Separate, independent text layer
          Positioned(
            top:screenSize.height/7.25,
            left:0,right:0,
            child: 
            JackpotTextDisplayFull(
              number: widget.number,
              value: widget.value,
            ),
          ),
        ],
      ),
    );
  }
}



