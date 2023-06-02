// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_product_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeProductListRequest _$$_DutyFreeProductListRequestFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeProductListRequest(
      materialGroup: json['materialGroup'] as String? ?? '',
      language: json['language'] as String? ?? '',
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      brand:
          (json['brand'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      subCategory: (json['subCategory'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      skuCode: (json['skuCode'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      offers: (json['offers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      restricted: json['restricted'] as bool? ?? false,
      page: json['page'] as int?,
      pageSize: json['pageSize'] as int?,
      channel: json['channel'] as String? ?? 'app',
      airportCode: json['airportCode'] as String? ?? '',
      storeType: json['storeType'] as String? ?? 'departure',
      sort: json['sort'] as String? ?? '',
      minPrice: json['minPrice'] as num? ?? null,
      maxPrice: json['maxPrice'] as num? ?? null,
      pageType: json['pageType'] as String? ?? '',
      slug: json['slug'] as String?,
      showOnHomepage: json['showOnHomepage'] as bool?,
      exclusive: json['exclusive'] as bool? ?? false,
      includeOOS: json['includeOOS'] as bool? ?? false,
    );

Map<String, dynamic> _$$_DutyFreeProductListRequestToJson(
        _$_DutyFreeProductListRequest instance) =>
    <String, dynamic>{
      'materialGroup': instance.materialGroup,
      'language': instance.language,
      'category': instance.category,
      'brand': instance.brand,
      'subCategory': instance.subCategory,
      'skuCode': instance.skuCode,
      'offers': instance.offers,
      'restricted': instance.restricted,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'channel': instance.channel,
      'airportCode': instance.airportCode,
      'storeType': instance.storeType,
      'sort': instance.sort,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'pageType': instance.pageType,
      'slug': instance.slug,
      'showOnHomepage': instance.showOnHomepage,
      'exclusive': instance.exclusive,
      'includeOOS': instance.includeOOS,
    };
