/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_item_detail_model.freezed.dart';
part 'loyalty_item_detail_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoyaltyItemDetailModel with _$LoyaltyItemDetailModel {
  const factory LoyaltyItemDetailModel({
    @JsonKey(name: 'data')
    @Default([])
        List<LoyaltyItemDetailData> loyaltyItemDetailData,
  }) = _LoyaltyItemDetailModel;

  factory LoyaltyItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyItemDetailModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoyaltyItemDetailData with _$LoyaltyItemDetailData {
  const factory LoyaltyItemDetailData({
    @Default('') String name,
    @Default(0) int quantity,
    @Default(0) int price,
  }) = _LoyaltyItemDetailData;

  factory LoyaltyItemDetailData.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyItemDetailDataFromJson(json);
}
