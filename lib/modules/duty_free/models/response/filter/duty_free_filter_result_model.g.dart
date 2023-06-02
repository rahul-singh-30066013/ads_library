// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_filter_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeFilterResultModel _$$_DutyFreeFilterResultModelFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeFilterResultModel(
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => DutyFreeFilterCategoryModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      price: json['price'] == null
          ? const DutyFreeFilterPriceSortBrandModel()
          : DutyFreeFilterPriceSortBrandModel.fromJson(
              json['price'] as Map<String, dynamic>),
      sort: json['sort'] == null
          ? const DutyFreeFilterPriceSortBrandModel()
          : DutyFreeFilterPriceSortBrandModel.fromJson(
              json['sort'] as Map<String, dynamic>),
      brands: json['brands'] == null
          ? const DutyFreeFilterPriceSortBrandModel()
          : DutyFreeFilterPriceSortBrandModel.fromJson(
              json['brands'] as Map<String, dynamic>),
      offers: json['offers'] == null
          ? const DutyFreeFilterPriceSortBrandModel()
          : DutyFreeFilterPriceSortBrandModel.fromJson(
              json['offers'] as Map<String, dynamic>),
      exclusive: json['exclusive'] == null
          ? null
          : DutyFreeFilterPriceSortBrandModel.fromJson(
              json['exclusive'] as Map<String, dynamic>),
      includeOOS: json['includeOOS'] == null
          ? const DutyFreeFilterPriceSortBrandModel()
          : DutyFreeFilterPriceSortBrandModel.fromJson(
              json['includeOOS'] as Map<String, dynamic>),
      materialGroupBanner: json['materialGroupBanner'] == null
          ? null
          : DutyFreeMaterialGroupBanner.fromJson(
              json['materialGroupBanner'] as Map<String, dynamic>),
      selectedFilter: json['selectedFilter'] == null
          ? null
          : DutyFreeSelectedFilterResponse.fromJson(
              json['selectedFilter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DutyFreeFilterResultModelToJson(
        _$_DutyFreeFilterResultModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'price': instance.price,
      'sort': instance.sort,
      'brands': instance.brands,
      'offers': instance.offers,
      'exclusive': instance.exclusive,
      'includeOOS': instance.includeOOS,
      'materialGroupBanner': instance.materialGroupBanner,
      'selectedFilter': instance.selectedFilter,
    };
