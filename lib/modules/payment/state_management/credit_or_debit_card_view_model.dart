/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_mobile_utility/base/base_view_model.dart';

class CreditOrDebitCardViewModel extends ADBaseViewModel {
  // To check if the card is opted to be persisted.
  bool cardSaved = true;

  // Trigger a selection for the check for saving card for future references.
  void triggerSaveSelection({required bool value}) {
    cardSaved = value;
    notifyListeners();
  }
}
