import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class CurrencyExchangeRepo {
  ///API to get the dashboard for loyalty.
  Future<ADResponseState> fetchCurrencyExchangeHome({
    required String path,
    required Map<String, String> queryParams,
  }) async {
    final ADApiClient _adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

    try {
      final ADResponseState responseState = await _adApiClient.get(
        path: path,
        queryParameters: queryParams,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
      adLog('response : $responseState');
      if (responseState.viewStatus == Status.complete &&
          responseState.data != null &&
          responseState.data is List) {
        responseState.data = (responseState.data as List)
            .map<Elements>(
              (e) => Elements.fromJson(e),
            )
            .toList();
      }
      return responseState;
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Something went wrong');
    }
  }
}
