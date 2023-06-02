// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CancelBookingResponseModel _$$_CancelBookingResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_CancelBookingResponseModel(
      isSuccess: json['isSuccess'] as bool? ?? false,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$_CancelBookingResponseModelToJson(
        _$_CancelBookingResponseModel instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
    };
