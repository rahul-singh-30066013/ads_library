// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_exclusive_product_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeExclusiveProductFilterModel
    _$$_DutyFreeExclusiveProductFilterModelFromJson(
            Map<String, dynamic> json) =>
        _$_DutyFreeExclusiveProductFilterModel(
          filterTitle: json['filterTitle'] as String?,
          filterCode: json['filterCode'] as String?,
          filterValue: json['filterValue'] as String?,
          multiselect: json['multiselect'] as bool?,
          showInPrimery: json['showInPrimery'] as bool?,
          skuCode: (json['skuCode'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          filterData: json['filterData'] as List<dynamic>?,
        );

Map<String, dynamic> _$$_DutyFreeExclusiveProductFilterModelToJson(
        _$_DutyFreeExclusiveProductFilterModel instance) =>
    <String, dynamic>{
      'filterTitle': instance.filterTitle,
      'filterCode': instance.filterCode,
      'filterValue': instance.filterValue,
      'multiselect': instance.multiselect,
      'showInPrimery': instance.showInPrimery,
      'skuCode': instance.skuCode,
      'filterData': instance.filterData,
    };
