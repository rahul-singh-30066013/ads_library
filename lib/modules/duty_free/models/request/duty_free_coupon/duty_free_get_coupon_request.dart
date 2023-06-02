/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_get_coupon_request.freezed.dart';
part 'duty_free_get_coupon_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeGetCouponRequest with _$DutyFreeGetCouponRequest {
  const factory DutyFreeGetCouponRequest({
    @Default(0) double amount,
    @Default([]) List<SKUItemRequest> skuItemList,
  }) = _DutyFreeGetCouponRequest;

  factory DutyFreeGetCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeGetCouponRequestFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class SKUItemRequest with _$SKUItemRequest {
  const factory SKUItemRequest(
    String? promoSkuCode,
    String? promoSkuCategoryCode,
    String? promoSkuBrandCode,
    int? promoSkuQty,
    String? promoSkuPrice,
  ) = _SKUItemRequest;

  factory SKUItemRequest.fromJson(Map<String, dynamic> json) =>
      _$SKUItemRequestFromJson(json);
}
