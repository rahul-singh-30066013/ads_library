import 'dart:async';

import 'package:adani_airport_mobile/modules/themes/google_event/theme_ga_event.dart';
import 'package:adani_airport_mobile/modules/themes/model/salute_count_response_model.dart';
import 'package:adani_airport_mobile/modules/themes/repository/salute_repository.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class ThemeStateManagement extends ADBaseViewModel {
  final SaluteRepository _saluteRepository = SaluteRepository();
  int counter = 0;

  // bool _isAbsorbing = false;
  ADResponseState saluteStatusState = ADResponseState.loading();
  Timer? _timer;

  /// get salute count
  Future<void> getSaluteCount() async {
    final Map<String, String> queryParameters = {
      'campaignId': 'campaign102',
    };
    // _isAbsorbing = true;
    final value = await _saluteRepository.fetchSaluteCount(
      queryParameters: queryParameters,
    );
    // _isAbsorbing = false;
    updateState(value);
  }

  void initiatePolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) async {
      await getSaluteCount();
    });
  }

  /// set salute count
  Future<void> setSaluteCount() async {
    final Map<String, String> queryParameters = {
      'campaignId': 'campaign102',
    };
    final value = await _saluteRepository.setSaluteCount(
      queryParameters: queryParameters,
    );
    updateState(value);
    await getSaluteCount();
  }

  void updateState(ADResponseState response) {
    counter = (response.data as SaluteCountResponseModel).counter ?? 0;
    try {
      ThemeGaEvent().tapToSaluteEvent(counter);
    } catch (e) {
      adLog(e.toString());
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
