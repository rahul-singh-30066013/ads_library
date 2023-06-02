/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// To parse this JSON data, do
//
//     final addCartItemRequest = addCartItemRequestFromJson(jsonString);

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/trip_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_cart_item_request_model.freezed.dart';
part 'add_cart_item_request_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class AddCartItemRequestModel with _$AddCartItemRequestModel {
  const factory AddCartItemRequestModel({
    @JsonKey(name: 'travelSectorId') required int travelSectorId,
    @JsonKey(name: 'serviceTypeId') required int serviceTypeId,
    @JsonKey(name: 'serviceType') required String serviceType,
    @JsonKey(name: 'travelSector') required String travelSector,
    @JsonKey(name: 'PranaamBookingType') required String pranaamBookingType,
    @JsonKey(name: 'OldBookingId') @Default(0) int oldBookingId,
    @JsonKey(name: 'OldBookingReferenceId')
    @Default('')
        String oldBookingReferenceId,
    @JsonKey(name: 'cartNumber') @Default('') String cartNumber,
    @JsonKey(name: 'adultCount') @Default(0) int adultCount,
    @JsonKey(name: 'childCount') @Default(0) int childCount,
    @JsonKey(name: 'infantCount') @Default(0) int infantCount,
    @JsonKey(name: 'createdBy') @Default('') String createdBy,
    @JsonKey(name: 'packageDetail') PackageDetail? packageDetail,
    @JsonKey(name: 'tripDetail') required TripDetail tripDetail,
    // @JsonKey(name: 'pranaamBookingType') @Default('') String pranaamBookingType,
    @JsonKey(name: 'standaloneProductDetails')
        StandaloneProductDetails? standaloneProductDetails,
  }) = _AddCartItemRequestModel;

  factory AddCartItemRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddCartItemRequestModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class StandaloneProductDetails with _$StandaloneProductDetails {
  const factory StandaloneProductDetails({
    @JsonKey(name: 'pricingInfo')
    @Default(PricingInfo())
        PricingInfo pricingInfo,
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'itemCount') @Default(0) int itemCount,
  }) = _StandaloneProductDetails;

  factory StandaloneProductDetails.fromJson(Map<String, dynamic> json) =>
      _$StandaloneProductDetailsFromJson(json);
}
