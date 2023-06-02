/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class PotentialEarning {
  String? productCode;
  int? rewardPoints;
  int? quantity;

  PotentialEarning({this.productCode, this.rewardPoints, this.quantity});

  factory PotentialEarning.fromJson(Map<String, dynamic> json) {
    return PotentialEarning(
      productCode: json['productCode'] as String?,
      rewardPoints: json['rewardPoints'] as int?,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'productCode': productCode,
        'rewardPoints': rewardPoints,
        'quantity': quantity,
      };
}
