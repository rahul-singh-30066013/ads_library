/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';

/// DealProductModel use to pass data in duty free flow screens.
class DealProductModel {
  int? productId;
  String? image;
  String? size;
  String? name;
  num? price;
  num? discount;
  bool? isFavorite;
  int? quantity;
  int? index;
  DutyFreeProductDataModel? item;
  String? catalogType;
  String? from;
  String? skuCode;
  String? timeStamp;
  String? deepLink;
  String? airportCode;
  String? storeType;
  bool? isExclusive;

  DealProductModel({
    this.productId,
    this.image,
    this.size,
    this.name,
    this.price,
    this.discount,
    this.isFavorite,
    this.quantity,
    this.index,
    this.item,
    this.catalogType,
    this.from,
    this.skuCode,
    this.timeStamp,
    this.deepLink,
    this.airportCode,
    this.storeType,
    this.isExclusive,
  });
}
