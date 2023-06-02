/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_product_specification_model.freezed.dart';
part 'duty_free_product_specification_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeProductSpecificationModel
    with _$DutyFreeProductSpecificationModel {
  const factory DutyFreeProductSpecificationModel({
    @Default('') String key,
    @Default('') String value,
  }) = _DutyFreeProductSpecificationModel;

  factory DutyFreeProductSpecificationModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DutyFreeProductSpecificationModelFromJson(json);
}
