/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_mobile_utility/base/base_view_model.dart';

class CarParkingDropdownViewModel extends BaseViewModel {
  List<String> options = [];
  String? selectedValue;

  void populate(List<String> values, String selected) {
    options = values;
    selectedValue = selected;
  }

  void updateSelectionWith(String newSelectedValue) {
    selectedValue = newSelectedValue;
    notifyListeners();
  }
}
