/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// To parse this JSON data, do
//
//     final getCartResponseModel = getCartResponseModelFromJson(jsonString);

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_cart_response_model.freezed.dart';
part 'get_cart_response_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class GetCartResponseModel with _$GetCartResponseModel {
  const factory GetCartResponseModel({
    required CartResponse cartResponse,
  }) = _GetCartResponseModel;

  factory GetCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseModelFromJson(json);
}
