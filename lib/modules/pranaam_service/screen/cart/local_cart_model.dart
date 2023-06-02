/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';

class LocalCartModel {
  final int id;
  final String name;
  final double price;
  bool isCartAddOn;
  int quantity = 0;
  PackageAddOn? packageAddOn;
   String? packageImage;

  LocalCartModel(
    this.id,
    this.name,
    this.price,
    this.quantity, {
    this.isCartAddOn = false,
    this.packageAddOn,
    this.packageImage ,
  });
}
