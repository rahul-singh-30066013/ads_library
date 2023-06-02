/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/models/more_options_model.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';

class MoreTabState extends BaseViewModel {
  MoreTabState({
    required this.isLoyalityActive,
    required this.isLoggedIn,
  });

  bool isLoyalityActive = false;
  bool isLoggedIn;

  List<MoreOptionsItemModel> get moreOptionList =>
      MoreOptionsModel.predefinedValue(
        isLoyalityActive: isLoyalityActive,
        isLoggedIn: isLoggedIn,
      ).moreOptions ??
      [];
}
