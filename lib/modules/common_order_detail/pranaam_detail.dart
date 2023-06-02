// To parse this JSON data, do
//
//     final pranaamDetail = pranaamDetailFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pranaam_detail.freezed.dart';
part 'pranaam_detail.g.dart';

PranaamDetail pranaamDetailFromJson(String str) =>
    PranaamDetail.fromJson(json.decode(str));

String pranaamDetailToJson(PranaamDetail data) => json.encode(data.toJson());

@freezed
class PranaamDetail with _$PranaamDetail {
  const factory PranaamDetail({
    int? bookingId,
    int? totalLoyalty,
    int? totalPromo,
    String? pranaamBookingType,
    String? refBookingId,
    String? invoiceNo,
    double? finalTotalAmount,
    double? upgradeBankAmount,
    dynamic bookingInvoiceNumber,
    dynamic upgradeBookingInvoiceNumber,
    dynamic rescheduleBookingInvoiceNumber,
    PackageDetail? packageDetail,
    PackageDetail? oldPackageDetail,
    TripDetails? tripDetails,
    TripDetails? oldTripDetails,
    TripDetails? roundTripDetail,
    TripDetails? oldRoundTripDetail,
    List<AddOnService>? addOnServices,
    List<Traveler>? travelers,
    BillingInfo? billingInfo,
    PlacardInfo? placardInfo,
    List<dynamic>? refundHistory,
    List<dynamic>? orderRefund,
    String? dqr,
    dynamic newDqr,
    PackageDetail? standaloneProductDetails,
    TotalFare? totalFare,
    PranaamDetailTotalTax? totalTax,
    FinalPranaamTax? finalPranaamTax,
    @Default(false) bool isUpgradable,
  }) = _PranaamDetail;

  factory PranaamDetail.fromJson(Map<String, dynamic> json) =>
      _$PranaamDetailFromJson(json);
}

@freezed
class PranaamDetailTotalTax with _$PranaamDetailTotalTax {
  const factory PranaamDetailTotalTax({
    double? amount,
    double? cgst,
    double? sgst,
    String? currencyCode,
    double? cgstPercent,
    double? sgstPercent,
  }) = _PranaamDetailTotalTax;

  factory PranaamDetailTotalTax.fromJson(Map<String, dynamic> json) =>
      _$PranaamDetailTotalTaxFromJson(json);
}

@freezed
class FinalPranaamTax with _$FinalPranaamTax {
  const factory FinalPranaamTax({
    double? cgstAmount,
    double? sgstAmount,
    double? cgstPercentage,
    double? sgstPercentage,
    double? totalTax,
  }) = _FinalPranaamTax;

  factory FinalPranaamTax.fromJson(Map<String, dynamic> json) =>
      _$FinalPranaamTaxFromJson(json);
}

@freezed
class AddOnService with _$AddOnService {
  const factory AddOnService({
    @Default('') String serviceName,
    String? serviceDescription,
    @Default(0) double unitPrice,
    @Default(0) int quantity,
    String? userId,
    int? packageId,
    int? addOnServiceId,
    String? addOnImage,
    double? totalPrice,
    double? cgst,
    double? sgst,
    double? totalAddOnTax,
  }) = _AddOnService;

  factory AddOnService.fromJson(Map<String, dynamic> json) =>
      _$AddOnServiceFromJson(json);
}

@freezed
class BillingInfo with _$BillingInfo {
  const factory BillingInfo({
    int? salutationId,
    String? firstName,
    String? lastName,
    String? countryDialCode,
    String? mobile,
    String? birthDate,
    String? email,
    String? addressLine1,
    String? addressLine2,
    String? countryName,
    String? cityName,
    String? stateName,
    int? countryId,
    String? pincode,
    int? cityId,
    int? stateId,
    BillingGstin? billingGstin,
  }) = _BillingInfo;

  factory BillingInfo.fromJson(Map<String, dynamic> json) =>
      _$BillingInfoFromJson(json);
}

