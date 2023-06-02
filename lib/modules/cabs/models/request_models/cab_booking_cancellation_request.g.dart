// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cab_booking_cancellation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CabBookingCancellationRequest _$$_CabBookingCancellationRequestFromJson(
        Map<String, dynamic> json) =>
    _$_CabBookingCancellationRequest(
      cancelReason: json['cancelReason'] as String? ?? '',
      orderReferenceId: json['orderReferenceId'] as String? ?? '',
    );

Map<String, dynamic> _$$_CabBookingCancellationRequestToJson(
        _$_CabBookingCancellationRequest instance) =>
    <String, dynamic>{
      'cancelReason': instance.cancelReason,
      'orderReferenceId': instance.orderReferenceId,
    };
