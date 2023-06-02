// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentDetailsResponse _$$_PaymentDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentDetailsResponse(
      transactionMode: json['transactionMode'] as String? ?? '',
      transactionCode: json['transactionCode'] as String? ?? '',
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentDetailsResponseToJson(
        _$_PaymentDetailsResponse instance) =>
    <String, dynamic>{
      'transactionMode': instance.transactionMode,
      'transactionCode': instance.transactionCode,
      'status': instance.status,
    };
