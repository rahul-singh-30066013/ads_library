/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/month_view.dart';
import 'package:flutter/material.dart';

/// this class is used to to create month item
class BuildMonthItem extends StatelessWidget {
  final int index;
  final bool beforeInitialMonth;
  final int initialMonthIndex;
  final DateTime firstDate;
  final DateTime currentDate;
  final DateTime lastDate;
  final ValueNotifier<DateTime> startDate;
  final ValueNotifier<DateTime?> endDate;
  final ValueChanged<DateTime> updateSelection;
  final bool showAmount;
  final bool isArrivalSelected;
  const BuildMonthItem({
    required this.index,
    required this.beforeInitialMonth,
    required this.initialMonthIndex,
    required this.firstDate,
    required this.currentDate,
    required this.startDate,
    required this.endDate,
    required this.lastDate,
    required this.updateSelection,
    required this.showAmount,
    required this.isArrivalSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int monthIndex = beforeInitialMonth
        ? initialMonthIndex - index - 1
        : initialMonthIndex + index;
    final DateTime month =
        DateUtils.addMonthsToMonthDate(firstDate, monthIndex);
    return AnimatedBuilder(
      animation: Listenable.merge([startDate, endDate]),
      builder: (BuildContext context, child) {
        return MonthItem(
          selectedDateStart: startDate.value,
          selectedDateEnd: endDate.value,
          currentDate: currentDate,
          firstDate: firstDate,
          lastDate: lastDate,
          displayedMonth: month,
          onChanged: updateSelection,
          showAmount: showAmount,
          isArrivalSelected: isArrivalSelected,
        );
      },
    );
  }
}
