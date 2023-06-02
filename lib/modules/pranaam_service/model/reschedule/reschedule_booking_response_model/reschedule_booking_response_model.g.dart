// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RescheduleBookingResponseModel _$$_RescheduleBookingResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_RescheduleBookingResponseModel(
      bookingId: json['bookingId'] as int? ?? 0,
      oldBookingId: json['oldBookingId'] as int? ?? 0,
      bookingStatus: json['bookingStatus'] ?? '',
      tripIdList: json['tripIdList'] ?? '',
      meta: json['meta'] == null
          ? const Meta()
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RescheduleBookingResponseModelToJson(
        _$_RescheduleBookingResponseModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'oldBookingId': instance.oldBookingId,
      'bookingStatus': instance.bookingStatus,
      'tripIdList': instance.tripIdList,
      'meta': instance.meta,
    };

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta(
      count: json['count'] as int? ?? 0,
      statusCode: json['statusCode'] as int? ?? 0,
      error: json['error'] == null
          ? const Error()
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{
      'count': instance.count,
      'statusCode': instance.statusCode,
      'error': instance.error,
    };

_$_Error _$$_ErrorFromJson(Map<String, dynamic> json) => _$_Error(
      statusCode: json['statusCode'] ?? 0,
      code: json['code'] ?? 0,
      description: json['description'] as String? ?? '',
      source: json['source'] ?? '',
    );

Map<String, dynamic> _$$_ErrorToJson(_$_Error instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'code': instance.code,
      'description': instance.description,
      'source': instance.source,
    };
