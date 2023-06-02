// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_booking_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CancelBookingRequestModel _$$_CancelBookingRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_CancelBookingRequestModel(
      orderReferenceId: json['orderReferenceId'] as String,
      passengerIdList: (json['passengerIdList'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$_CancelBookingRequestModelToJson(
        _$_CancelBookingRequestModel instance) =>
    <String, dynamic>{
      'orderReferenceId': instance.orderReferenceId,
      'passengerIdList': instance.passengerIdList,
    };
