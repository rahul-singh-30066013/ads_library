import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/models/response/package_detail_response.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class PackageRepository {
  final ADApiClient adApiClient = ADApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );

  /// this is used to get stand alone packages
  Future<ADResponseState> getStandAlonePackages(
    String path,
    Map<String, dynamic> getPackageDetailRequestModel,
  ) async {
    adLog(
      'getPackageDetailRequestModel ${getPackageDetailRequestModel.toString()}',
      className: this,
    );
    final ADResponseState responseState = await adApiClient.post(
      path: path,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(getPackageDetailRequestModel),
    );
    if (responseState.viewStatus == Status.complete) {
      responseState.data = PackageDetailResponse.fromJson(responseState.data);
    }
    return responseState;
  }

  /// this is used to get stand alone packages
  Future<ADResponseState> addCartDetails(
    String path,
    Map<String, dynamic> getCartDetailRequestModel,
  ) async {
    adLog(
      'getCartDetailRequestModel ${getCartDetailRequestModel.toString()}',
      className: this,
    );
    final ADResponseState responseState = await adApiClient.post(
      path: path,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(getCartDetailRequestModel),
    );
    if (responseState.viewStatus == Status.complete) {
      responseState.data = PackageDetailResponse.fromJson(responseState.data);
    }
    return responseState;
  }
}
