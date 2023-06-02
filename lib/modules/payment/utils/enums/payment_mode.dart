/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// Type of payment method
enum PaymentMode {
  creditordebitcard,
  upi,
  wallet,
  netbanking,
  loyalty,
  none,
}

// Type of option, i.e, already registered or add a new entry
enum PaymentOptionType { registered, addNew }
