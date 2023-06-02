/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

/// items : [{"icon":"lib/assets/images/food/chai-station.png","title":"Pranaam Elite is specially curated services for guests who ","subTitle":"Pranaam Elite is specially curated services for guests who ","price":130,"guestType":150},{"icon":"lib/assets/images/food/chai-station.png","title":"Pranaam Elite is specially curated services for guests who ","subTitle":"Pranaam Elite is specially curated services for guests who ","price":650,"guestType":680},{"icon":"lib/assets/images/food/chai-station.png","title":"Versace Eros Natural","subTitle":"Pranaam Elite is specially curated services for guests who ","price":50000,"guestType":5000},{"icon":"lib/assets/images/food/chai-station.png","title":"Thin. Light. Heavyweight.\nExplore the options at iStore.","subTitle":"Pranaam Elite is specially curated services for guests who ","price":10000,"guestType":5000}]
part 'param_package_model.g.dart';

@JsonSerializable()
class ParamPackageModel {
  ParamPackageModel({
    List<Items>? items,
  }) {
    _items = items;
  }

  List<Items>? _items;

  List<Items>? get items => _items;

  factory ParamPackageModel.fromJson(Map<String, dynamic> json) =>
      _$ParamPackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParamPackageModelToJson(this);
  @override
  String toString() => json.encode(toJson());
}

/// icon : "lib/assets/images/food/chai-station.png"
/// title : "Pranaam Elite is specially curated services for guests who "
/// subTitle : "Pranaam Elite is specially curated services for guests who "
/// price : 130
/// guestType : 150
@JsonSerializable()
class Items {
  Items({
    String? icon,
    String? title,
    String? subTitle,
    int? price,
    String? guestType,
  }) {
    _icon = icon;
    _title = title;
    _subTitle = subTitle;
    _price = price;
    _guestType = guestType;
  }

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  String? _icon;
  String? _title;
  String? _subTitle;
  int? _price;
  String? _guestType;

  String? get icon => _icon;
  String? get title => _title;
  String? get subTitle => _subTitle;
  int? get price => _price;
  String? get guestType => _guestType;

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
  @override
  String toString() => json.encode(toJson());
}
