/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

class FilterStopModel {
  String changeCode;
  final String filterName;
  final List<StopsFilter> filterOptions;
  List<String> selectedFilterType = [];
  int filterCount;

  FilterStopModel({
    required this.changeCode,
    required this.filterName,
    required this.filterOptions,
    required this.selectedFilterType,
    required this.filterCount,
  });

  factory FilterStopModel.defaultValues() => FilterStopModel(
        changeCode: '',
        filterCount: 0,
        filterName: 'Stops',
        filterOptions: [
          StopsFilter(
            itemCode: '01',
            stopName: 'Non-Stop',
            stopType: StopType.nonStop,
            isSelected: false,
          ),
          StopsFilter(
            itemCode: '02',
            stopName: '1 Stop',
            stopType: StopType.oneStop,
            isSelected: false,
          ),
          StopsFilter(
            itemCode: '03',
            stopName: '1+ Stops',
            stopType: StopType.moreStop,
            isSelected: false,
          ),
        ],
        selectedFilterType: [],
      );
  FilterStopModel copy() {
    final List<StopsFilter> filterCopy = [];
    for (final element in filterOptions) {
      filterCopy.add(element.copy());
    }
    return FilterStopModel(
      changeCode: changeCode,
      filterName: filterName,
      filterOptions: filterCopy,
      selectedFilterType: selectedFilterType,
      filterCount: filterCount,
    );
  }

  void updateChangeCode() {
    final concatenate = StringBuffer();
    final List<String> _selectedFilterType = [];
    for (final item in filterOptions) {
      if (item.isSelected) {
        concatenate.write(item.itemCode);
        _selectedFilterType.add(item.stopName.validateWithDefaultValue());
      }
    }
    selectedFilterType = _selectedFilterType;
    changeCode = concatenate.toString();
    filterCount = changeCode.isNotEmpty ? 1 : 0;
  }
}

class StopsFilter {
  String? stopName;
  StopType? stopType;
  String? itemCode;
  bool isSelected;

  StopsFilter({
    this.stopName,
    this.stopType,
    this.itemCode,
    required this.isSelected,
  });

  StopsFilter copy() {
    return StopsFilter(
      stopName: stopName,
      stopType: stopType,
      itemCode: itemCode,
      isSelected: isSelected,
    );
  }
}
