/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

enum CheckoutErrorCode {
  fbCheckPriceFailed,
  fbPriceIncreased,
  fbPriceDecreased,
  cbUnavailableIntercity,
  cbTimeDifference,
  invalidVPA,
  invalidPaymentMethodCashDiscount,

  ///ERR_INVALID_PAYMENT_METHOD_3
  /*IncorrectCardDetails*/
  invalidPaymentMethodCashBack,

  ///ERR_INVALID_PAYMENT_METHOD_4
  /*IncorrectCardDetails*/
  invalidCardBinCashDiscount,

  ///ERR_INVALID_PAYMENT_METHOD_3
  /*IncorrectCardDetails*/
  invalidCardBinCashBack,

  ///ERR_INVALID_PAYMENT_METHOD_4
  /*IncorrectCardDetails*/
  invalidCardAmountCashDiscount,

  ///ERR_INSUFFICIENT_AMOUNT_3
  /*IncorrectCardDetails*/
  invalidCardAmountCashBack,

  ///ERR_INSUFFICIENT_AMOUNT_4
  /*IncorrectCardDetails*/
  exceeededClaimLimit,

  ///ERR_CARD_MAX_CLAIM_REACHED_3
  /*IncorrectCardDetails*/
  invalidPaymentMethodCashDiscountUpi,

  ///ERR_INVALID_MOP_1
  /*IncorrectCardDetails*/
  invalidPaymentMethodCashBackUpi,

  ///ERR_INVALID_MOP_1
  /*IncorrectCardDetails*/
  loyaltyInsufficientBalance,
  /*LErr001*/
  forexPriceChanged,

  ///flight_booking_no_longer_available
  flightBookingNoLongerAvailable,

  /// Need to Implement
}

// 'ERR_INVALID_MOP_1
/// remain to handle

extension CheckoutErrorCodeExtension on CheckoutErrorCode {
  String get name {
    switch (this) {
      case CheckoutErrorCode.fbCheckPriceFailed:
        return 'flight_booking_check_price_failed';
      case CheckoutErrorCode.fbPriceIncreased:
        return 'flight_booking_price_increased';
      case CheckoutErrorCode.fbPriceDecreased:
        return 'flight_booking_price_decreased';
      case CheckoutErrorCode.cbUnavailableIntercity:
        return 'cab_unavailable_intercity';
      case CheckoutErrorCode.cbTimeDifference:
        return 'cab_time_difference';
      case CheckoutErrorCode.invalidVPA:
        return 'invalid_vpa';
      case CheckoutErrorCode.invalidPaymentMethodCashDiscount:
        return 'invalid_payment_method_cash_discount';
      case CheckoutErrorCode.invalidPaymentMethodCashBack:
        return 'invalid_payment_method_cash_back';
      case CheckoutErrorCode.invalidCardBinCashDiscount:
        return 'invalid_card_bin_cash_discount';
      case CheckoutErrorCode.invalidCardBinCashBack:
        return 'invalid_card_bin_cash_back';
      case CheckoutErrorCode.invalidCardAmountCashDiscount:
        return 'invalid_card_amount_cash_discount';
      case CheckoutErrorCode.invalidCardAmountCashBack:
        return 'invalid_card_amount_cash_back';
      case CheckoutErrorCode.exceeededClaimLimit:
        return 'exceeeded_claim_limit';
      case CheckoutErrorCode.loyaltyInsufficientBalance:
        return 'loyalty_insufficient_balance';
      case CheckoutErrorCode.forexPriceChanged:
        return 'forex_price_changed';
      case CheckoutErrorCode.invalidPaymentMethodCashDiscountUpi:
        return 'invalid_payment_method_cash_discount_upi';
      case CheckoutErrorCode.invalidPaymentMethodCashBackUpi:
        return 'invalid_payment_method_cash_back_upi';
      case CheckoutErrorCode.flightBookingNoLongerAvailable:
        return 'flight_booking_no_longer_available';
    }
  }
}
