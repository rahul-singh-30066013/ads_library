/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// To parse this JSON data, do
//
//     final addCartAddOnRequestModel = addCartAddOnRequestModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_cart_add_on_request_model.freezed.dart';
part 'add_cart_add_on_request_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class AddCartAddOnRequestModel with _$AddCartAddOnRequestModel {
  const factory AddCartAddOnRequestModel({
    required int? packageId,
    required String serviceName,
    required String serviceDescription,
    required double price,
    required int quantity,
    required int addOnServiceId,
  }) = _AddCartAddOnRequestModel;

  factory AddCartAddOnRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddCartAddOnRequestModelFromJson(json);
}
