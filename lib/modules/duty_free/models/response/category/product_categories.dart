/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_categories.freezed.dart';
part 'product_categories.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProductCategories with _$ProductCategories {
  const factory ProductCategories(
    String? title,
    String? code,
    String? linkUrl,
    String? mimageSrc,
    String? materialGroup,
    String? brand,
    String? category,
    List<ProductCategories>? children, {
    bool? restricted,
    @Default(false) bool disableForAirport,
  }) = _ProductCategories;

  factory ProductCategories.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoriesFromJson(json);
}
