// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_policy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreePolicyResponse _$$_DutyFreePolicyResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreePolicyResponse(
      json['title'] as String?,
      json['text'] as String?,
      (json['lines'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_DutyFreePolicyResponseToJson(
        _$_DutyFreePolicyResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'lines': instance.lines,
    };
