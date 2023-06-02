/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_mobile_utility/base/base_view_model.dart';

class ParkingRatesViewModel extends BaseViewModel {
  String selectedTerminal = 'Terminal 1';

  void updateSelectedTerminalWith(String newValue) {
    selectedTerminal = newValue;
    notifyListeners();
  }
}
