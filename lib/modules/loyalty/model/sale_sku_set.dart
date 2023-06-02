/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:equatable/equatable.dart';

class SaleSkuSet extends Equatable {
  final String? productId;
  final int? quantity;
  final num? price;
  final String? voucherNo;

  const SaleSkuSet({
    this.productId,
    this.quantity,
    this.price,
    this.voucherNo,
  });

  factory SaleSkuSet.fromJson(Map<String, dynamic> json) => SaleSkuSet(
        productId: json['productId'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as num?,
        voucherNo: json['voucherNo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'quantity': quantity,
        'price': price,
        'voucherNo': voucherNo,
      };

  @override
  List<Object?> get props => [productId, quantity, price, voucherNo];
}
