// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_filter_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeFilterCategoryModel _$$_DutyFreeFilterCategoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeFilterCategoryModel(
      filterTitle: json['filterTitle'] as String? ?? '',
      filterCode: json['filterCode'] as String? ?? '',
      filterValue: json['filterValue'] as String? ?? '',
      minValue: (json['minValue'] as num?)?.toDouble() ?? 0.0,
      maxValue: (json['maxValue'] as num?)?.toDouble() ?? 0.0,
      multiselect: json['multiselect'] as bool? ?? false,
      showInPrimery: json['showInPrimery'] as bool? ?? false,
      filterData: (json['filterData'] as List<dynamic>?)
              ?.map(
                  (e) => DutyFreeFilterData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DutyFreeFilterCategoryModelToJson(
        _$_DutyFreeFilterCategoryModel instance) =>
    <String, dynamic>{
      'filterTitle': instance.filterTitle,
      'filterCode': instance.filterCode,
      'filterValue': instance.filterValue,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'multiselect': instance.multiselect,
      'showInPrimery': instance.showInPrimery,
      'filterData': instance.filterData,
    };
