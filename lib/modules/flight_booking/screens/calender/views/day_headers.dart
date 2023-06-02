/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/month_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/week_days.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

/// this class is used to to show the week days from enum
class DayHeaders extends StatelessWidget {
  List<Widget> _getDayHeaders() {
    final List<Widget> result = WeekDays.values.map((e) {
      return ExcludeSemantics(
        child: Center(
          child: Text(
            e.name.capitalize(),
            style: ADTextStyle400.size14,
          ),
        ),
      );
    }).toList();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> labels = _getDayHeaders();

    // Add leading and trailing containers for edges of the custom grid layout.
    labels.insert(
      0,
      ExcludeSemantics(
        child: Container(),
      ),
    );
    labels.add(ExcludeSemantics(
      child: Container(),
    ));

    return Container(
      constraints: BoxConstraints(
        maxWidth: maxCalendarWidthPortrait,
        maxHeight: monthItemRowHeight,
      ),
      child: GridView.custom(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: monthItemGridDelegate,
        childrenDelegate: SliverChildListDelegate(
          labels,
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
