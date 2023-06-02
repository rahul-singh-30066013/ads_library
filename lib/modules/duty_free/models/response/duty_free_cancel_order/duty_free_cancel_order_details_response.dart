/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/pre_order_discount_breakup.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/promo_code_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_cancel_order_sku_details.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_status_history_details_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/passenger_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_cancel_order_details_response.freezed.dart';
part 'duty_free_cancel_order_details_response.g.dart';

DutyFreeCancelOrderDetailsResponse dutyFreeCancelOrderDetailsResponseFromJson(
  String str,
) =>
    DutyFreeCancelOrderDetailsResponse.fromJson(json.decode(str));

String dutyFreeCancelOrderDetailsResponseToJson(
  DutyFreeCancelOrderDetailsResponse data,
) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeCancelOrderDetailsResponse
    with _$DutyFreeCancelOrderDetailsResponse {
  const factory DutyFreeCancelOrderDetailsResponse({
    String? id,
    String? orderReferenceId,
    String? orderId,
    String? transactionReferenceId,
    List<String>? allTransactionReferenceIds,
    String? processedAs,
    String? customerId,
    String? businessType,
    String? businessSubType,
    num? grossAmount,
    num? totalAmount,
    List<TransactionHistory>? transactionHistory,
    List<dynamic>? couponDetail,
    String? status,
    Charges? charges,
    dynamic cancelType,
    OrderDetail? orderDetail,
    @Default([]) List<DutyFreeStatusHistoryDetailsResponse> statusHistory,
    DateTime? createdOn,
    Earning? earning,
    @Default(false) bool isFullfilled,
  }) = _DutyFreeCancelOrderDetailsResponse;

  factory DutyFreeCancelOrderDetailsResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DutyFreeCancelOrderDetailsResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Charges with _$Charges {
  const factory Charges({
    dynamic convenience,
    dynamic cancellation,
    dynamic gst,
    num? totalTax,
  }) = _Charges;

  factory Charges.fromJson(Map<String, dynamic> json) =>
      _$ChargesFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class OrderDetail with _$OrderDetail {
  const factory OrderDetail({
    String? bookingId,
    String? itineraryId,
    dynamic history,
    dynamic pickupDate,
    dynamic flightbookingDetail,
    DutyfreeDetail? dutyfreeDetail,
    dynamic pranaamDetail,
    dynamic cabDetail,
    dynamic forexDetail,
  }) = _OrderDetail;

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class DutyfreeDetail with _$DutyfreeDetail {
  const factory DutyfreeDetail({
    String? id,
    String? customerId,
    String? airportCode,
    @Default([]) List<DutyFreeCancelOrderSKUDetails> itemDetails,
    @Default([]) List<PassengerDetailsResponse> passengerDetail,
    @Default(PromoCodeResponse()) PromoCodeResponse promoCoupon,
    // List<PassengerDetail>? passengerDetail,
    DiscountPrice? totalAmount,
    DiscountPrice? finalAmount,
    PreOrderDiscount? preOrderDiscount,
    DiscountPrice? unitPriceResponse,
    DiscountPrice? discountPrice,
    List<PreOrderDiscountBreakup>? preOrderDiscountBreakup,
    num? loyaltyPotentialPoint,
    String? collectionPoint,
    dynamic store,
    bool? isOrderPushed,
  }) = _DutyfreeDetail;

  factory DutyfreeDetail.fromJson(Map<String, dynamic> json) =>
      _$DutyfreeDetailFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PreOrderDiscount with _$PreOrderDiscount {
  const factory PreOrderDiscount({
    num? amount,
    String? currency,
    num? percentageDiscount,
  }) = _PreOrderDiscount;

  factory PreOrderDiscount.fromJson(Map<String, dynamic> json) =>
      _$PreOrderDiscountFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class DiscountPrice with _$DiscountPrice {
  const factory DiscountPrice({
    double? amount,
    String? currency,
  }) = _DiscountPrice;

  factory DiscountPrice.fromJson(Map<String, dynamic> json) =>
      _$DiscountPriceFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ItemDetail with _$ItemDetail {
  const factory ItemDetail({
    String? bookingId,
    String? storeType,
    String? materialName,
    String? categoryName,
    String? subCategoryName,
    String? brandName,
    String? skuCode,
    String? skuName,
    int? quantity,
    num? unitPrice,
    num? totalPrice,
    num? discountedPrice,
    String? productImage,
    Promotion? promotion,
    String? skuSize,
    String? skuUnit,
    dynamic skuStatus,
    String? storeCode,
    dynamic loyaltyOffer,
    num? finalUnitPrice,
    num? totalDiscountedPrice,
    num? totalUnitPrice,
    double? preOrderDiscount,
    bool? inStock,
    int? overheadStock,
    int? availableStock,
    dynamic potentialPromoText,
    // ItemStatus? itemStatus,
  }) = _ItemDetail;

  factory ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Promotion with _$Promotion {
  const factory Promotion({
    int? promotionType,
    int? promotionQty,
    String? promotionCode,
    num? offer,
    dynamic offerText,
  }) = _Promotion;

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PassengerDetail with _$PassengerDetail {
  const factory PassengerDetail({
    dynamic customerId,
    String? customerName,
    String? passportNumber,
    String? customerPassportExpiry,
    String? flightNo,
    String? flightTime,
    String? pickupDate,
    String? pickupTime,
    String? mobile,
    String? emailId,
    String? countryCode,
    String? countryName,
    String? customerDob,
    String? countryDialCode,
    bool? isPassenger,
  }) = _PassengerDetail;

  factory PassengerDetail.fromJson(Map<String, dynamic> json) =>
      _$PassengerDetailFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeCancelOrderDetailsStatusHistory
    with _$DutyFreeCancelOrderDetailsStatusHistory {
  const factory DutyFreeCancelOrderDetailsStatusHistory({
    String? status,
    DateTime? createdOn,
  }) = _DutyFreeCancelOrderDetailsStatusHistory;

  factory DutyFreeCancelOrderDetailsStatusHistory.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DutyFreeCancelOrderDetailsStatusHistoryFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TransactionHistory with _$TransactionHistory {
  const factory TransactionHistory({
    String? transactionReferenceId,
    String? status,
    PaidBy? paidBy,
    String? transactionMode,
  }) = _TransactionHistory;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PaidBy with _$PaidBy {
  const factory PaidBy({
    Bank? bank,
    Loyalty? loyalty,
    dynamic promo,
  }) = _PaidBy;

  factory PaidBy.fromJson(Map<String, dynamic> json) => _$PaidByFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Bank with _$Bank {
  const factory Bank({
    double? amount,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}

@freezed
class Loyalty with _$Loyalty {
  const factory Loyalty({
    int? amount,
  }) = _Loyalty;

  factory Loyalty.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyFromJson(json);
}

@freezed
class Earning with _$Earning {
  const factory Earning({
    int? total,
    int? reward,
    int? order,
  }) = _Earning;

  factory Earning.fromJson(Map<String, dynamic> json) =>
      _$EarningFromJson(json);
}
