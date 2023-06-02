/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// Helper class for util functions
class Helper {
  /// method for calculating discounted price
  /// by giving actual price/MRP and percentage of discounts
  static num getDiscountedPrice({
    required num actualPrice,
    required num discount,
  }) {
    final num discountPrice = actualPrice * discount ~/ 100;
    final num discountedPrice = actualPrice - discountPrice;
    return discountedPrice;
  }
}
