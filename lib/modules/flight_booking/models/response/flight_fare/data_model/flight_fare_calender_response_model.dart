/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class will use as model class to receive response from  fare calender api

import 'package:adani_airport_mobile/utils/ad_log.dart';

class FlightFareCalenderResponseModel {
  FlightFareCalenderResponseModel({
    List<FareCalendars>? fareCalendars,
  }) {
    _fareCalendars = fareCalendars;
  }

  FlightFareCalenderResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['fareCalendars'] != null) {
      _fareCalendars = [];
      for (final object in json['fareCalendars'] as List) {
        final FareCalendars fareInfoItem = FareCalendars.fromJson(object);
        final splitArray = fareInfoItem._date?.split('-');
        List<FareCalendars> mtempList = [];
        if (splitArray != null) {
          final String months = splitArray[1];
          if (_monthPriceMap.containsKey(months)) {
            mtempList = _monthPriceMap[months] ?? []
              ..add(fareInfoItem);
            _monthPriceMap[months] = mtempList;
          } else {
            mtempList.add(fareInfoItem);
            _monthPriceMap[months] = mtempList;
          }
        }
        _fareCalendars?.add(fareInfoItem);
      }
      _minMaxPrices = minMaxPrice();
    }
    for (int index = 0; index < _monthPriceMap.keys.length; index++) {
      final mtempList =
          _monthPriceMap[_monthPriceMap.keys.toList()[index]] ?? []
            ..sort(
              (a, b) =>
                  (a.prices?.amount ?? 0.0).compareTo(b.prices?.amount ?? 0.0),
            );
      adLog('$mtempList');
    }
  }

  List<FareCalendars>? _fareCalendars;
  final Map<String, List<FareCalendars>> _monthPriceMap = {};

  MinMaxPrice? _minMaxPrices;

  List<FareCalendars>? get fareCalendars => _fareCalendars;
  MinMaxPrice? get minMaxPrices => _minMaxPrices;
  Map<String, List<FareCalendars>> get monthPriceMap => _monthPriceMap;
  //sort based on the price
  MinMaxPrice? minMaxPrice() {
    _fareCalendars?.sort(
      (a, b) => (a.prices?.amount ?? 0.0).compareTo(b.prices?.amount ?? 0.0),
    );
    return MinMaxPrice(
      _fareCalendars?.first.prices?.amount ?? 0.0,
      _fareCalendars?.last.prices?.amount ?? 0.0,
    );
  }
}

/// date : "08-02-2022"
/// prices : [{"from":"DEL","to":"BLR","amount":3983.0}]

class FareCalendars {
  FareCalendars({
    String? date,
    Prices? prices,
  }) {
    _date = date;
    _prices = prices;
  }

  FareCalendars.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    if (json['prices'] != null) {
      final object = (json['prices'] as List).isNotEmpty
          ? (json['prices'] as List).first
          : null;
      final Prices priceInfoItem = Prices.fromJson(object);
      _prices = priceInfoItem;
    }
  }
  String? _date;
  Prices? _prices;

  String? get date => _date;
  Prices? get prices => _prices;
}

/// from : "DEL"
/// to : "BLR"
/// amount : 3983.0

class Prices {
  Prices({
    String? from,
    String? to,
    double? amount,
  }) {
    _from = from;
    _to = to;
    _amount = amount;
  }

  Prices.fromJson(Map<String, dynamic> json) {
    _from = json['from'];
    _to = json['to'];
    _amount = json['amount'];
  }
  String? _from;
  String? _to;
  double? _amount;

  String? get from => _from;
  String? get to => _to;
  double? get amount => _amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = _from;
    map['to'] = _to;
    map['amount'] = _amount;
    return map;
  }
}

class MinMaxPrice {
  double minPrice;
  double maxPrice;

  MinMaxPrice(this.minPrice, this.maxPrice);
}
