/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_ons_list_model.freezed.dart';
part 'add_ons_list_model.g.dart';

///
///
///supporting model for creating request json for Create booking api.
///this models have following parameters
/// AddOnServiceId data type Integer default value is 0,
/// UnitPrice data type Integer default value is 0,
/// Quantity data type Integer default value is 0,
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class AddOnsListModel with _$AddOnsListModel {
  @JsonSerializable(explicitToJson: true)
  const factory AddOnsListModel({
    @Default(0) @JsonKey(name: 'addOnServiceId') int addOnServiceId,
    @Default(0) @JsonKey(name: 'unitPrice') double unitPrice,
    @Default(0) @JsonKey(name: 'quantity') int quantity,
    @Default('') @JsonKey(name: 'serviceName') String serviceName,
    @Default(0) @JsonKey(name: 'totalPrice') double totalPrice,
    @Default(0) @JsonKey(name: 'baseTotalPrice') double baseTotalPrice,
    @Default(0) @JsonKey(name: 'cgst') double cgst,
    @Default(0) @JsonKey(name: 'sgst') double sgst,
    @Default(0) @JsonKey(name: 'totalAddOnTax') double totalAddOnTax,
    @Default('') @JsonKey(name: 'addOnImage') String addOnImage,

  }) = _AddOnsListModel;

  factory AddOnsListModel.fromJson(Map<String, dynamic> json) =>
      _$AddOnsListModelFromJson(json);
}
