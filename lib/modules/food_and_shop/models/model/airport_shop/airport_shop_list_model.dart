/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'airport_shop_list_model.g.dart';

///this is model class for Airport shop list screen, will use to data manipulate from api/local db
@JsonSerializable()
class AirportShopListModel {
  AirportShop? airportShop;

  AirportShopListModel({this.airportShop});

  factory AirportShopListModel.fromJson(Map<String, dynamic> json) =>
      _$AirportShopListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AirportShopListModelToJson(this);
}

@JsonSerializable()
class AirportShop {
  AirportShopCategory? airportShopCategory;
  AirportShopCategory? airportShopList;

  AirportShop({
    this.airportShopCategory,
    this.airportShopList,
  });

  factory AirportShop.fromJson(Map<String, dynamic> json) =>
      _$AirportShopFromJson(json);

  Map<String, dynamic> toJson() => _$AirportShopToJson(this);
}

@JsonSerializable()
class AirportShopCategory {
  String widgetType;
  int gridColumn;
  double aspectRatio;
  String title;
  String subTitle;
  List<Items> items;

  AirportShopCategory({
    required this.widgetType,
    required this.gridColumn,
    required this.aspectRatio,
    required this.title,
    required this.subTitle,
    required this.items,
  });

  factory AirportShopCategory.fromJson(Map<String, dynamic> json) =>
      _$AirportShopCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$AirportShopCategoryToJson(this);
}

@JsonSerializable()
class Items {
  int? actionId;
  String? deeplink;
  String? banner;
  String? icon;
  String? title;
  String? address;

  Items({
    this.actionId,
    this.deeplink,
    this.icon,
    this.title,
    this.address,
    this.banner,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
