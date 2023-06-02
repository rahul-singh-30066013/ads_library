/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_detail.freezed.dart';
part 'package_detail.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PackageDetail with _$PackageDetail {
  const factory PackageDetail({
    @JsonKey(name: 'pricingInfo')
    @Default(PricingInfo())
        PricingInfo pricingInfo,
    @JsonKey(name: 'rescheduledPricingInfo')
        PricingInfo? rescheduledPricingInfo,
    @JsonKey(name: 'originalPricingInfo') PricingInfo? originalPricingInfo,
    @JsonKey(name: 'oldPricingInfo') PricingInfo? oldPricingInfo,
    @JsonKey(name: 'packageAddOn') @Default([]) List<PackageAddOn> packageAddOn,
    @JsonKey(name: 'cancellationPolicy')
    @Default(CancellationPolicy())
        CancellationPolicy cancellationPolicy,
    @JsonKey(name: 'securityKey')
    @Default(SecurityKey())
        SecurityKey securityKey,
    @JsonKey(name: 'availableService')
    @Default([])
        List<AvailableService> availableService,
    @JsonKey(name: 'sequenceNumber') @Default('') String sequenceNumber,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'shortDesc') @Default('') String shortDesc,
    @JsonKey(name: 'packageNumber') @Default('') String packageNumber,
    @JsonKey(name: 'packageImage') @Default('') String packageImage,
    @JsonKey(name: 'packageImageURL') @Default('') String? packageImageURL,
    @JsonKey(name: 'packageId') @Default(0) int packageId,
    @JsonKey(name: 'businessUnitId') @Default(0) int businessUnitId,
    @JsonKey(name: 'travelSectorId') @Default(0) int travelSectorId,
    @JsonKey(name: 'airportMasterId') @Default(0) int airportMasterId,
    @JsonKey(name: 'serviceTypeId') @Default(0) int serviceTypeId,
    @JsonKey(name: 'freeAllowedPorter') @Default(0) int freeAllowedPorter,
    @JsonKey(name: 'maxAllowedBaggagePerPorter')
    @Default(0)
        int maxAllowedBaggagePerPorter,
    @JsonKey(name: 'isCurrent') @Default(false) bool isCurrent,
    @JsonKey(name: 'itemCount') @Default(0) int itemCount,
    @JsonKey(name: 'count') @Default(0) int count,
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'imageUrl') @Default('') String imageUrl,
    @JsonKey(name: 'isGroupPackage') @Default(false) bool isGroupPackage,
  }) = _PackageDetail;

  factory PackageDetail.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class CancellationPolicy with _$CancellationPolicy {
  const factory CancellationPolicy({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'packageId') @Default(0) int packageId,
    @JsonKey(name: 'hoursBefore') @Default(0) int hoursBefore,
    @JsonKey(name: 'refundableAmountPercentage')
    @Default(0)
        int refundableAmountPercentage,
  }) = _CancellationPolicy;

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) =>
      _$CancellationPolicyFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class AvailableService with _$AvailableService {
  const factory AvailableService({
    @JsonKey(name: 'addOnServiceId') @Default(0) int addOnServiceId,
    @JsonKey(name: 'addOnServiceName') @Default('') String addOnServiceName,
    @JsonKey(name: 'addOnServiceDescription')
    @Default('')
        String addOnServiceDescription,
    @JsonKey(name: 'isAvailiable') @Default(false) bool isAvailiable,
  }) = _AvailableService;

  factory AvailableService.fromJson(Map<String, dynamic> json) =>
      _$AvailableServiceFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PricingInfo with _$PricingInfo {
  const factory PricingInfo({
    @JsonKey(name: 'totalFare') @Default(TotalFare()) TotalFare totalFare,
    @JsonKey(name: 'currentLoyaltyPoints')
    @Default('')
        String currentLoyaltyPoints,
    @JsonKey(name: 'totalBaseFare')
    @Default(TotalBaseFare())
        TotalBaseFare totalBaseFare,
    @JsonKey(name: 'totalTax') @Default(TotalTax()) TotalTax totalTax,
    @JsonKey(name: 'totalExpressFare') TotalExpressFare? totalExpressFare,
    @JsonKey(name: 'discountCouponDetail')
    @Default(DiscountCouponDetail())
        DiscountCouponDetail discountCouponDetail,
    @JsonKey(name: 'passengerTypeQuantity')
    @Default([])
        List<PassengerTypeQuantity> passengerTypeQuantity,
  }) = _PricingInfo;

  factory PricingInfo.fromJson(Map<String, dynamic> json) =>
      _$PricingInfoFromJson(json);
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
class SecurityKey with _$SecurityKey {
  const factory SecurityKey({
    @JsonKey(name: 'securityGuid') @Default('') String securityGuid,
    @JsonKey(name: 'key') @Default('') String key,
  }) = _SecurityKey;

  factory SecurityKey.fromJson(Map<String, dynamic> json) =>
      _$SecurityKeyFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TotalBaseFare with _$TotalBaseFare {
  const factory TotalBaseFare({
    @JsonKey(name: 'amount') @Default(0) double amount,
    @JsonKey(name: 'currencyCode') @Default('') String currencyCode,
  }) = _TotalBaseFare;

  factory TotalBaseFare.fromJson(Map<String, dynamic> json) =>
      _$TotalBaseFareFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TotalExpressFare with _$TotalExpressFare {
  const factory TotalExpressFare({
    @JsonKey(name: 'amount') @Default(0) double amount,
    @JsonKey(name: 'baseFare') @Default(0) double baseFare,
    @JsonKey(name: 'currencyCode') @Default('') String currencyCode,
  }) = _TotalExpressFare;

  factory TotalExpressFare.fromJson(Map<String, dynamic> json) =>
      _$TotalExpressFareFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PassengerTypeQuantity with _$PassengerTypeQuantity {
  const factory PassengerTypeQuantity({
    @JsonKey(name: 'baseFare') @Default(BaseFare()) BaseFare baseFare,
    @JsonKey(name: 'taxes') @Default(BaseFare()) BaseFare taxes,
    @JsonKey(name: 'totalFare') @Default(BaseFare()) BaseFare totalFare,
    @JsonKey(name: 'expressFare')
    @Default(ExpressFare())
        ExpressFare expressFare,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'quantity') @Default(0) int quantity,
  }) = _PassengerTypeQuantity;

  factory PassengerTypeQuantity.fromJson(Map<String, dynamic> json) =>
      _$PassengerTypeQuantityFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class BaseFare with _$BaseFare {
  const factory BaseFare({
    @JsonKey(name: 'amount') @Default(0) double amount,
    @JsonKey(name: 'currencyCode') @Default('') String currencyCode,
    @JsonKey(name: 'perPaxAmount') @Default(0) double perPaxAmount,
    @JsonKey(name: 'tax') @Default([]) List<Tax> tax,
  }) = _BaseFare;

  factory BaseFare.fromJson(Map<String, dynamic> json) =>
      _$BaseFareFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ExpressFare with _$ExpressFare {
  const factory ExpressFare({
    @JsonKey(name: 'amount') @Default(0) double amount,
    @JsonKey(name: 'currencyCode') @Default('') String currencyCode,
    @JsonKey(name: 'perPaxAmount') @Default(0) double perPaxAmount,
    @JsonKey(name: 'totalExpressFare') @Default(0) double totalExpressFare,
    @JsonKey(name: 'taxesExpressFare')
    @Default(BaseFare())
        BaseFare taxesExpressFare,
  }) = _ExpressFare;

  factory ExpressFare.fromJson(Map<String, dynamic> json) =>
      _$ExpressFareFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Tax with _$Tax {
  const factory Tax({
    @JsonKey(name: 'amount') @Default(0) double amount,
    @JsonKey(name: 'currencyCode') @Default('') String currencyCode,
    @JsonKey(name: 'taxCode') @Default('') String taxCode,
    @JsonKey(name: 'taxDesc') @Default('') String taxDesc,
    @JsonKey(name: 'perPaxAmount') @Default(0) double perPaxAmount,
    @JsonKey(name: 'taxPercent') @Default(0) double taxPercent,
  }) = _Tax;

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);
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

@Freezed(makeCollectionsUnmodifiable: false)
class DiscountCouponDetail with _$DiscountCouponDetail {
  const factory DiscountCouponDetail({
    @Default(0) int couponId,
    @Default('') String couponCode,
    @Default(0) double couponDiscountAmount,
    @Default('') String currencyCode,
    @Default('0') String promoType,
  }) = _DiscountCouponDetail;

  factory DiscountCouponDetail.fromJson(Map<String, dynamic> json) =>
      _$DiscountCouponDetailFromJson(json);
}
