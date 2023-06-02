/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class PreCancelResponseModel {
  num? totalPaid;
  num? totalRefund;
  num? promoRefund;
  num? loyaltyRefund;
  num? bankRefund;
  num? cancelationCharges;
  bool? isFullRefund;

  PreCancelResponseModel({
    this.totalPaid,
    this.totalRefund,
    this.promoRefund,
    this.loyaltyRefund,
    this.bankRefund,
    this.cancelationCharges,
    this.isFullRefund,
  });

  PreCancelResponseModel.fromJson(Map<String, dynamic> json) {
    totalPaid = json['totalPaid'];
    totalRefund = json['totalRefund'];
    promoRefund = json['promoRefund'];
    loyaltyRefund = json['loyaltyRefund'];
    bankRefund = json['bankRefund'];
    cancelationCharges = json['cancelationCharges'];
    isFullRefund = json['isFullRefund'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPaid'] = totalPaid;
    data['totalRefund'] = totalRefund;
    data['promoRefund'] = promoRefund;
    data['loyaltyRefund'] = loyaltyRefund;
    data['bankRefund'] = bankRefund;
    data['cancelationCharges'] = cancelationCharges;
    data['isFullRefund'] = isFullRefund;
    return data;
  }
}
