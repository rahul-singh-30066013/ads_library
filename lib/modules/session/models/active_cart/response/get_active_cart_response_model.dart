/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_active_cart_response_model.freezed.dart';
part 'get_active_cart_response_model.g.dart';

/// Class is used parsed the response get from GetActiveCartAPI
/// Response :
///  "data": {
///         "businessSubType": "Pranaam",
///         "businessType": "Airport",
///         "cartId": "628203e40819159035b110b8",
///         "itenaryId": null,
///         "productType": "Departure",
///         "productCount": 1
///     }
@Freezed(makeCollectionsUnmodifiable: false)
abstract class GetActiveCartResponseModel with _$GetActiveCartResponseModel {
  const factory GetActiveCartResponseModel({
    @JsonKey(name: 'businessSubType') @Default('') String businessSubType,
    @JsonKey(name: 'businessType') @Default('') String businessType,
    @JsonKey(name: 'cartId') @Default('') String cartId,
    @JsonKey(name: 'itenaryId') @Default('') String itenaryId,
    @JsonKey(name: 'productType') @Default('') String productType,
    @JsonKey(name: 'productCount') @Default(0) int productCount,
  }) = _GetActiveCartResponseModel;

  factory GetActiveCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetActiveCartResponseModelFromJson(json);
}
