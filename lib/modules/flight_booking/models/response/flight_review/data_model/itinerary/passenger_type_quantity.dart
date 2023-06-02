/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used to PassengerTypeQuantity related to flight segment-itinerary
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/fare_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/total.dart';

class PassengerTypeQuantity {
  PassengerTypeQuantity({
    Total? baseFare,
    Total? taxes,
    Total? totalFare,
    Total? fees,
    List<FareInfo>? fareInfo,
    dynamic key,
    String? code,
    int? quantity,
  }) {
    _baseFare = baseFare;
    _taxes = taxes;
    _totalFare = totalFare;
    _fareInfo = fareInfo;
    _key = key;
    _code = code;
    _quantity = quantity;
    _fees = fees;
  }

  Total? _baseFare;
  Total? _taxes;
  Total? _totalFare;
  List<FareInfo>? _fareInfo;
  Total? _fees;
  dynamic _key;
  String? _code;
  int? _quantity;

  Total? get baseFare => _baseFare;
  Total? get taxes => _taxes;
  Total? get totalFare => _totalFare;
  List<FareInfo>? get fareInfo => _fareInfo;
  dynamic get key => _key;
  String? get code => _code;
  int? get quantity => _quantity;
  Total? get fees => _fees;

  factory PassengerTypeQuantity.fromJson(Map<String, dynamic> json) =>
      PassengerTypeQuantity(
        baseFare: json['baseFare'] == null
            ? null
            : Total.fromJson(
                json['baseFare'],
              ),
        taxes: json['taxes'] == null
            ? null
            : Total.fromJson(
                json['taxes'],
              ),
        totalFare: json['totalFare'] == null
            ? null
            : Total.fromJson(
                json['totalFare'],
              ),
        code: json['code'],
        quantity: json['quantity'],
        fareInfo: json['fareInfo'] == null
            ? null
            : List<FareInfo>.from(
                (json['fareInfo'] as List).map(
                  (x) => FareInfo.fromJson(x),
                ),
              ),
        fees: json['fees'] == null
            ? null
            : Total.fromJson(
                json['fees'],
              ),
      );
}
