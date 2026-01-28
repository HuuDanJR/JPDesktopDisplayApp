
import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/image/pexels-david9122-31685965.jpg'),fit: BoxFit.cover)
          ),
          
        ),
        //  JackpotDisplayScreenSlideAnimationLedHD1920x1080()

      ],
    );
  }
}



