/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/pre_order_discount_breakup.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/price_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/promo_code_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/passenger_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_cart_response.freezed.dart';
part 'duty_free_cart_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeCartResponse with _$DutyFreeCartResponse {
  const factory DutyFreeCartResponse({
    @Default('0') String id,
    @Default('') String customerId,
    @Default('') String airportCode,
    @Default([]) List<ItemDetailResponse> itemDetails,
    @Default([]) List<PassengerDetailsResponse> passengerDetail,
    PriceDetailResponse? totalAmount,
    PriceDetailResponse? finalAmount,
    PriceDetailResponse? preOrderDiscount,
    PriceDetailResponse? unitPriceResponse,
    PriceDetailResponse? discountPrice,
    PromoCodeResponse? promoCoupon,
    @Default(0) num loyaltyPotentialPoint,
    @Default('') String collectionPoint,
    @Default('') String store,
    @Default(0) num totalDiscountedPrice,
    @Default(0) num totalUnitPrice,
    @Default([]) List<PreOrderDiscountBreakup> preOrderDiscountBreakup,
  }) = _DutyFreeCartResponse;

  factory DutyFreeCartResponse.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeCartResponseFromJson(json);
}
