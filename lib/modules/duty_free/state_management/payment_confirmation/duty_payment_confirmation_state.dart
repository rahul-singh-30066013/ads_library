/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/state_management/payment_confirmation/repository/duty_free_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

/// This ViewModel is used get the data from the [DutyFreeRepository] and
/// bind it with the corresponding view DutyPaymentConfiramtionScreen.
class DutyPaymentConfirmationState extends ADBaseViewModel {
  final DutyFreeRepository _dutyFreeRepository = DutyFreeRepository();
  ADResponseState dutyPaymentConfirmationState = ADResponseState.loading();

  Future<void> getDutyPaymentConfirmationSummary(String jsonPath) async {
    await _dutyFreeRepository
        .getDutyPaymentConfirmationList(jsonPath)
        .then((value) {
      _updateState(value);
    });
  }

  void _updateState(ADResponseState response) {
    dutyPaymentConfirmationState = response;
    notifyListeners();
  }
}
