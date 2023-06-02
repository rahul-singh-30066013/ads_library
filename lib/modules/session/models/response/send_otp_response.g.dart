// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendOtpResponse _$$_SendOtpResponseFromJson(Map<String, dynamic> json) =>
    _$_SendOtpResponse(
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      isRegistered: json['isRegistered'] as bool,
    );

Map<String, dynamic> _$$_SendOtpResponseToJson(_$_SendOtpResponse instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'isRegistered': instance.isRegistered,
    };
