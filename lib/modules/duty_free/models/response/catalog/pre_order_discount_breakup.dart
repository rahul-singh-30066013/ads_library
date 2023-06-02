/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pre_order_discount_breakup.freezed.dart';
part 'pre_order_discount_breakup.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PreOrderDiscountBreakup with _$PreOrderDiscountBreakup {
  const factory PreOrderDiscountBreakup({
    @Default('') String material,
    @Default(0) double amount,
  }) = _PreOrderDiscountBreakup;

  factory PreOrderDiscountBreakup.fromJson(Map<String, dynamic> json) =>
      _$PreOrderDiscountBreakupFromJson(json);
}
