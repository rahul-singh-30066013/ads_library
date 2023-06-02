/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_balance_model.freezed.dart';
part 'loyalty_balance_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoyaltyBalanceModel with _$LoyaltyBalanceModel {
  const factory LoyaltyBalanceModel({
    @Default(0) int availableBalancePoints,
    @Default(0) int totalPendingPoints,
    @Default(0)  int lifetimeEarnedPoints,
    @Default(0)  int lifetimeBurnedPoints,
    @Default(0)  num lifetimeGtv,
  }) = _LoyaltyBalanceModel;

  factory LoyaltyBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyBalanceModelFromJson(json);
}
