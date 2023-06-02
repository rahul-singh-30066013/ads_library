/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_addon.freezed.dart';
part 'package_addon.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PackageAddOn with _$PackageAddOn {
  const factory PackageAddOn({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'packageId') @Default(0) int packageId,
    @JsonKey(name: 'addOnServiceId') @Default(0) int addOnServiceId,
    @JsonKey(name: 'addOnServiceName') @Default('') String addOnServiceName,
    @JsonKey(name: 'addOnImage') String? addOnImage,
    @JsonKey(name: 'addOnServiceDescription')
    @Default('')
        String addOnServiceDescription,
    @JsonKey(name: 'price') @Default(0) double price,
    @JsonKey(name: 'basePrice') @Default(0) double basePrice,
    @JsonKey(name: 'qty') @Default(0) int qty,
    @JsonKey(name: 'totalPrice') @Default(0) double totalPrice,
  }) = _PackageAddOn;

  factory PackageAddOn.fromJson(Map<String, dynamic> json) =>
      _$PackageAddOnFromJson(json);
}
