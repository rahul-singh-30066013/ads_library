// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_filter_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeFilterData _$$_DutyFreeFilterDataFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeFilterData(
      title: json['title'] as String? ?? '',
      code: json['code'] as String? ?? '',
      imageSrc: json['imageSrc'] as String? ?? '',
      filterSelected: json['filterSelected'] as bool? ?? false,
      filterValue: json['filterValue'] as String? ?? '',
    );

Map<String, dynamic> _$$_DutyFreeFilterDataToJson(
        _$_DutyFreeFilterData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'imageSrc': instance.imageSrc,
      'filterSelected': instance.filterSelected,
      'filterValue': instance.filterValue,
    };
