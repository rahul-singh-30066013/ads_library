/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/coupon_detail.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/earning.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/order_detail.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/refund_breakup.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/transaction_history.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_isolate_model.dart';

class CommonOrderDetailBaseResponse {
  String? id;
  String? orderReferenceId;
  String? orderId;
  String? transactionReferenceId;
  String? processedAs;
  String? customerId;
  String? businessType;
  String? businessSubType;
  int? grossAmount;
  int? totalAmount;
  String? status;
  OrderDetail? orderDetail;
  String? createdOn;
  List<StatusHistory>? statusHistory;
  List<StatusHistory>? roundTripHistory;
  String? modifiedOn;
  String? cancelType;
  Earning? earning;
  bool isRewardEarned = false;
  List<TransactionHistory>? transactionHistory;
  List<RefundBreakup>? refundBreakup;
  List<CouponDetail>? couponDetail;

  CommonOrderDetailBaseResponse({
    this.id,
    this.orderReferenceId,
    this.orderId,
    this.transactionReferenceId,
    this.processedAs,
    this.customerId,
    this.businessType,
    this.businessSubType,
    this.grossAmount,
    this.totalAmount,
    this.status,
    this.orderDetail,
    this.createdOn,
    this.statusHistory,
    this.roundTripHistory,
    this.modifiedOn,
    this.cancelType,
    this.earning,
    this.isRewardEarned = false,
    this.transactionHistory,
    this.refundBreakup,
  });

  CommonOrderDetailBaseResponse.fromJson(
    FlightListIsolateModel model,
  ) {
    if (model.jsonData['id'] is String) {
      id = model.jsonData['id'];
    }
    if (model.jsonData['orderReferenceId'] is String) {
      orderReferenceId = model.jsonData['orderReferenceId'];
    }
    if (model.jsonData['orderId'] is String) {
      orderId = model.jsonData['orderId'];
    }
    if (model.jsonData['transactionReferenceId'] is String) {
      transactionReferenceId = model.jsonData['transactionReferenceId'];
    }
    if (model.jsonData['statusHistory'] != null) {
      statusHistory = <StatusHistory>[];
      for (final Map<String, dynamic> result
          in model.jsonData['statusHistory']) {
        statusHistory?.add(StatusHistory.fromJson(result));
      }
    }
    if (model.jsonData['roundTripHistory'] != null) {
      roundTripHistory = <StatusHistory>[];
      for (final Map<String, dynamic> result
          in model.jsonData['roundTripHistory']) {
        roundTripHistory?.add(StatusHistory.fromJson(result));
      }
    }
    if (model.jsonData['processedAs'] is String) {
      processedAs = model.jsonData['processedAs'];
    }
    if (model.jsonData['customerId'] is String) {
      customerId = model.jsonData['customerId'];
    }
    if (model.jsonData['businessType'] is String) {
      businessType = model.jsonData['businessType'];
    }
    if (model.jsonData['businessSubType'] is String) {
      businessSubType = model.jsonData['businessSubType'];
    }
    if (model.jsonData['grossAmount'] is num) {
      grossAmount = (model.jsonData['grossAmount'] as num).toInt();
    }
    if (model.jsonData['totalAmount'] is num) {
      totalAmount = (model.jsonData['totalAmount'] as num).toInt();
    }
    if (model.jsonData['status'] is String) {
      status = model.jsonData['status'];
    }
    if (model.jsonData['orderDetail'] is Map) {
      orderDetail = model.jsonData['orderDetail'] == null
          ? null
          : OrderDetail.fromJson(
              model.jsonData['orderDetail'],
              statusHistory?.last.status,
              model,
            );
    }
    if (model.jsonData['createdOn'] is String) {
      createdOn = model.jsonData['createdOn'];
    }

    if (model.jsonData['modifiedOn'] is String) {
      modifiedOn = model.jsonData['modifiedOn'];
    }
    if (model.jsonData['cancelType'] is String) {
      cancelType = model.jsonData['cancelType'];
    }
    if (model.jsonData['earning'] is Map) {
      earning = model.jsonData['earning'] == null
          ? null
          : Earning.fromJson(model.jsonData['earning']);
    }
    if (model.jsonData['isRewardEarned'] is bool) {
      isRewardEarned = model.jsonData['isRewardEarned'];
    }
    if (model.jsonData['transactionHistory'] is List) {
      transactionHistory = model.jsonData['transactionHistory'] == null
          ? null
          : (model.jsonData['transactionHistory'] as List)
              .map((e) => TransactionHistory.fromJson(e))
              .toList();
    }
    if (model.jsonData['refundBreakup'] is List) {
      refundBreakup = model.jsonData['refundBreakup'] == null
          ? null
          : (model.jsonData['refundBreakup'] as List)
              .map((e) => RefundBreakup.fromJson(e))
              .toList();
    }
    if (model.jsonData['couponDetail'] is List) {
      couponDetail = model.jsonData['couponDetail'] == null
          ? null
          : (model.jsonData['couponDetail'] as List)
              .map((e) => CouponDetail.fromJson(e))
              .toList();
    }
  }

  String getOrderedPaymentModes() {
    String paymentMode = '';
    for (int index = 0; index < (transactionHistory?.length ?? 0); index++) {
      final TransactionHistory? element = transactionHistory?[index];
      // if (element?.status == 'SUCCESS') {
      if ((element?.paidBy?.bank?.amount ?? 0) != 0) {
        paymentMode = element?.transactionMode ?? '';
      }
      // }
    }
    return paymentMode;
  }

  double isPromoApplied() {
    double promoAmount = 0;
    if(couponDetail!=null && (couponDetail?.length??0)>0){
      if(couponDetail?.first.type=='REWARD_POINTS'){
        promoAmount=0;

      }
      else{
        for (int index = 0; index < (transactionHistory?.length ?? 0); index++) {
          final TransactionHistory? element = transactionHistory?[index];
          // if (element?.status == 'SUCCESS') {
          if (element?.paidBy?.promo != null) {
            promoAmount = element?.paidBy?.promo?.amount ?? 0;
          }
          // }
        }
      }
    }

    return promoAmount;
  }

  double isLoyaltyApplied() {
    double loyaltyAmount = 0;
    for (int index = 0; index < (transactionHistory?.length ?? 0); index++) {
      final TransactionHistory? element = transactionHistory?[index];
      // if (element?.status == 'SUCCESS') {
      if (element?.paidBy?.loyalty != null) {
        loyaltyAmount = element?.paidBy?.loyalty?.amount ?? 0;
      }
      // }
    }
    return loyaltyAmount;
  }
}

class StatusHistory {
  String? status;
  String? orderStatus;
  String? createdOn;
  String? description;
  String? progress;

  StatusHistory({
    this.status,
    this.orderStatus,
    this.createdOn,
    this.description,
    this.progress,
  });

  StatusHistory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderStatus = json['orderStatus'];
    createdOn = json['createdOn'];
    description = json['description'];
    progress = json['progress'];
  }
}
