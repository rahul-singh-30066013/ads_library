// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_status_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeStatusHistoryResponse _$$_DutyFreeStatusHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeStatusHistoryResponse(
      statusHistory: (json['statusHistory'] as List<dynamic>?)
              ?.map((e) => DutyFreeStatusHistoryDetailsResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DutyFreeStatusHistoryResponseToJson(
        _$_DutyFreeStatusHistoryResponse instance) =>
    <String, dynamic>{
      'statusHistory': instance.statusHistory,
    };
