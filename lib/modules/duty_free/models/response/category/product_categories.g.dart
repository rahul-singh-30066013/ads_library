// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductCategories _$$_ProductCategoriesFromJson(Map<String, dynamic> json) =>
    _$_ProductCategories(
      json['title'] as String?,
      json['code'] as String?,
      json['linkUrl'] as String?,
      json['mimageSrc'] as String?,
      json['materialGroup'] as String?,
      json['brand'] as String?,
      json['category'] as String?,
      (json['children'] as List<dynamic>?)
          ?.map((e) => ProductCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
      restricted: json['restricted'] as bool?,
      disableForAirport: json['disableForAirport'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ProductCategoriesToJson(
        _$_ProductCategories instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'linkUrl': instance.linkUrl,
      'mimageSrc': instance.mimageSrc,
      'materialGroup': instance.materialGroup,
      'brand': instance.brand,
      'category': instance.category,
      'children': instance.children,
      'restricted': instance.restricted,
      'disableForAirport': instance.disableForAirport,
    };
