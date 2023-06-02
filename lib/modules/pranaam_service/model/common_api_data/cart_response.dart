/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/travellers_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/trip_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CartResponse with _$CartResponse {
  const factory CartResponse({
    @JsonKey(name: 'userId') @Default('') String userId,
    @JsonKey(name: 'oldBookingReferenceId') @Default('') String oldBookingReferenceId,
    @JsonKey(name: 'packageDetail')
    @Default(PackageDetail())
        PackageDetail packageDetail,
    @JsonKey(name: 'travelers') @Default([]) List<TravellersModel> travelers,
    @JsonKey(name: 'tripDetail') required TripDetail tripDetail,
    @JsonKey(name: 'packageAddOn') @Default([]) List<PackageAddOn> packageAddOn,
    @JsonKey(name: 'pricingInfo')
    @Default(PricingInfo())
        PricingInfo pricingInfo,
    @JsonKey(name: 'upgradePricingInfo')
    @Default(PricingInfo())
        PricingInfo upgradePricingInfo,
    @JsonKey(name: 'oldpricingInfo')
    @Default(OldPricingInfo())
        OldPricingInfo oldPricingInfo,
    @JsonKey(name: 'availiableAddOn')
    @Default([])
        List<PackageAddOn> availiableAddOn,
    @JsonKey(name: 'totalFare') @Default(TotalFare()) TotalFare totalFare,
    @JsonKey(name: 'potentialLoyaltyEarning')
    @Default(0)
        int potentialLoyaltyEarning,
    @JsonKey(name: 'pranaamBookingType') @Default('') String pranaamBookingType,
    @JsonKey(name: 'bookingId') @Default(0) int bookingId,
    @JsonKey(name: 'totalTax') @Default(TotalFare()) TotalFare totalTax,
    @JsonKey(name: 'standaloneProductDetails')
    @Default(PackageDetail())
    PackageDetail standaloneProductDetails,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class OldPricingInfo with _$OldPricingInfo {
  const factory OldPricingInfo({
    @JsonKey(name: 'totalFare') @Default(TotalFare()) TotalFare totalFare,
    @JsonKey(name: 'totalBaseFare')
    @Default(TotalFare())
        TotalFare totalBaseFare,
    @JsonKey(name: 'totalTax') @Default(TotalTax()) TotalTax totalTax,
    @JsonKey(name: 'passengerTypeQuantity')
    @Default(PassengerTypeQuantity())
        PassengerTypeQuantity passengerTypeQuantity,
    @Default(TotalExpressFare()) TotalExpressFare totalExpressFare,
  }) = _OldPricingInfo;

  factory OldPricingInfo.fromJson(Map<String, dynamic> json) =>
      _$OldPricingInfoFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TotalFare with _$TotalFare {
  const factory TotalFare({
    @JsonKey(name: 'amount') @Default(0) double amount,
    @JsonKey(name: 'cgst') @Default(0) double cgst,
    @JsonKey(name: 'sgst') @Default(0) double sgst,
    @JsonKey(name: 'currencyCode') @Default('') String currencyCode,
  }) = _TotalFare;

  factory TotalFare.fromJson(Map<String, dynamic> json) =>
      _$TotalFareFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TotalTax with _$TotalTax {
  const factory TotalTax({
    @JsonKey(name: 'amount') @Default(0) double amount,
    @JsonKey(name: 'currencyCode') @Default('') String currencyCode,
    @JsonKey(name: 'sgst') @Default(Gst()) Gst sgst,
    @JsonKey(name: 'cgst') @Default(Gst()) Gst cgst,
  }) = _TotalTax;

  factory TotalTax.fromJson(Map<String, dynamic> json) =>
      _$TotalTaxFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Gst with _$Gst {
  const factory Gst({
    @JsonKey(name: 'amount') @Default(0) double amount,
    @JsonKey(name: 'percentage') @Default(0) double percentage,
  }) = _Gst;

  factory Gst.fromJson(Map<String, dynamic> json) => _$GstFromJson(json);
}

