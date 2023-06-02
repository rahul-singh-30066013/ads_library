/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/payment_modes.dart';

//this model class is used for flight book request model
class FlightBookRequestModel {
  String? _tripId;
  String? _refrenceID;
  double? _amount;
  double? _loyaltyAmount;
  String? _loyaltyReferenceId;

  FlightBookRequestModel({
    String? tripId,
    String? refrenceID,
    double? amount,
    double? loyaltyAmount,
    String? loyaltyReferenceId,
  }) {
    _tripId = tripId;
    _refrenceID = refrenceID;
    _amount = amount;
    _loyaltyAmount = loyaltyAmount;
    _loyaltyReferenceId = loyaltyReferenceId;
  }

  FlightBookRequestModel copyWith({
    String? tripId,
    String? refrenceID,
    double? amount,
    double? loyaltyAmount,
    String? loyaltyReferenceId,
    // List<PaymentModes>? paymentModes,
  }) {
    return FlightBookRequestModel(
      tripId: tripId ?? _tripId,
      amount: amount ?? _amount,
      loyaltyAmount: loyaltyAmount ?? _loyaltyAmount,
      loyaltyReferenceId: loyaltyReferenceId ?? _loyaltyReferenceId,
      refrenceID: refrenceID ?? refrenceID,
      // paymentModes: paymentModes ?? _paymentModes,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tripId'] = _tripId;
    map['amount'] = _amount;
    map['referenceID'] = _refrenceID;
    map['loyaltyReferenceId'] = _loyaltyReferenceId;
    map['loyaltyAmount'] = _loyaltyAmount;

    return map;
  }

  FlightBookRequestModel.fromJson(Map<String, dynamic> json) {
    _tripId = json['tripId'];
    _amount = json['amount'];
    _loyaltyReferenceId = json['loyaltyReferenceId'];
    _loyaltyAmount = json['loyaltyAmount'];
    _refrenceID = json['referenceID'];
    // if (json['paymentModes'] != null) {
    //   _paymentModes = [];
    //   for (final object in json['paymentModes'] as List) {
    //     final PaymentModes paymentModes = PaymentModes.fromJson(object);
    //     _paymentModes?.add(paymentModes);
    //   }
    // }
  }

  ///create Booking RequestBody string param prepare
  String createBookingRequestBody(double? totalFare) {
    final List<PaymentModes> paymentModes = [];
    final PaymentModes paymentModesItem = PaymentModes(
      amount: totalFare,
      paymentInfo: [],
    );
    paymentModes.add(paymentModesItem);
    final FlightBookRequestModel flightBookRequestModel =
        FlightBookRequestModel().copyWith(
      tripId: _tripId,
      refrenceID: _refrenceID,
      amount: _amount,
      loyaltyAmount: _loyaltyAmount,
      loyaltyReferenceId: _loyaltyReferenceId,
      // paymentModes: paymentModes,
    );

    return jsonEncode(flightBookRequestModel);
  }
}
