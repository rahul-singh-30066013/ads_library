/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_point.freezed.dart';
part 'loyalty_point.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class LoyaltyPoint with _$LoyaltyPoint {
  const factory LoyaltyPoint({
    @Default(0) num pendingRewardPoints,
    @Default(0) num earnedRewardPoints,
    @Default(0) num burnedRewardPoints,
  }) = _LoyaltyPoint;

  factory LoyaltyPoint.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyPointFromJson(json);
}
