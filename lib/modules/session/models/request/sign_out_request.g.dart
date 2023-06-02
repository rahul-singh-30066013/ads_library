// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_out_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignOutRequest _$$_SignOutRequestFromJson(Map<String, dynamic> json) =>
    _$_SignOutRequest(
      json['accessToken'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$$_SignOutRequestToJson(_$_SignOutRequest instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
