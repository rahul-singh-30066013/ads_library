/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This class is used to show a Android SplashScreen of Airport app
/// customize splash screen for android
class AndroidSplashScreen extends StatelessWidget {
  const AndroidSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Image.asset(
            'lib/assets/gif/splash_screen.gif',
            fit: BoxFit.fitHeight,
            width: context.widthOfScreen,
            height: context.heightOfScreen,
          ),
        ),
        // ValueListenableBuilder(
        //   valueListenable: apiNameNotifier,
        //   builder: (context, String value, child) {
        //     return Positioned(
        //       left: 50.sp,
        //       right: 50.sp,
        //       bottom: 100.sp,
        //       child: Container(
        //         padding: EdgeInsets.all(10.sp),
        //         color: Colors.red,
        //         child: Center(
        //           child: Text(
        //             value,
        //             style: ADTextStyle600.size14,
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
