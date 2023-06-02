/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used to receive loyalty related object for booking

class LoyaltyPoints {
  LoyaltyPoints({
    this.burnedRewardPoints,
    this.earnedRewardPoints,
    this.pendingRewardPoints,
    this.isFullfilled,
  });

  final num? burnedRewardPoints;
  final num? earnedRewardPoints;
  final num? pendingRewardPoints;
  final bool? isFullfilled;

  factory LoyaltyPoints.fromJson(Map<String, dynamic> json) => LoyaltyPoints(
        burnedRewardPoints: json['burnedRewardPoints'] ?? 0,
        earnedRewardPoints: json['earnedRewardPoints'] ?? 0,
        pendingRewardPoints: json['pendingRewardPoints'] ?? 0,
        isFullfilled: json['isFullfilled'] ?? false,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['burnedRewardPoints'] = burnedRewardPoints;
    map['earnedRewardPoints'] = earnedRewardPoints;
    map['pendingRewardPoints'] = pendingRewardPoints;
    map['isFullfilled'] = isFullfilled;
    return map;
  }
}
