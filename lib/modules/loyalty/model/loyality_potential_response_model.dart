/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class LoyalityPotentialResponseModel {
  //List<PotentialEarning>? potentialEarning;
  int? potentialEarning;

  LoyalityPotentialResponseModel({
    //  this.potentialEarning,
    this.potentialEarning,
  });

  factory LoyalityPotentialResponseModel.fromJson(Map<String, dynamic> json) {
    return LoyalityPotentialResponseModel(
      // potentialEarning: (json['potentialEarning'] as List<dynamic>?)
      //     ?.map((e) => PotentialEarning.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      potentialEarning: json['potentialEarning'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        //  'potentialEarning': potentialEarning?.map((e) => e.toJson()).toList(),
        'potentialEarning': potentialEarning,
      };
}
