/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';

const k12am = 0000;
const k8am = 0800;
const k12pm = 1200;
const k4pm = 1600;
const k8pm = 2000;
const k12amN = 2400;

class FilterArrivalModel {
  String changeCode;
  final String filterName;
  final List<TimeFilter> filterOptions;
  List<TimeType> selectedFilterType = [];
  int filterCount;

  FilterArrivalModel({
    required this.changeCode,
    required this.filterName,
    required this.filterOptions,
    required this.selectedFilterType,
    required this.filterCount,
  });

  factory FilterArrivalModel.defaultValues() => FilterArrivalModel(
        changeCode: '',
        filterName: 'Stops',
        filterCount: 0,
        filterOptions: [
          TimeFilter(
            itemCode: '01',
            timeName: 'Early Morning',
            timeDurationName: '12am - 8am',
            timeType: TimeType.earlyMorning,
            minTime: k12am,
            maxTime: k8am,
            isSelected: false,
          ),
          TimeFilter(
            itemCode: '02',
            timeName: 'Morning',
            timeDurationName: '8am - 12pm',
            timeType: TimeType.morning,
            minTime: k8am,
            maxTime: k12pm,
            isSelected: false,
          ),
          TimeFilter(
            itemCode: '03',
            timeName: 'Mid Day',
            timeDurationName: '12pm - 4pm',
            timeType: TimeType.midDay,
            minTime: k12pm,
            maxTime: k4pm,
            isSelected: false,
          ),
          TimeFilter(
            itemCode: '04',
            timeName: 'Evening',
            timeDurationName: '4pm - 8pm',
            timeType: TimeType.evening,
            minTime: k4pm,
            maxTime: k8pm,
            isSelected: false,
          ),
          TimeFilter(
            itemCode: '05',
            timeName: 'Night',
            timeDurationName: '8pm - 12am',
            timeType: TimeType.night,
            minTime: k8pm,
            maxTime: k12amN,
            isSelected: false,
          ),
        ],
        selectedFilterType: [],
      );

  FilterArrivalModel copy() {
    final List<TimeFilter> filterCopy = [];

    for (final element in filterOptions) {
      filterCopy.add(element.copy());
    }

    return FilterArrivalModel(
      changeCode: changeCode,
      filterName: filterName,
      filterOptions: filterCopy,
      selectedFilterType: selectedFilterType,
      filterCount: filterCount,
    );
  }

  void updateChangeCode() {
    final concatenate = StringBuffer();
    final List<TimeType> _selectedFilterType = [];
    for (final item in filterOptions) {
      if (item.isSelected) {
        concatenate.write(item.itemCode);
        _selectedFilterType.add(item.timeType);
      }
    }
    selectedFilterType = _selectedFilterType;
    changeCode = concatenate.toString();
    filterCount = changeCode.isNotEmpty ? 1 : 0;

    //print(changeCode);
  }

  static TimeType getTimeTypeBasedOnDeparture(
    int departNum,
  ) {
    if (departNum >= k12am && departNum < k8am) {
      return TimeType.earlyMorning;
    } else if (departNum >= k8am && departNum < k12pm) {
      return TimeType.morning;
    } else if (departNum >= k12pm && departNum < k4pm) {
      return TimeType.midDay;
    } else if (departNum >= k4pm && departNum < k8pm) {
      return TimeType.evening;
    } else {
      return TimeType.night;
    }
  }
}

class TimeFilter {
  String timeName;
  String timeDurationName;
  TimeType timeType;
  int minTime;
  int maxTime;
  String? itemCode;
  bool isSelected = false;

  TimeFilter({
    required this.minTime,
    required this.maxTime,
    required this.timeName,
    required this.timeDurationName,
    required this.timeType,
    required this.itemCode,
    required this.isSelected,
  });

  TimeFilter copy() {
    return TimeFilter(
      timeName: timeName,
      timeDurationName: timeDurationName,
      timeType: timeType,
      minTime: minTime,
      maxTime: maxTime,
      itemCode: itemCode,
      isSelected: isSelected,
    );
  }
}
