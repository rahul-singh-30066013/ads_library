// To parse this JSON data, do
//
//     final rescheduleBookingResponseModel = rescheduleBookingResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reschedule_booking_response_model.freezed.dart';
part 'reschedule_booking_response_model.g.dart';

RescheduleBookingResponseModel rescheduleBookingResponseModelFromJson(
  String str,
) =>
    RescheduleBookingResponseModel.fromJson(json.decode(str));

String rescheduleBookingResponseModelToJson(
  RescheduleBookingResponseModel data,
) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class RescheduleBookingResponseModel with _$RescheduleBookingResponseModel {
  const factory RescheduleBookingResponseModel({
    @JsonKey(name: 'bookingId') @Default(0) int bookingId,
    @JsonKey(name: 'oldBookingId') @Default(0) int oldBookingId,
    @JsonKey(name: 'bookingStatus') @Default('') dynamic bookingStatus,
    @JsonKey(name: 'tripIdList') @Default('') dynamic tripIdList,
    @JsonKey(name: 'meta') @Default(Meta()) Meta meta,
  }) = _RescheduleBookingResponseModel;

  factory RescheduleBookingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RescheduleBookingResponseModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'count') @Default(0) int count,
    @JsonKey(name: 'statusCode') @Default(0) int statusCode,
    @JsonKey(name: 'error') @Default(Error()) Error error,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Error with _$Error {
  const factory Error({
    @JsonKey(name: 'statusCode') @Default(0) dynamic statusCode,
    @JsonKey(name: 'code') @Default(0) dynamic code,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'source') @Default('') dynamic source,
  }) = _Error;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}
