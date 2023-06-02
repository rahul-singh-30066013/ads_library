/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel {
  final List<String>? images;

  @JsonKey(name: 'product_name')
  final String? productName;

  @JsonKey(name: 'actual_price')
  final num? actualPrice;
  @JsonKey(name: 'discounted_price')
  final num? discountedPrice;
  @JsonKey(name: 'best_offers')
  final List<String>? bestOffers;
  @JsonKey(name: 'cashback_offers')
  final List<String>? cashbackOffers;
  @JsonKey(name: 'description')
  final List<Specification>? description;

  @JsonKey(name: 'similar_products')
  final List<ProductDetailSubProduct>? similarProducts;
  @JsonKey(name: 'combo_pack_deals')
  final List<ProductDetailSubProduct>? comboPackDeals;
  @JsonKey(name: 'specification')
  final List<Specification>? specification;
  @JsonKey(name: 'other_detail')
  final List<OtherDetail>? otherDetail;

  ProductDetailModel({
    this.productName,
    this.actualPrice,
    this.discountedPrice,
    this.bestOffers,
    this.cashbackOffers,
    this.description,
    this.similarProducts,
    this.images,
    this.comboPackDeals,
    this.specification,
    this.otherDetail,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);
}

@JsonSerializable()
class ProductDetailSubProduct {
  final List<String>? images;
  @JsonKey(name: 'product_name')
  final String? productName;

  @JsonKey(name: 'actual_price')
  final num? actualPrice;

  @JsonKey(name: 'discounted_price')
  final num? discountedPrice;

  ProductDetailSubProduct(
    this.images,
    this.productName,
    this.actualPrice,
    this.discountedPrice,
  );

  factory ProductDetailSubProduct.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailSubProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailSubProductToJson(this);
}

@JsonSerializable()
class Specification {
  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'content')
  final String? content;

  Specification(
    this.type,
    this.content,
  );

  factory Specification.fromJson(Map<String, dynamic> json) =>
      _$SpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificationToJson(this);
}

@JsonSerializable()
class OtherDetail {
  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'content')
  final String? content;

  OtherDetail(
    this.type,
    this.content,
  );

  factory OtherDetail.fromJson(Map<String, dynamic> json) =>
      _$OtherDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OtherDetailToJson(this);
}

@JsonSerializable()
class Description {
  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'content')
  final String? content;

  Description(
    this.type,
    this.content,
  );

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
