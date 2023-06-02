/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/sort_filter_left_menu_enum.dart';

class FilterSelectedModel {
  FilterSelectedModel({
    required this.name,
    required this.selected,
    required this.sortFilterType,
  });
  String name;
  String selected = '';
  SortFilterLeftMenuEnum sortFilterType;
}
