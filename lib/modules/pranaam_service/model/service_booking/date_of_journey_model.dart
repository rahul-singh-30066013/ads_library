/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class DateOfJourneyModel {
  final DateTime dateOfJourney;
  final bool dateSelected;
  final String dayMonth;

  DateOfJourneyModel({
    required this.dateOfJourney,
    required this.dateSelected,
    required this.dayMonth,
  });

  @override
  String toString() {
    return 'DateOfJourneyModel{dateOfJourney: $dateOfJourney, dateSelected: $dateSelected, dayMonth: $dayMonth}';
  }
}
