/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/network/pranaam_api/pranaam_api_urls.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class CountryRepository {
  final ADApiClient adApiClient =
      ADApiClient(baseUrl: PranaamApiUrls.countryCodeBaseUrl);

  Future<ADResponseState> fetchCountryCodesList() async {
    final ADResponseState response = await adApiClient.get(
      path: PranaamApiUrls.countryCodesUrl,
    );
    if (response.data != null) {
      return ADResponseState.completed(
        CountryCodeModel.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }
}
