// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airport_shop_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirportShopListModel _$AirportShopListModelFromJson(
        Map<String, dynamic> json) =>
    AirportShopListModel(
      airportShop: json['airportShop'] == null
          ? null
          : AirportShop.fromJson(json['airportShop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirportShopListModelToJson(
        AirportShopListModel instance) =>
    <String, dynamic>{
      'airportShop': instance.airportShop,
    };

AirportShop _$AirportShopFromJson(Map<String, dynamic> json) => AirportShop(
      airportShopCategory: json['airportShopCategory'] == null
          ? null
          : AirportShopCategory.fromJson(
              json['airportShopCategory'] as Map<String, dynamic>),
      airportShopList: json['airportShopList'] == null
          ? null
          : AirportShopCategory.fromJson(
              json['airportShopList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirportShopToJson(AirportShop instance) =>
    <String, dynamic>{
      'airportShopCategory': instance.airportShopCategory,
      'airportShopList': instance.airportShopList,
    };

AirportShopCategory _$AirportShopCategoryFromJson(Map<String, dynamic> json) =>
    AirportShopCategory(
      widgetType: json['widgetType'] as String,
      gridColumn: json['gridColumn'] as int,
      aspectRatio: (json['aspectRatio'] as num).toDouble(),
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirportShopCategoryToJson(
        AirportShopCategory instance) =>
    <String, dynamic>{
      'widgetType': instance.widgetType,
      'gridColumn': instance.gridColumn,
      'aspectRatio': instance.aspectRatio,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      actionId: json['actionId'] as int?,
      deeplink: json['deeplink'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      banner: json['banner'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'actionId': instance.actionId,
      'deeplink': instance.deeplink,
      'banner': instance.banner,
      'icon': instance.icon,
      'title': instance.title,
      'address': instance.address,
    };
