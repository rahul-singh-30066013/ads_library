/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */


import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/timeline/adtimeline_new.dart';
import 'package:superapp_mobile_style_guide/timeline/timeline_horizontal.dart';

class ReviewFlightStatusView extends StatelessWidget {
  final List flightStatusList;

  /// This is used to draw the stepper using ADTimeLineNew which comes from
  /// package styleguide.
  ///
  /// ReviewFlightStatusView(
  ///             flightStatusList: flightStatusList,
  ///           ),
  const ReviewFlightStatusView({
    Key? key,
    required this.flightStatusList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int index = 0; index < flightStatusList.length; index++)
            ADTimelineNew(
              onTap: (value) => adLog('ADTimeline pressed'),
              initialTextColor: context.adColors.stepperGreyTextColor,
              doneColor: context.adColors.greenColor,
              progressColor: context.adColors.greenColor,
              initialColor: context.adColors.contentBulletColor,
              mainText: getFlightStatusType(index),
              index: index,
              timelineLength: flightStatusList.length,
              adTimeLineState: getFlightStatus(index) == 0
                  ? ADTimeLineState.initial
                  : getFlightStatus(index) == 1
                      ? ADTimeLineState.progress
                      : ADTimeLineState.done,
            ),
        ],
      ),
    );
  }

  String getFlightStatusType(int index) {
    FlightStatusClass flightStatusClass;
    flightStatusClass = flightStatusList[index];
    return flightStatusClass.name;
  }

  int getFlightStatus(int index) {
    FlightStatusClass flightStatusClass;
    flightStatusClass = flightStatusList[index];
    return flightStatusClass.statusCode;
  }
}

/// this class is used as a helper for ReviewFlightStatusView
class FlightStatusClass {
  String name;
  int statusCode;

  FlightStatusClass({
    required this.name,
    required this.statusCode,
  });
}
