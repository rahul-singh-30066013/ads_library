// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_selected_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeSelectedFilterResponse _$$_DutyFreeSelectedFilterResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeSelectedFilterResponse(
      materialGroupTitle: json['materialGroupTitle'] as String? ?? '',
      materialGroup: json['materialGroup'] as String? ?? '',
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subCategory: (json['subCategory'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      brand:
          (json['brand'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      skuCode: (json['skuCode'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      offers: (json['offers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DutyFreeSelectedFilterResponseToJson(
        _$_DutyFreeSelectedFilterResponse instance) =>
    <String, dynamic>{
      'materialGroupTitle': instance.materialGroupTitle,
      'materialGroup': instance.materialGroup,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'brand': instance.brand,
      'skuCode': instance.skuCode,
      'offers': instance.offers,
    };
