// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_booking_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RescheduleBookingRequestModel _$$_RescheduleBookingRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_RescheduleBookingRequestModel(
      bookingId: json['bookingId'] as int? ?? 0,
      referenceId: json['referenceId'] as String? ?? '',
      phoneNo: json['phoneNo'] as String? ?? '',
      countryDialCode: json['countryDialCode'] as String? ?? '',
      rescheduleCharges: (json['rescheduleCharges'] as num?)?.toDouble() ?? 0,
      isPartialReshedule: json['isPartialReshedule'] as bool? ?? false,
      passengerIdList: (json['passengerIdList'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      tripInfo: json['tripInfo'] == null
          ? const TripInfo()
          : TripInfo.fromJson(json['tripInfo'] as Map<String, dynamic>),
      paymentInfo: json['paymentInfo'] == null
          ? const PaymentInfo()
          : PaymentInfo.fromJson(json['paymentInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RescheduleBookingRequestModelToJson(
        _$_RescheduleBookingRequestModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'referenceId': instance.referenceId,
      'phoneNo': instance.phoneNo,
      'countryDialCode': instance.countryDialCode,
      'rescheduleCharges': instance.rescheduleCharges,
      'isPartialReshedule': instance.isPartialReshedule,
      'passengerIdList': instance.passengerIdList,
      'tripInfo': instance.tripInfo,
      'paymentInfo': instance.paymentInfo,
    };

_$_PaymentInfo _$$_PaymentInfoFromJson(Map<String, dynamic> json) =>
    _$_PaymentInfo(
      mihpayid: json['mihpayid'] as String? ?? '',
      mode: json['mode'] as String? ?? '',
      status: json['status'] as String? ?? '',
      key: json['key'] as String? ?? '',
      txnid: json['txnid'] as String? ?? '',
      amount: json['amount'] as String? ?? '',
      addedon: json['addedon'] as String? ?? '',
      productinfo: json['productinfo'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      address1: json['address1'] as String? ?? '',
      address2: json['address2'] as String? ?? '',
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
      country: json['country'] as String? ?? '',
      zipcode: json['zipcode'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      udf1: json['udf1'] as String? ?? '',
      udf2: json['udf2'] as String? ?? '',
      udf3: json['udf3'] as String? ?? '',
      udf4: json['udf4'] as String? ?? '',
      udf5: json['udf5'] as String? ?? '',
      udf6: json['udf6'] as String? ?? '',
      udf7: json['udf7'] as String? ?? '',
      udf8: json['udf8'] as String? ?? '',
      udf9: json['udf9'] as String? ?? '',
      udf10: json['udf10'] as String? ?? '',
      cardToken: json['card_token'] as String? ?? '',
      cardNo: json['card_no'] as String? ?? '',
      field0: json['field0'] as String? ?? '',
      field1: json['field1'] as String? ?? '',
      field2: json['field2'] as String? ?? '',
      field3: json['field3'] as String? ?? '',
      field4: json['field4'] as String? ?? '',
      field5: json['field5'] as String? ?? '',
      field6: json['field6'] as String? ?? '',
      field7: json['field7'] as String? ?? '',
      field8: json['field8'] as String? ?? '',
      field9: json['field9'] as String? ?? '',
      paymentSource: json['payment_source'] as String? ?? '',
      pgType: json['PG_TYPE'] as String? ?? '',
      error: json['error'] as String? ?? '',
      errorMessage: json['error_Message'] as String? ?? '',
      netAmountDebit: json['net_amount_debit'] as String? ?? '',
      unmappedstatus: json['unmappedstatus'] as String? ?? '',
      hash: json['hash'] as String? ?? '',
      bankRefNo: json['bank_ref_no'] as String? ?? '',
      bankRefNum: json['bank_ref_num'] as String? ?? '',
      bankcode: json['bankcode'] as String? ?? '',
      surl: json['surl'] as String? ?? '',
      curl: json['curl'] as String? ?? '',
      furl: json['furl'] as String? ?? '',
      cardHash: json['card_hash'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentInfoToJson(_$_PaymentInfo instance) =>
    <String, dynamic>{
      'mihpayid': instance.mihpayid,
      'mode': instance.mode,
      'status': instance.status,
      'key': instance.key,
      'txnid': instance.txnid,
      'amount': instance.amount,
      'addedon': instance.addedon,
      'productinfo': instance.productinfo,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipcode': instance.zipcode,
      'email': instance.email,
      'phone': instance.phone,
      'udf1': instance.udf1,
      'udf2': instance.udf2,
      'udf3': instance.udf3,
      'udf4': instance.udf4,
      'udf5': instance.udf5,
      'udf6': instance.udf6,
      'udf7': instance.udf7,
      'udf8': instance.udf8,
      'udf9': instance.udf9,
      'udf10': instance.udf10,
      'card_token': instance.cardToken,
      'card_no': instance.cardNo,
      'field0': instance.field0,
      'field1': instance.field1,
      'field2': instance.field2,
      'field3': instance.field3,
      'field4': instance.field4,
      'field5': instance.field5,
      'field6': instance.field6,
      'field7': instance.field7,
      'field8': instance.field8,
      'field9': instance.field9,
      'payment_source': instance.paymentSource,
      'PG_TYPE': instance.pgType,
      'error': instance.error,
      'error_Message': instance.errorMessage,
      'net_amount_debit': instance.netAmountDebit,
      'unmappedstatus': instance.unmappedstatus,
      'hash': instance.hash,
      'bank_ref_no': instance.bankRefNo,
      'bank_ref_num': instance.bankRefNum,
      'bankcode': instance.bankcode,
      'surl': instance.surl,
      'curl': instance.curl,
      'furl': instance.furl,
      'card_hash': instance.cardHash,
    };

_$_TripInfo _$$_TripInfoFromJson(Map<String, dynamic> json) => _$_TripInfo(
      serviceDateTime: json['serviceDateTime'] as String? ?? '',
      flightName: json['flightName'] as String? ?? '',
      flightNumber: json['flightNumber'] as String? ?? '',
      flightTerminal: json['flightTerminal'] as String? ?? '',
      flightDate: json['flightDate'] as String? ?? '',
      flightTime: json['flightTime'] as String? ?? '',
      transitDestRoundTripSecOrigin:
          json['transitDestRoundTripSecOrigin'] as int? ?? 0,
      transitRoundTripSecFlightName:
          json['transitRoundTripSecFlightName'] as String? ?? '',
      transitRoundTripSecFlightNumber:
          json['transitRoundTripSecFlightNumber'] as int? ?? 0,
      transitRoundTripSecFlightTerminal:
          json['transitRoundTripSecFlightTerminal'] as String? ?? '',
      transitRoundTripSecFlightDate:
          json['transitRoundTripSecFlightDate'] as String? ?? '',
      transitRoundTripSecFlightTime:
          json['transitRoundTripSecFlightTime'] as String? ?? '',
      roundTripSecServiceDateTime:
          json['roundTripSecServiceDateTime'] as String?,
    );

Map<String, dynamic> _$$_TripInfoToJson(_$_TripInfo instance) =>
    <String, dynamic>{
      'serviceDateTime': instance.serviceDateTime,
      'flightName': instance.flightName,
      'flightNumber': instance.flightNumber,
      'flightTerminal': instance.flightTerminal,
      'flightDate': instance.flightDate,
      'flightTime': instance.flightTime,
      'transitDestRoundTripSecOrigin': instance.transitDestRoundTripSecOrigin,
      'transitRoundTripSecFlightName': instance.transitRoundTripSecFlightName,
      'transitRoundTripSecFlightNumber':
          instance.transitRoundTripSecFlightNumber,
      'transitRoundTripSecFlightTerminal':
          instance.transitRoundTripSecFlightTerminal,
      'transitRoundTripSecFlightDate': instance.transitRoundTripSecFlightDate,
      'transitRoundTripSecFlightTime': instance.transitRoundTripSecFlightTime,
      'roundTripSecServiceDateTime': instance.roundTripSecServiceDateTime,
    };
