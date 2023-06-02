// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendOtpRequest _$$_SendOtpRequestFromJson(Map<String, dynamic> json) =>
    _$_SendOtpRequest(
      json['phoneNumber'] as String,
      json['countryCode'] as String,
      isWhatsapp: json['isWhatsapp'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SendOtpRequestToJson(_$_SendOtpRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'countryCode': instance.countryCode,
      'isWhatsapp': instance.isWhatsapp,
    };
