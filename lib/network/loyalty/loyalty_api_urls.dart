/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class LoyaltyApiUrls {
  //static const _baseName = 'loyalty/Loyalty';
  static const _baseName = 'api/loyaltyv2';
  static const transactionHistoryUrl = '$_baseName/transaction';
  static const pendingHistoryUrl = '$_baseName/transaction';
  static const pointBalanceUrl = '$_baseName/point';
  static const orderDetail = '$_baseName/GetOrderById?';
  static const fetchReferUrl = '$_baseName/customer';
  static const potentialEarning = '$pointBalanceUrl/earning';
}
