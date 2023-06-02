/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_history_model.freezed.dart';
part 'loyalty_history_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoyaltyHistoryModel with _$LoyaltyHistoryModel {
  const factory LoyaltyHistoryModel({
    @JsonKey(name: 'data')
    @Default([])
        List<LoyaltyHistoryData> loyaltyHistoryData,
  }) = _LoyaltyHistoryModel;

  factory LoyaltyHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyHistoryModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoyaltyHistoryData with _$LoyaltyHistoryData {
  const factory LoyaltyHistoryData({
    // @Default(0) int txnId,
    // @Default(0) int txnMerchantNo,
    // @Default('') String txnDate,
    // @Default('') String title,
    // @Default('') String txnLoyaltyInfo,
    // @Default('') String txnExternalRef,
    // @Default('') String txnCrDbInd,
    // @Default('') String txnBusinessSubType,
    // @Default('') String txnBrandName,
    // @Default('') String completionDate,
    // @Default(0) int txnRewardQty,
    // @Default(0) double txnAmount,
    // @Default([]) List<dynamic> txnDetails,

    @Default('') String transactionReferenceId,
    @Default('') String orderReferenceId,
    @Default('') String partnerTransactionReferenceId,
    @Default('') String merchantId,
    @Default('') String transactionDate,
    @Default('') String transactionType,
    @Default(0) int loyaltyPoints,
    @Default('') String completionDate,
    @Default('') String business,
    @Default('') String title,
    @Default('') String businessSubType,
    @Default([]) List<String> orderReferences,
  }) = _LoyaltyHistoryData;

  factory LoyaltyHistoryData.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyHistoryDataFromJson(json);
}
