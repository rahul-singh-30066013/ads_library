// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RescheduleOrderRequest _$$_RescheduleOrderRequestFromJson(
        Map<String, dynamic> json) =>
    _$_RescheduleOrderRequest(
      orderReferenceId: json['orderReferenceId'] as String? ?? '',
      customerID: json['customerID'] as String? ?? '',
      orderDate: json['orderDate'] as String? ?? '',
      orderTime: json['orderTime'] as String? ?? '',
      reason: json['reason'] as String? ?? '',
      flightNo: json['flightNo'] as String? ?? '',
    );

Map<String, dynamic> _$$_RescheduleOrderRequestToJson(
        _$_RescheduleOrderRequest instance) =>
    <String, dynamic>{
      'orderReferenceId': instance.orderReferenceId,
      'customerID': instance.customerID,
      'orderDate': instance.orderDate,
      'orderTime': instance.orderTime,
      'reason': instance.reason,
      'flightNo': instance.flightNo,
    };
