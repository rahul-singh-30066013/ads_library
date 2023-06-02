// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ValidateOtpRequest _$$_ValidateOtpRequestFromJson(
        Map<String, dynamic> json) =>
    _$_ValidateOtpRequest(
      json['source'] as String,
      json['otpCode'] as String,
      json['referralCode'] as String?,
    );

Map<String, dynamic> _$$_ValidateOtpRequestToJson(
        _$_ValidateOtpRequest instance) =>
    <String, dynamic>{
      'source': instance.source,
      'otpCode': instance.otpCode,
      'referralCode': instance.referralCode,
    };
