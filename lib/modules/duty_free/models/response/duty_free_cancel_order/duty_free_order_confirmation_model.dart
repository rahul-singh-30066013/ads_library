import 'dart:convert';

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/pre_order_discount_breakup.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/promo_code_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_cancel_order_sku_details.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_status_history_details_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/passenger_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_order_confirmation_model.freezed.dart';
part 'duty_free_order_confirmation_model.g.dart';

DutyFreeOrderConfirmationModel dutyFreeOrderConfirmationModelFromJson(
  String str,
) =>
    DutyFreeOrderConfirmationModel.fromJson(json.decode(str));
String dutyFreeOrderConfirmationModelToJson(
  DutyFreeOrderConfirmationModel data,
) =>
    json.encode(data.toJson());

@freezed
class DutyFreeOrderConfirmationModel with _$DutyFreeOrderConfirmationModel {
  const factory DutyFreeOrderConfirmationModel({
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
    dynamic earning,
    @Default(false) bool isFullfilled,
  }) = _DutyFreeOrderConfirmationModel;

  factory DutyFreeOrderConfirmationModel.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeOrderConfirmationModelFromJson(json);
}

@freezed
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

@freezed
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

@freezed
class DutyfreeDetail with _$DutyfreeDetail {
  const factory DutyfreeDetail({
    String? id,
    String? customerId,
    String? airportCode,
    @Default([]) List<DutyFreeCancelOrderSKUDetails> itemDetails,
    @Default([]) List<PassengerDetailsResponse> passengerDetail,
    @Default(PromoCodeResponse()) PromoCodeResponse promoCoupon,
    // PromoCoupon? promoCoupon,
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

@freezed
class PreOrderDiscount with _$PreOrderDiscount {
  const factory PreOrderDiscount({
    double? amount,
    String? currency,
    int? percentageDiscount,
  }) = _PreOrderDiscount;

  factory PreOrderDiscount.fromJson(Map<String, dynamic> json) =>
      _$PreOrderDiscountFromJson(json);
}

@freezed
class DiscountPrice with _$DiscountPrice {
  const factory DiscountPrice({
    double? amount,
    String? currency,
  }) = _DiscountPrice;

  factory DiscountPrice.fromJson(Map<String, dynamic> json) =>
      _$DiscountPriceFromJson(json);
}

@freezed
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

// @freezed
// class ItemStatus with _$ItemStatus {
//   const factory ItemStatus({
//     List<ItemStatusStatusHistory>? statusHistory,
//   }) = _ItemStatus;
//
//   factory ItemStatus.fromJson(Map<String, dynamic> json) => _$ItemStatusFromJson(json);
// }

// @freezed
// class ItemStatusStatusHistory with _$ItemStatusStatusHistory {
//   const factory ItemStatusStatusHistory({
//     String? status,
//     DateTime? modifiedOn,
//   }) = _ItemStatusStatusHistory;
//
//   factory ItemStatusStatusHistory.fromJson(Map<String, dynamic> json) => _$ItemStatusStatusHistoryFromJson(json);
// }

@freezed
class Promotion with _$Promotion {
  const factory Promotion({
    int? promotionType,
    int? promotionQty,
    String? promotionCode,
    int? offer,
    dynamic offerText,
  }) = _Promotion;

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);
}

@freezed
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

@freezed
class PromoCoupon with _$PromoCoupon {
  const factory PromoCoupon({
    String? promoCode,
    int? offerValue,
    String? promoValueType,
    dynamic calculationBasedOnAmount,
    List<dynamic>? fundingPartners,
    bool? merchantFunded,
    bool? isInstantDiscount,
  }) = _PromoCoupon;

  factory PromoCoupon.fromJson(Map<String, dynamic> json) =>
      _$PromoCouponFromJson(json);
}

@freezed
class DutyFreeCancelOrderDetailsStatusHistory
    with _$DutyFreeCancelOrderDetailsStatusHistory {
  const factory DutyFreeCancelOrderDetailsStatusHistory({
    String? status,
    DateTime? createdOn,
  }) = _DutyFreeCancelOrderDetailsStatusHistory;

  factory DutyFreeCancelOrderDetailsStatusHistory.fromJson(
          Map<String, dynamic> json,) =>
      _$DutyFreeCancelOrderDetailsStatusHistoryFromJson(json);
}

@freezed
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

@freezed
class PaidBy with _$PaidBy {
  const factory PaidBy({
    Bank? bank,
    dynamic loyalty,
    dynamic promo,
  }) = _PaidBy;

  factory PaidBy.fromJson(Map<String, dynamic> json) => _$PaidByFromJson(json);
}

@freezed
class Bank with _$Bank {
  const factory Bank({
    double? amount,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}
