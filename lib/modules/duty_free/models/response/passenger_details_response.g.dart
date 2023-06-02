// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PassengerDetailsResponse _$$_PassengerDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PassengerDetailsResponse(
      orderRemarks: json['orderRemarks'] as String?,
      customerId: json['customerId'] as String? ?? '144',
      customerName: json['customerName'] as String? ?? '',
      passportNumber: json['passportNumber'] as String? ?? '',
      customerPassportExpiry: json['customerPassportExpiry'] as String? ?? '',
      totalAmount: json['totalAmount'] as num? ?? 0,
      pickupDate: json['pickupDate'] as String? ?? '',
      pickupTime: json['pickupTime'] as String? ?? '',
      flightNo: json['flightNo'] as String? ?? '',
      flightTime: json['flightTime'] as String? ?? '',
      customerDOB: json['customerDOB'] as String? ?? '',
      countryDialCode: json['countryDialCode'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      emailId: json['emailId'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      countryName: json['countryName'] as String? ?? '',
      assistanceCode: json['assistanceCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_PassengerDetailsResponseToJson(
        _$_PassengerDetailsResponse instance) =>
    <String, dynamic>{
      'orderRemarks': instance.orderRemarks,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'passportNumber': instance.passportNumber,
      'customerPassportExpiry': instance.customerPassportExpiry,
      'totalAmount': instance.totalAmount,
      'pickupDate': instance.pickupDate,
      'pickupTime': instance.pickupTime,
      'flightNo': instance.flightNo,
      'flightTime': instance.flightTime,
      'customerDOB': instance.customerDOB,
      'countryDialCode': instance.countryDialCode,
      'mobile': instance.mobile,
      'emailId': instance.emailId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'assistanceCode': instance.assistanceCode,
    };
