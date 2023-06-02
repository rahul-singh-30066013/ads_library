// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'how_to_shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HowToShopModel _$HowToShopModelFromJson(Map<String, dynamic> json) =>
    HowToShopModel(
      shop: json['shop'] == null
          ? null
          : Shop.fromJson(json['shop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HowToShopModelToJson(HowToShopModel instance) =>
    <String, dynamic>{
      'shop': instance.shop,
    };

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      travellers: (json['travellers'] as List<dynamic>?)
          ?.map((e) => DutyFreeTravellers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'items': instance.items,
      'travellers': instance.travellers,
    };

DutyFreeTravellers _$DutyFreeTravellersFromJson(Map<String, dynamic> json) =>
    DutyFreeTravellers(
      actionId: json['actionId'] as int?,
      deeplink: json['deeplink'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$DutyFreeTravellersToJson(DutyFreeTravellers instance) =>
    <String, dynamic>{
      'actionId': instance.actionId,
      'deeplink': instance.deeplink,
      'title': instance.title,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      actionId: json['actionId'] as int?,
      deeplink: json['deeplink'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'actionId': instance.actionId,
      'deeplink': instance.deeplink,
      'title': instance.title,
      'description': instance.description,
    };
