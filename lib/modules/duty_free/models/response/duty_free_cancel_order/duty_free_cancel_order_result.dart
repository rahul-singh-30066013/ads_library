/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/promo_code_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_cancel_order_sku_details.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/passenger_details_response.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_cancel_order_result.freezed.dart';
part 'duty_free_cancel_order_result.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeCancelOrderResult with _$DutyFreeCancelOrderResult {
  const factory DutyFreeCancelOrderResult({
    @Default([]) List<DutyFreeCancelOrderSKUDetails> skuDetail,
    @Default([]) List<PassengerDetailsResponse> passengerDetail,
    @Default(PromoCodeResponse()) PromoCodeResponse promoCoupon,
  }) = _DutyFreeCancelOrderResult;

  factory DutyFreeCancelOrderResult.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeCancelOrderResultFromJson(json);
}
