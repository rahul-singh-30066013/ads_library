// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PersonNameModel _$$_PersonNameModelFromJson(Map<String, dynamic> json) =>
    _$_PersonNameModel(
      salutationId: json['salutationId'] as int? ?? 0,
      salutationText: json['salutationText'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
    );

Map<String, dynamic> _$$_PersonNameModelToJson(_$_PersonNameModel instance) =>
    <String, dynamic>{
      'salutationId': instance.salutationId,
      'salutationText': instance.salutationText,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
