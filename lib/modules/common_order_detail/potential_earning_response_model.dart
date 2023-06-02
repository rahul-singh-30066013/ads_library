/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class PotentialEarningResponseModel {
  int? totalPotentialEarning;
  int? rewardPotentialEarning;
  int? orderPotentialEarning;

  PotentialEarningResponseModel({
    this.totalPotentialEarning,
    this.rewardPotentialEarning,
    this.orderPotentialEarning,
  });

  PotentialEarningResponseModel.fromJson(Map<String, dynamic> json) {
    totalPotentialEarning = json['totalPotentialEarning'];
    rewardPotentialEarning = json['rewardPotentialEarning'];
    orderPotentialEarning = json['orderPotentialEarning'];
  }
}
