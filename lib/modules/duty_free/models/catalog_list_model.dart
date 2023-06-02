/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'catalog_list_model.g.dart';

@JsonSerializable()
class CatalogListModel {
  @JsonKey(name: 'category_id')
  int categoryId;
  @JsonKey(name: 'product_list')
  List<ProductList>? productList;
  @JsonKey(name: 'product_address')
  ProductAddress? productAddress;
  List<Stories>? stories;

  CatalogListModel({
    required this.categoryId,
    this.productList,
    this.productAddress,
    this.stories,
  });

  factory CatalogListModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogListModelToJson(this);
}

@JsonSerializable()
class ProductList {
  @JsonKey(name: 'product_id')
  int productId;
  String? image;
  String? name;
  String? size;
  num? price;
  num? discount;
  String? type;
  @JsonKey(name: 'is_favorite')
  bool? isFavorite;
  int? qty;
  String? unit;
  List<Quantities>? quantities;

  ProductList({
    required this.productId,
    this.image,
    this.name,
    this.size,
    this.price,
    this.discount,
    this.type,
    this.isFavorite,
    this.qty,
    this.quantities,
    this.unit,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}

@JsonSerializable()
class ProductAddress {
  @JsonKey(name: 'item_name')
  String? itemName;
  @JsonKey(name: 'item_type')
  String? itemType;
  String? address;

  ProductAddress({this.itemName, this.itemType, this.address});

  factory ProductAddress.fromJson(Map<String, dynamic> json) =>
      _$ProductAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAddressToJson(this);
}

@JsonSerializable()
class Stories {
  @JsonKey(name: 'story_id')
  int storyId;
  String? url;
  String? type;
  int? duration;

  Stories({
    required this.storyId,
    this.url,
    this.type,
    this.duration,
  });

  factory Stories.fromJson(Map<String, dynamic> json) =>
      _$StoriesFromJson(json);

  Map<String, dynamic> toJson() => _$StoriesToJson(this);
}

@JsonSerializable()
class Quantities {
  String? size;

  Quantities({this.size});

  factory Quantities.fromJson(Map<String, dynamic> json) =>
      _$QuantitiesFromJson(json);
  Map<String, dynamic> toJson() => _$QuantitiesToJson(this);
}
