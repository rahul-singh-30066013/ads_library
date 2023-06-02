/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

const double viewFraction = 0.8;

@JsonSerializable()
class DashBoardModel {
  List<DashBoardItem> dashBoard = [];
  DashBoardModel({
    required this.dashBoard,
  });
  factory DashBoardModel.fromJson(Map<String, dynamic> json) =>
      _$DashBoardModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashBoardModelToJson(this);
  @override
  String toString() => json.encode(toJson());
}

@JsonSerializable()
class DashBoardItem {
  DashBoardItem({
    this.widgetId,
    this.widgetType,
    this.variable,
    this.aspectRatio,
    this.itemMargin,
    this.subItemMargin,
    this.subItemWidth,
    this.title,
    this.subTitle,
    this.actionTitle,
    this.gridColumn,
    this.items,
    this.customItems,
    this.carouselParam,
  });

  int? widgetId;
  String? widgetType;
  String? variable;
  double? aspectRatio;
  ItemMargin? itemMargin;
  double? subItemMargin;
  double? subItemWidth;
  String? title;
  String? subTitle;
  ActionTitle? actionTitle;
  int? gridColumn;
  List<Item>? items;
  List<dynamic>? customItems = [];
  CarouselParam? carouselParam;

  factory DashBoardItem.fromJson(Map<String, dynamic> json) {
    final DashBoardItem item = _$DashBoardItemFromJson(json)..customItems = [];
    return item;
  }

  Map<String, dynamic> toJson() => _$DashBoardItemToJson(this);

  @override
  String toString() => json.encode(toJson());
}

@JsonSerializable()
class ActionTitle {
  ActionTitle({
    this.actionId,
    this.deeplink,
    this.name,
  });
  int? actionId;
  String? deeplink;
  String? name;
  factory ActionTitle.fromJson(Map<String, dynamic> json) =>
      _$ActionTitleFromJson(json);

  Map<String, dynamic> toJson() => _$ActionTitleToJson(this);
  @override
  String toString() => json.encode(toJson());
}

@JsonSerializable()
class Item {
  Item({
    this.actionId,
    this.icon,
    this.deeplink,
    this.title,
  });

  int? actionId;
  String? icon;
  String? deeplink;
  String? title;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  factory Item.fromData({
    String? title,
    String? icon,
    String? deeplink,
    int? actionId,
  }) {
    return Item(
      icon: icon,
      title: title,
      deeplink: deeplink,
      actionId: actionId,
    );
  }

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String toString() => json.encode(toJson());
}

@JsonSerializable()
class ItemMargin {
  ItemMargin({
    this.left = 0,
    this.right = 0,
    this.bottom = 0,
    this.top = 0,
  });

  double left;
  double right;
  double bottom;
  double top;

  factory ItemMargin.fromJson(Map<String, dynamic> json) =>
      _$ItemMarginFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMarginToJson(this);

  @override
  String toString() => json.encode(toJson());
}

@JsonSerializable()
class CarouselParam {
  CarouselParam({
    this.enableInfiniteScroll = true,
    this.enlargeCenterPage = false,
    this.autoPlay = false,
    this.viewportFraction = viewFraction,
  });

  bool enableInfiniteScroll;
  bool enlargeCenterPage;
  bool autoPlay;
  double viewportFraction;

  factory CarouselParam.fromJson(Map<String, dynamic> json) =>
      _$CarouselParamFromJson(json);

  Map<String, dynamic> toJson() => _$CarouselParamToJson(this);

  @override
  String toString() => json.encode(toJson());
}