@freezed
class BillingGstin with _$BillingGstin {
  const factory BillingGstin({
    dynamic gstNumber,
    String? name,
    String? mobileNumber,
    String? email,
    String? address,
    int? countryId,
    int? pinCode,
    int? cityId,
    int? stateId,
    dynamic billingGstinGstNumber,
  }) = _BillingGstin;

  factory BillingGstin.fromJson(Map<String, dynamic> json) =>
      _$BillingGstinFromJson(json);
}

@freezed
class PackageDetail with _$PackageDetail {
  const factory PackageDetail({
    int? packageId,
    String? name,
    String? shortDesc,
    String? packageImageUrl,
    String? packageNumber,
    int? adultCount,
    int? childCount,
    int? infantCount,
    double? adultPrice,
    double? childPrice,
    double? infantPrice,
    int? itemCount,
    int? count,
    bool? isGroupPackage,
    double? totalPrice,
    DateTime? createdOn,
    DateTime? updateOn,
    @Default('') String userId,
    dynamic currency,
    PricingInfo? pricingInfo,
    PricingInfo? originalPricingInfo,
    PricingInfo? oldPricingInfo,
    PricingInfo? upgradedPricingInfo,
    PricingInfo? rescheduledPricingInfo,
    int? freeAllowedPorter,
    int? maxAllowedBaggagePerPorter,
    dynamic promoType,
    @Default(RescheduleCharges()) RescheduleCharges rescheduleCharges,
  }) = _PackageDetail;

  factory PackageDetail.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailFromJson(json);
}

@freezed
class PricingInfo with _$PricingInfo {
  const factory PricingInfo({
    TotalFare? totalFare,
    TotalFare? totalBaseFare,
    TotalTax? totalTax,
    TotalFare? totalExpressFare,
    DiscountCouponDetails? discountCouponDetails,
    dynamic currentLoyaltyPoints,
    List<PassengerTypeQuantity>? passengerTypeQuantity,
    dynamic discountCouponDetailsFromPromoApi,
  }) = _PricingInfo;

  factory PricingInfo.fromJson(Map<String, dynamic> json) =>
      _$PricingInfoFromJson(json);
}

@freezed
class DiscountCouponDetails with _$DiscountCouponDetails {
  const factory DiscountCouponDetails({
    int? couponId,
    dynamic couponCode,
    double? couponDiscountAmount,
    dynamic currencyCode,
    bool? isMerchantFunded,
    double? pcmPercentage,
    dynamic promoType,
    double? rewardAndCashBackAmount,
  }) = _DiscountCouponDetails;

  factory DiscountCouponDetails.fromJson(Map<String, dynamic> json) =>
      _$DiscountCouponDetailsFromJson(json);
}

@freezed
class PassengerTypeQuantity with _$PassengerTypeQuantity {
  const factory PassengerTypeQuantity({
    BaseFare? baseFare,
    BaseFare? taxes,
    BaseFare? totalFare,
    BaseFare? expressFare,
    String? code,
    int? quantity,
  }) = _PassengerTypeQuantity;

  factory PassengerTypeQuantity.fromJson(Map<String, dynamic> json) =>
      _$PassengerTypeQuantityFromJson(json);
}

@freezed
class BaseFare with _$BaseFare {
  const factory BaseFare({
    double? amount,
    String? currencyCode,
    double? perPaxAmount,
    List<Tax>? tax,
  }) = _BaseFare;

  factory BaseFare.fromJson(Map<String, dynamic> json) =>
      _$BaseFareFromJson(json);
}

@freezed
class Tax with _$Tax {
  const factory Tax({
    double? amount,
    String? currencyCode,
    String? taxCode,
    String? taxDesc,
    double? perPaxAmount,
    double? taxPercent,
  }) = _Tax;

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);
}

@freezed
class TotalFare with _$TotalFare {
  const factory TotalFare({
    double? amount,
    double? baseFare,
    String? currencyCode,
  }) = _TotalFare;

  factory TotalFare.fromJson(Map<String, dynamic> json) =>
      _$TotalFareFromJson(json);
}

@freezed
class TotalTax with _$TotalTax {
  const factory TotalTax({
    double? amount,
    String? currencyCode,
    Gst? sgst,
    Gst? cgst,
    double? cgstPercent,
    double? sgstPercent,
  }) = _TotalTax;

