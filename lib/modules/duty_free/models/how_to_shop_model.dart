/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'how_to_shop_model.g.dart';

/// shop : {"items":[{"actionId":1,"deeplink":"","title":"Shop Early","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Change Airport, or opt for local delivery in Mumbai"},{"actionId":2,"deeplink":"","title":"Re: Earth#An A-Z shops available at\nMumbai Airport","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"},{"actionId":3,"deeplink":"","title":"Shop Early","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"},{"actionId":4,"deeplink":"","title":"Re: Earth#An A-Z shops available at\nMumbai Airport","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"},{"actionId":5,"deeplink":"","title":"Shop Early","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"},{"actionId":6,"deeplink":"","title":"Re: Earth#An A-Z shops available at\nMumbai Airport","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"}],"travellers":[{"actionId":1,"deeplink":"","title":"Shop Early"},{"actionId":1,"deeplink":"","title":"Shop Early"},{"actionId":1,"deeplink":"","title":"Shop Early"}]}
@JsonSerializable()
class HowToShopModel {
  HowToShopModel({
    Shop? shop,
  }) {
    _shop = shop;
  }

  Shop? _shop;

  Shop? get shop => _shop;

  factory HowToShopModel.fromJson(Map<String, dynamic> json) =>
      _$HowToShopModelFromJson(json);

  Map<String, dynamic> toJson() => _$HowToShopModelToJson(this);
  @override
  String toString() => json.encode(toJson());
}

/// items : [{"actionId":1,"deeplink":"","title":"Shop Early","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"},{"actionId":2,"deeplink":"","title":"Re: Earth#An A-Z shops available at\nMumbai Airport","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"},{"actionId":3,"deeplink":"","title":"Shop Early","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"},{"actionId":4,"deeplink":"","title":"Re: Earth#An A-Z shops available at\nMumbai Airport","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"},{"actionId":5,"deeplink":"","title":"Shop Early","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"},{"actionId":6,"deeplink":"","title":"Re: Earth#An A-Z shops available at\nMumbai Airport","description":"Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"}]
/// travellers : [{"actionId":1,"deeplink":"","title":"Shop Early"},{"actionId":1,"deeplink":"","title":"Shop Early"},{"actionId":1,"deeplink":"","title":"Shop Early"}]
@JsonSerializable()
class Shop {
  Shop({
    List<Items>? items,
    List<DutyFreeTravellers>? travellers,
  }) {
    _items = items;
    _travellers = travellers;
  }

  List<Items>? _items;
  List<DutyFreeTravellers>? _travellers;

  List<Items>? get items => _items;
  List<DutyFreeTravellers>? get travellers => _travellers;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
  @override
  String toString() => json.encode(toJson());
}

/// actionId : 1
/// deeplink : ""
/// title : "Shop Early"
@JsonSerializable()
class DutyFreeTravellers {
  DutyFreeTravellers({
    int? actionId,
    String? deeplink,
    String? title,
  }) {
    _actionId = actionId;
    _deeplink = deeplink;
    _title = title;
  }

  int? _actionId;
  String? _deeplink;
  String? _title;

  int? get actionId => _actionId;
  String? get deeplink => _deeplink;
  String? get title => _title;

  factory DutyFreeTravellers.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeTravellersFromJson(json);

  factory DutyFreeTravellers.fromData({
    String? deeplink,
    String? title,
    int? actionId,
  }) {
    return DutyFreeTravellers(
      deeplink: deeplink,
      title: title,
      actionId: actionId,
    );
  }
  Map<String, dynamic> toJson() => _$DutyFreeTravellersToJson(this);
  @override
  String toString() => json.encode(toJson());
}

/// actionId : 1
/// deeplink : ""
/// title : "Shop Early"
/// description : "Choose a collection method. You ay pick arrival or departure may pick up your order on arrival or departure from Changi Airport, or opt for local delivery in Mumbai"
@JsonSerializable()
class Items {
  Items({
    int? actionId,
    String? deeplink,
    String? title,
    String? description,
  }) {
    _actionId = actionId;
    _deeplink = deeplink;
    _title = title;
    _description = description;
  }

  int? _actionId;
  String? _deeplink;
  String? _title;
  String? _description;

  int? get actionId => _actionId;
  String? get deeplink => _deeplink;
  String? get title => _title;
  String? get description => _description;
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  factory Items.fromData({
    String? deeplink,
    String? title,
    int? actionId,
    String? description,
  }) {
    return Items(
      deeplink: deeplink,
      title: title,
      actionId: actionId,
      description: description,
    );
  }
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
  @override
  String toString() => json.encode(toJson());
}
