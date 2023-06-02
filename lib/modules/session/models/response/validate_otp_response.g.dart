// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ValidateOtpResponse _$$_ValidateOtpResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ValidateOtpResponse(
      isRegistered: json['isRegistered'] as bool,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiry: json['expiry'] as int,
    );

Map<String, dynamic> _$$_ValidateOtpResponseToJson(
        _$_ValidateOtpResponse instance) =>
    <String, dynamic>{
      'isRegistered': instance.isRegistered,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiry': instance.expiry,
    };
