// To parse this JSON data, do
//
//     final rescheduleBookingRequestModel = rescheduleBookingRequestModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reschedule_booking_request_model.freezed.dart';
part 'reschedule_booking_request_model.g.dart';

RescheduleBookingRequestModel rescheduleBookingRequestModelFromJson(
  String str,
) =>
    RescheduleBookingRequestModel.fromJson(json.decode(str));

String rescheduleBookingRequestModelToJson(
  RescheduleBookingRequestModel data,
) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class RescheduleBookingRequestModel with _$RescheduleBookingRequestModel {
  const factory RescheduleBookingRequestModel({
    @JsonKey(name: 'bookingId') @Default(0) int bookingId,
    @JsonKey(name: 'referenceId') @Default('') String referenceId,
    @JsonKey(name: 'phoneNo') @Default('') String phoneNo,
    @JsonKey(name: 'countryDialCode') @Default('') String countryDialCode,
    @JsonKey(name: 'rescheduleCharges') @Default(0) double rescheduleCharges,
    @JsonKey(name: 'isPartialReshedule')
    @Default(false)
        bool isPartialReshedule,
    @JsonKey(name: 'passengerIdList') @Default([]) List<int> passengerIdList,
    @JsonKey(name: 'tripInfo') @Default(TripInfo()) TripInfo tripInfo,
    @JsonKey(name: 'paymentInfo')
    @Default(PaymentInfo())
        PaymentInfo paymentInfo,
  }) = _RescheduleBookingRequestModel;

  factory RescheduleBookingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RescheduleBookingRequestModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PaymentInfo with _$PaymentInfo {
  const factory PaymentInfo({
    @JsonKey(name: 'mihpayid') @Default('') String mihpayid,
    @JsonKey(name: 'mode') @Default('') String mode,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'key') @Default('') String key,
    @JsonKey(name: 'txnid') @Default('') String txnid,
    @JsonKey(name: 'amount') @Default('') String amount,
    @JsonKey(name: 'addedon') @Default('') String addedon,
    @JsonKey(name: 'productinfo') @Default('') String productinfo,
    @JsonKey(name: 'firstname') @Default('') String firstname,
    @JsonKey(name: 'lastname') @Default('') String lastname,
    @JsonKey(name: 'address1') @Default('') String address1,
    @JsonKey(name: 'address2') @Default('') String address2,
    @JsonKey(name: 'city') @Default('') String city,
    @JsonKey(name: 'state') @Default('') String state,
    @JsonKey(name: 'country') @Default('') String country,
    @JsonKey(name: 'zipcode') @Default('') String zipcode,
    @JsonKey(name: 'email') @Default('') String email,
    @JsonKey(name: 'phone') @Default('') String phone,
    @JsonKey(name: 'udf1') @Default('') String udf1,
    @JsonKey(name: 'udf2') @Default('') String udf2,
    @JsonKey(name: 'udf3') @Default('') String udf3,
    @JsonKey(name: 'udf4') @Default('') String udf4,
    @JsonKey(name: 'udf5') @Default('') String udf5,
    @JsonKey(name: 'udf6') @Default('') String udf6,
    @JsonKey(name: 'udf7') @Default('') String udf7,
    @JsonKey(name: 'udf8') @Default('') String udf8,
    @JsonKey(name: 'udf9') @Default('') String udf9,
    @JsonKey(name: 'udf10') @Default('') String udf10,
    @JsonKey(name: 'card_token') @Default('') String cardToken,
    @JsonKey(name: 'card_no') @Default('') String cardNo,
    @JsonKey(name: 'field0') @Default('') String field0,
    @JsonKey(name: 'field1') @Default('') String field1,
    @JsonKey(name: 'field2') @Default('') String field2,
    @JsonKey(name: 'field3') @Default('') String field3,
    @JsonKey(name: 'field4') @Default('') String field4,
    @JsonKey(name: 'field5') @Default('') String field5,
    @JsonKey(name: 'field6') @Default('') String field6,
    @JsonKey(name: 'field7') @Default('') String field7,
    @JsonKey(name: 'field8') @Default('') String field8,
    @JsonKey(name: 'field9') @Default('') String field9,
    @JsonKey(name: 'payment_source') @Default('') String paymentSource,
    @JsonKey(name: 'PG_TYPE') @Default('') String pgType,
    @JsonKey(name: 'error') @Default('') String error,
    @JsonKey(name: 'error_Message') @Default('') String errorMessage,
    @JsonKey(name: 'net_amount_debit') @Default('') String netAmountDebit,
    @JsonKey(name: 'unmappedstatus') @Default('') String unmappedstatus,
    @JsonKey(name: 'hash') @Default('') String hash,
    @JsonKey(name: 'bank_ref_no') @Default('') String bankRefNo,
    @JsonKey(name: 'bank_ref_num') @Default('') String bankRefNum,
    @JsonKey(name: 'bankcode') @Default('') String bankcode,
    @JsonKey(name: 'surl') @Default('') String surl,
    @JsonKey(name: 'curl') @Default('') String curl,
    @JsonKey(name: 'furl') @Default('') String furl,
    @JsonKey(name: 'card_hash') @Default('') String cardHash,
  }) = _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TripInfo with _$TripInfo {
  const factory TripInfo({
    @JsonKey(name: 'serviceDateTime') @Default('') String serviceDateTime,
    @JsonKey(name: 'flightName') @Default('') String flightName,
    @JsonKey(name: 'flightNumber') @Default('') String flightNumber,
    @JsonKey(name: 'flightTerminal') @Default('') String flightTerminal,
    @JsonKey(name: 'flightDate') @Default('') String flightDate,
    @JsonKey(name: 'flightTime') @Default('') String flightTime,
    @JsonKey(name: 'transitDestRoundTripSecOrigin')
    @Default(0)
        int transitDestRoundTripSecOrigin,
    @JsonKey(name: 'transitRoundTripSecFlightName')
    @Default('')
        String transitRoundTripSecFlightName,
    @JsonKey(name: 'transitRoundTripSecFlightNumber')
    @Default(0)
        int transitRoundTripSecFlightNumber,
    @JsonKey(name: 'transitRoundTripSecFlightTerminal')
    @Default('')
        String transitRoundTripSecFlightTerminal,
    @JsonKey(name: 'transitRoundTripSecFlightDate')
    @Default('')
        String transitRoundTripSecFlightDate,
    @JsonKey(name: 'transitRoundTripSecFlightTime')
    @Default('')
        String transitRoundTripSecFlightTime,
    @JsonKey(name: 'roundTripSecServiceDateTime')
        String? roundTripSecServiceDateTime,
  }) = _TripInfo;

  factory TripInfo.fromJson(Map<String, dynamic> json) =>
      _$TripInfoFromJson(json);
}
