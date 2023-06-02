

import 'package:adani_airport_mobile/api_client/ad_aks_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/network/flights_api/flights_api_urls.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class FinancePaymentRepository{
  final ADAksApiClient adFinanceApiClient =
  ADAksApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);




  Future<ADResponseState> checkout({
    required String requestModel,
  }) async {
    final ADResponseState response = await adFinanceApiClient.post(
      path: FLightsApiUrls.checkout,
      params: requestModel,
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      print(response.data);
      // response.data = await compute(_parsePaymentDataBackground, response.data);
    }
    return response;
  }
  // static PayNowResponse _parsePaymentDataBackground(dynamic encodedJson) {
  //   return PayNowResponse.fromJson(encodedJson);
  // }
}