// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_passenger_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreePassengerDetails _$$_DutyFreePassengerDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreePassengerDetails(
      orderRemarks: json['orderRemarks'] as String?,
      customerName: json['customerName'] as String? ?? '',
      passportNumber: json['passportNumber'] as String? ?? '',
      passportExpiry: json['passportExpiry'] as String? ?? '',
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
      isAssistance: json['isAssistance'] as bool? ?? false,
      assistanceCode: json['assistanceCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_DutyFreePassengerDetailsToJson(
        _$_DutyFreePassengerDetails instance) =>
    <String, dynamic>{
      'orderRemarks': instance.orderRemarks,
      'customerName': instance.customerName,
      'passportNumber': instance.passportNumber,
      'passportExpiry': instance.passportExpiry,
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
      'isAssistance': instance.isAssistance,
      'assistanceCode': instance.assistanceCode,
    };
