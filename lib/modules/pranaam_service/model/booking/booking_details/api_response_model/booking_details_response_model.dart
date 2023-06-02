/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/add_ons_list_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/billing_info.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/placard_info.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/travellers_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/trip_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_details_response_model.freezed.dart';
part 'booking_details_response_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class BookingDetailsResponseModel with _$BookingDetailsResponseModel {
  const factory BookingDetailsResponseModel({
    @JsonKey(name: 'createBooking') required CreateBooking createBooking,
    @JsonKey(name: 'packageDeatil')
    @Default(PackageDetail())
        PackageDetail packageDeatil,
    @JsonKey(name: 'standAloneProductDetails')
    @Default(PackageDetail())
        PackageDetail standAloneProductDetails,
  }) = _BookingDetailsResponseModel;

  factory BookingDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailsResponseModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class CreateBooking with _$CreateBooking {
  const factory CreateBooking({
    @JsonKey(name: 'userId') @Default('') String userId,
    @JsonKey(name: 'orderId') @Default('') String orderId,
    @JsonKey(name: 'transctionID') @Default('') String transactionId,
    @JsonKey(name: 'travelSectorId') @Default(0) int travelSectorId,
    @JsonKey(name: 'serviceTypeId') @Default(0) int serviceTypeId,
    @JsonKey(name: 'bookedOn') @Default('') String bookedOn,
    @JsonKey(name: 'numberOfAdult') @Default(0) int numberOfAdult,
    @JsonKey(name: 'numberOfChild') @Default(0) int numberOfChild,
    @JsonKey(name: 'numberOfInfant') @Default(0) int numberOfInfant,
    @JsonKey(name: 'bookingStatusId') @Default(0) int bookingStatusId,
    @JsonKey(name: 'packageId') @Default(0) int packageId,
    @JsonKey(name: 'tripDetail') required TripDetail tripDetail,
    @JsonKey(name: 'roundTripDetail')
    @Default(TripDetail())
        TripDetail roundTripDetail,
    @JsonKey(name: 'totalPrice') @Default(0) double totalPrice,
    @JsonKey(name: 'travelers') @Default([]) List<TravellersModel> travelers,
    @JsonKey(name: 'overallStatus') required OverallStatus? overallStatus,
    @JsonKey(name: 'isPartialCancell') @Default(false) bool isPartialCancel,
    @JsonKey(name: 'isUpgradeAvailable')
    @Default(false)
        bool isUpgradeAvailable,
    @JsonKey(name: 'isGroupPackage') @Default(false) bool isGroupPackage,
    // @JsonKey(name: 'pranaamBookingType') String? pranaamBookingType,
    @JsonKey(name: 'placardInfo')
    @Default(PlacardInfo())
        PlacardInfo placardInfo,
    @JsonKey(name: 'billingInfo')
    @Default(BillingInfo())
        BillingInfo billingInfo,
    @JsonKey(name: 'addOnsList') @Default([]) List<AddOnsListModel> addOnsList,
    @JsonKey(name: 'loyaltyPoint')
    @Default(LoyaltyPoint())
        LoyaltyPoint? loyaltyPoint,
    @JsonKey(name: 'paymentDetails')
    @Default([])
        List<PaymentDetails> paymentDetails,
    @JsonKey(name: 'refundDetails')
    @Default([])
        List<PaymentDetails> refundDetails,
    @JsonKey(name: 'rescheduleDetail')
    @Default(RescheduleDetail())
        RescheduleDetail rescheduleDetail,
    @JsonKey(name: 'totalFare') @Default(TotalFare()) TotalFare totalFare,
    @JsonKey(name: 'totalTax') @Default(TotalFare()) TotalFare totalTax,
    @JsonKey(name: 'isFullfilled') @Default(false) bool isFullfilled,
    @JsonKey(name: 'pranaamBookingType') @Default('') String pranaamBookingType,
  }) = _CreateBooking;

  factory CreateBooking.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class RescheduleDetail with _$RescheduleDetail {
  const factory RescheduleDetail({
    @JsonKey(name: 'originalBookingId') @Default(0) int originalBookingId,
    @JsonKey(name: 'isReschedule') @Default(false) bool isReschedule,
    @JsonKey(name: 'rescheduleAdultCharges')
    @Default(0.0)
        double rescheduleAdultCharges,
    @JsonKey(name: 'rescheduleChildCharges')
    @Default(0.0)
        double rescheduleChildCharges,
    @JsonKey(name: 'rescheduleInfantCharges')
    @Default(0.0)
        double rescheduleInfantCharges,
    @JsonKey(name: 'rescheduleAdultChargesCGST')
    @Default(0.0)
        double rescheduleAdultChargesCgst,
    @JsonKey(name: 'rescheduleChildChargesCGST')
    @Default(0.0)
        double rescheduleChildChargesCgst,
    @JsonKey(name: 'rescheduleInfantChargesCGST')
    @Default(0.0)
        double rescheduleInfantChargesCgst,
    @JsonKey(name: 'rescheduleAdultChargesSGST')
    @Default(0.0)
        double rescheduleAdultChargesSgst,
    @JsonKey(name: 'rescheduleChildChargesSGST')
    @Default(0.0)
        double rescheduleChildChargesSgst,
    @JsonKey(name: 'rescheduleInfantChargesSGST')
    @Default(0.0)
        double rescheduleInfantChargesSgst,
  }) = _RescheduleDetail;

  factory RescheduleDetail.fromJson(Map<String, dynamic> json) =>
      _$RescheduleDetailFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class OverallStatus with _$OverallStatus {
  const factory OverallStatus(List<StatusHistory> statusHistory) =
      _OverallStatus;

  factory OverallStatus.fromJson(Map<String, dynamic> json) =>
      _$OverallStatusFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TripStatus with _$TripStatus {
  const factory TripStatus({
    @JsonKey(name: 'statusHistory')
    @Default([])
        List<TripStatusStatusHistory> statusHistory,
  }) = _TripStatus;

  factory TripStatus.fromJson(Map<String, dynamic> json) =>
      _$TripStatusFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class TripStatusStatusHistory with _$TripStatusStatusHistory {
  const factory TripStatusStatusHistory({
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'orderStatus') @Default('') String orderStatus,
    @JsonKey(name: 'modifiedOn') @Default('') String modifiedOn,
  }) = _TripStatusStatusHistory;

  factory TripStatusStatusHistory.fromJson(Map<String, dynamic> json) =>
      _$TripStatusStatusHistoryFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class LoyaltyPoint with _$LoyaltyPoint {
  const factory LoyaltyPoint({
    @JsonKey(name: 'loyaltyPointByTransactions')
        LoyaltyPointByTransactions? loyaltyPointByTransactions,
    @JsonKey(name: 'pendingRewardPoints') @Default(0) int pendingRewardPoints,
    @JsonKey(name: 'earnedRewardPoints') @Default(0) int earnedRewardPoints,
    @JsonKey(name: 'burnedRewardPoints') @Default(0) int burnedRewardPoints,
  }) = _LoyaltyPoint;

  factory LoyaltyPoint.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyPointFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class LoyaltyPointByTransactions with _$LoyaltyPointByTransactions {
  const factory LoyaltyPointByTransactions({
    @JsonKey(name: 'lastpendingRewardPoints')
    @Default(0)
        int lastpendingRewardPoints,
    @JsonKey(name: 'earnedRewardPoints') @Default(0) int earnedRewardPoints,
    @JsonKey(name: 'lastburnedRewardPoints')
    @Default(0)
        int lastburnedRewardPoints,
  }) = _LoyaltyPointByTransactions;

  factory LoyaltyPointByTransactions.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyPointByTransactionsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PaymentDetails with _$PaymentDetails {
  const factory PaymentDetails({
    @Default('') String transactionMode,
    @Default('') String transactionCode,
    @Default('') String status,
    @Default(0) double amount,
  }) = _PaymentDetails;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class StatusHistory with _$StatusHistory {
  const factory StatusHistory({
    @Default('') String status,
    @Default('') String orderStatus,
    @Default('') String modifiedOn,
  }) = _StatusHistory;

  factory StatusHistory.fromJson(Map<String, dynamic> json) =>
      _$StatusHistoryFromJson(json);
}