  factory TotalTax.fromJson(Map<String, dynamic> json) =>
      _$TotalTaxFromJson(json);
}

@freezed
class Gst with _$Gst {
  const factory Gst({
    double? amount,
    double? percentage,
  }) = _Gst;

  factory Gst.fromJson(Map<String, dynamic> json) => _$GstFromJson(json);
}

@freezed
class RescheduleCharges with _$RescheduleCharges {
  const factory RescheduleCharges({
    int? originalBookingId,
    @Default(false) bool isReschedule,
    @Default(0) double rescheduleAdultCharges,
    @Default(0) double rescheduleChildCharges,
    @Default(0) double rescheduleInfantCharges,
    @Default(0) double rescheduleAdultChargesCGST,
    @Default(0) double rescheduleChildChargesCGST,
    @Default(0) double rescheduleInfantChargesCGST,
    @Default(0) double rescheduleAdultChargesSGST,
    @Default(0) double rescheduleChildChargesSGST,
    @Default(0) double rescheduleInfantChargesSGST,
  }) = _RescheduleCharges;

  factory RescheduleCharges.fromJson(Map<String, dynamic> json) =>
      _$RescheduleChargesFromJson(json);
}

@freezed
class PlacardInfo with _$PlacardInfo {
  const factory PlacardInfo({
    int? salutationId,
    String? firstName,
    String? lastName,
    String? countryDialCode,
    String? mobileNumber,
    String? specialInstruction,
    String? porterName,
    int? baggageCount,
  }) = _PlacardInfo;

  factory PlacardInfo.fromJson(Map<String, dynamic> json) =>
      _$PlacardInfoFromJson(json);
}

@freezed
class Traveler with _$Traveler {
  const factory Traveler({
    int? salutationId,
    String? salutationText,
    String? firstName,
    String? lastName,
    int? age,
    int? passengerTypeId,
    dynamic passengerTypeCode,
    String? passengerTypeName,
    String? spocPhone,
    int? nationalityCountryId,
    String? nationalityCountryName,
    int? flyingClassId,
    String? flyingClassName,
    int? passengerId,
    String? passportNumber,
    String? passengerStatus,
    int? passengerStatusId,
    Status? itemStatus,
  }) = _Traveler;

  factory Traveler.fromJson(Map<String, dynamic> json) =>
      _$TravelerFromJson(json);
}

@freezed
class Status with _$Status {
  const factory Status({
    List<StatusHistory>? statusHistory,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

@freezed
class StatusHistory with _$StatusHistory {
  const factory StatusHistory({
    String? status,
    String? modifiedOn,
    String? orderStatus,
  }) = _StatusHistory;

  factory StatusHistory.fromJson(Map<String, dynamic> json) =>
      _$StatusHistoryFromJson(json);
}

@freezed
class TripDetails with _$TripDetails {
  const factory TripDetails({
    String? tripBookingNumber,
    String? tripType,
    int? travelSectorId,
    String? travelSector,
    int? serviceTypeId,
    String? serviceType,
    int? originAirportId,
    String? originAirport,
    int? destinationAirportId,
    String? destinationAirport,
    int? serviceAirportId,
    String? serviceAirport,
    String? serviceAirportName,
    int? businessUnitId,
    DateTime? serviceDateTime,
    String? flightName,
    String? flightNumber,
    String? flightTerminal,
    DateTime? flightDate,
    String? flightTime,
    int? transitDestRoundTripSecOrigin,
    String? transitRoundTripSecFlightName,
    int? transitRoundTripSecFlightNumber,
    String? transitRoundTripSecFlightTerminal,
    String? transitRoundTripSecFlightDate,
    String? transitRoundTripSecFlightTime,
    String? roundTripSecServiceDateTime,
    @Default('') String userId,
    dynamic tripEndBy,
    Status? tripStatus,
  }) = _TripDetails;

  factory TripDetails.fromJson(Map<String, dynamic> json) =>
      _$TripDetailsFromJson(json);
}
