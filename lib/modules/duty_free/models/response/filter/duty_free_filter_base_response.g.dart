// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_filter_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeFilterBaseResponse _$$_DutyFreeFilterBaseResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeFilterBaseResponse(
      count: json['count'] as int? ?? 0,
      result: json['result'] == null
          ? const DutyFreeFilterResultModel()
          : DutyFreeFilterResultModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DutyFreeFilterBaseResponseToJson(
        _$_DutyFreeFilterBaseResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'result': instance.result,
    };
