/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class DottedBorder extends CustomPainter {
  //number of stories
  final int numberOfDots;
  //length of the space arc (empty one)
  final int spaceLength;
  //start of the arc painting in degree(0-360)
  double startOfArcInDegree = 0;
  static const defaultSpaceLength = 10;

  DottedBorder({
    required this.numberOfDots,
    this.spaceLength = defaultSpaceLength,
  });

  //drawArc deals with rads, easier for me to use degrees
  //so this takes a degree and change it to rad
  double inRads(double degree) {
    const angle = 180;
    return (degree * pi) / angle;
  }

  @override
  bool shouldRepaint(DottedBorder oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //circle angle is 360, remove all space arcs between the main story arc (the number of spaces(stories) times the  space length
    //then subtract the number from 360 to get ALL arcs length
    //then divide the ALL arcs length by number of Arc (number of stories) to get the exact length of one arc
    double arcLength = (360 - (numberOfDots * spaceLength)) / numberOfDots;

    //be careful here when arc is a negative number
    //that happens when the number of spaces is more than 360
    //feel free to use what logic you want to take care of that
    //note that numberOfStories should be limited too here
    if (arcLength <= 0) {
      const angle = 360;
      arcLength = angle / spaceLength - 1;
    }

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    //looping for number of stories to draw every story arc
    for (int lan = 0; lan < numberOfDots; lan++) {
      //printing the arc
      final strokeWidth = 1.sp;
      canvas.drawArc(
        rect,
        inRads(startOfArcInDegree),
        //be careful here is:  "double sweepAngle", not "end"
        inRads(arcLength),
        false,
        Paint()
          //here you can compare your SEEN story index with the arc index to make it grey
          ..color = ADColors.black
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke,
      );

      //the logic of spaces between the arcs is to start the next arc after jumping the length of space
      startOfArcInDegree += arcLength + spaceLength;
    }
  }
}
