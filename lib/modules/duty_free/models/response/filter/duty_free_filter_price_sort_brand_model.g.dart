// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_filter_price_sort_brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeFilterPriceSortBrandModel
    _$$_DutyFreeFilterPriceSortBrandModelFromJson(Map<String, dynamic> json) =>
        _$_DutyFreeFilterPriceSortBrandModel(
          filterTitle: json['filterTitle'] as String? ?? '',
          filterCode: json['filterCode'] as String? ?? '',
          filterValue: json['filterValue'] as String? ?? '',
          multiselect: json['multiselect'] as bool? ?? false,
          showInPrimery: json['showInPrimery'] as bool? ?? false,
          filterData: (json['filterData'] as List<dynamic>?)
                  ?.map((e) =>
                      DutyFreeFilterData.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$_DutyFreeFilterPriceSortBrandModelToJson(
        _$_DutyFreeFilterPriceSortBrandModel instance) =>
    <String, dynamic>{
      'filterTitle': instance.filterTitle,
      'filterCode': instance.filterCode,
      'filterValue': instance.filterValue,
      'multiselect': instance.multiselect,
      'showInPrimery': instance.showInPrimery,
      'filterData': instance.filterData,
    };
