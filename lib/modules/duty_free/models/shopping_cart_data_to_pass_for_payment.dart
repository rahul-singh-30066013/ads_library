/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/shopping_cart_model.dart';

///
///this model class is used as object to pass data from shopping cart to payment screen
///

class ShoppingCartDataToPassForPayment {
  ShoppingCartContent? item;
  num? couponValue;
  final bool? fromCart;

  ShoppingCartDataToPassForPayment({
    this.item,
    this.couponValue,
    this.fromCart,
  });
}
