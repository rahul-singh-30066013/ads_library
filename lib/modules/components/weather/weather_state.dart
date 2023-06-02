/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_service/repository/common_service_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class WeatherState extends ADBaseViewModel {
  final CommonServiceRepository _commonServiceRepository =
      CommonServiceRepository();

  ADResponseState weatherDataModel = ADResponseState.init();

  String path = '';

  Future<void> fetchWeatherData() async {
    final response = await _commonServiceRepository.getWeatherData(
      path,
    );
    weatherDataModel = response;
    notifyListeners();
  }

  void retryFetching() {
    weatherDataModel = ADResponseState.init();
    notifyListeners();
    fetchWeatherData();
  }
}
