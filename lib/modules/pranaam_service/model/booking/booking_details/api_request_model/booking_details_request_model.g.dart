// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_details_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingDetailsRequestModel _$$_BookingDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_BookingDetailsRequestModel(
      tripId: json['tripId'] as int? ?? 0,
      bookingId: json['bookingId'] as int? ?? defaultBookingId,
    );

Map<String, dynamic> _$$_BookingDetailsRequestModelToJson(
        _$_BookingDetailsRequestModel instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'bookingId': instance.bookingId,
    };
