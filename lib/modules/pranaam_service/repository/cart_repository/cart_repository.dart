/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/apply_coupons/responce_model/apply_coupon_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_cart/get_cart_response_model/get_cart_response_model.dart';
import 'package:adani_airport_mobile/network/pranaam_api/pranaam_api_urls.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

///This class will be used to call Add Cart & AddCartAddOn API.
///All API related to cart.
class CartRepository {
  ADApiClient _adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  /// package Add on API.it will remove add addOn from the Cart
  Future<ADResponseState> addPackageAddOnToCart(
    Map<String, dynamic> requestJson,
  ) async {
    final ADResponseState<dynamic> response =
        await postRequest(PranaamApiUrls.addCartAddOn, requestJson);

    if (response.viewStatus == Status.complete) {
      response.data = GetCartResponseModel.fromJson(response.data);
    }

    return response;
  }

  /// Add Package to Shopping cart.
  Future<ADResponseState> addPackageToCart(
    Map<String, dynamic> requestJson,
  ) async {
    final ADResponseState response =
        await postRequest(PranaamApiUrls.addCartItem, requestJson);

    if (response.viewStatus == Status.complete) {
      response.data = GetCartResponseModel.fromJson(response.data);
    }

    return response;
  }

  /// delete Cart API, used to delete package from the cart if any associated
  /// addon is added it will also remove the addons as well from cart.
  Future<ADResponseState> deleteCart() async {
    final ADResponseState response =
        await deleteRequest(PranaamApiUrls.removeCartItems, {});
    return response;
  }

  /// Validate coupon if user applied any coupon from coupon list
  Future<ADResponseState> validateCoupon(
    Map<String, dynamic> requestJson,
  ) async {
    final ADResponseState response =
        await postRequest(PranaamApiUrls.validateCoupon, requestJson);
    if (response.viewStatus == Status.complete) {
      response.data = GetCartResponseModel.fromJson(response.data);
    }

    return response;
  }

  Future<ADResponseState> removeCoupon(
    Map<String, dynamic> requestJson,
  ) async {
    final ADResponseState response =
        await postRequest(PranaamApiUrls.removeCoupon, requestJson);
    if (response.viewStatus == Status.complete) {
      response.data = GetCartResponseModel.fromJson(response.data);
    }

    return response;
  }

  ///this is used to getPranaamCoupons
  Future<ADResponseState> getPranaamCoupons(
    Map<String, dynamic> requestJson,
  ) async {
    ///Creating request body for the fetch applyCoupon
    final ADResponseState response =
        await postRequest(PranaamApiUrls.getPranaamCoupons, requestJson);
    if (response.viewStatus == Status.complete) {
      response.data = ApplyCouponResponse.fromJson(response.data);
    }
    return response;
  }

  /// API is used to get cart details of user
  Future<ADResponseState> fetchCartDetails({
    String? oldUserAgentId,
    bool isGuestLogin = false,
  }) async {
    Map<String, dynamic> apiHeader = APIHeaderUtils.flightBookingHeaders();
    if (isGuestLogin) {
      apiHeader = APIHeaderUtils.flightBookingHeaders(
        isGuestLoggedIn: isGuestLogin,
        oldAgentID: oldUserAgentId,
        anonymousKeyName: 'anonymousUserId',
      );
    }
    _adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);
    final ADResponseState response = await _adApiClient.get(
      path: PranaamApiUrls.getCartDetail,
      header: apiHeader,
    );

    if (response.viewStatus == Status.complete) {
      response.data = GetCartResponseModel.fromJson(response.data);
    }
    return response;
  }

  ///TODO don't do api calling in compute.
  static Future<ADResponseState> getCartDataInCompute(String path) async {
    final ADApiClient adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);
    final ADResponseState response = await adApiClient.get(
      path: path,
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = GetCartResponseModel.fromJson(response.data);
    }

    return response;
  }

  /// generic Post Request for API
  Future<ADResponseState<dynamic>> postRequest(
    String apiEndPointPath,
    Map<String, dynamic> requestJson,
  ) async {
    final ADResponseState response = await _adApiClient.post(
      path: apiEndPointPath,
      params: jsonEncode(requestJson),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  Future<ADResponseState<dynamic>> deleteRequest(
    String apiEndPointPath,
    Map<String, dynamic> requestJson,
  ) async {
    final ADResponseState response = await _adApiClient.delete(
      path: apiEndPointPath,
      params: jsonEncode(requestJson),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }
}
