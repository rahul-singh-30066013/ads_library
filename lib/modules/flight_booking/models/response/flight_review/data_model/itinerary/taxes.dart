/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used for flight segment-itinerary

/// tax : [{"amount":128,"currencyCode":"INR","taxCode":"SGST","taxDesc":null,"perPaxAmount":64},{"amount":128,"currencyCode":"INR","taxCode":"CGST","taxDesc":null,"perPaxAmount":64},{"amount":120,"currencyCode":"INR","taxCode":"CUTE","taxDesc":null,"perPaxAmount":60},{"amount":654,"currencyCode":"INR","taxCode":"AIRLINE-MSC","taxDesc":null,"perPaxAmount":327},{"amount":126,"currencyCode":"INR","taxCode":"UDF","taxDesc":null,"perPaxAmount":63},{"amount":100,"currencyCode":"INR","taxCode":"RCF","taxDesc":null,"perPaxAmount":50},{"amount":560,"currencyCode":"INR","taxCode":"GW","taxDesc":null,"perPaxAmount":280}]
/// amount : 1816
/// currencyCode : "INR"
/// perPaxAmount : 908

class Taxes {
  Taxes({
    List<Tax>? tax,
    double? amount,
    String? currencyCode,
    double? perPaxAmount,
  }) {
    _tax = tax;
    _amount = amount;
    _currencyCode = currencyCode;
    _perPaxAmount = perPaxAmount;
  }

  Taxes.fromJson(Map<String, dynamic> json) {
    if (json['tax'] != null) {
      _tax = [];
      for (final object in json['tax'] as List) {
        final Tax tax = Tax.fromJson(object);
        _tax?.add(tax);
      }
    }
    if (json['perPaxAmount'] != null) {
      _perPaxAmount = double.parse(json['perPaxAmount'].toString());
    }
    if (json['amount'] != null) {
      _amount = double.parse(json['amount'].toString());
    }
    if (json['currencyCode'] != null) {
      _currencyCode = json['currencyCode'];
    }
  }
  List<Tax>? _tax;
  double? _amount;
  String? _currencyCode;
  double? _perPaxAmount;

  List<Tax>? get tax => _tax;
  double? get amount => _amount;
  String? get currencyCode => _currencyCode;
  double? get perPaxAmount => _perPaxAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tax != null) {
      map['tax'] = _tax?.map((v) => v.toJson()).toList();
    }
    if (_perPaxAmount != null) {
      map['perPaxAmount'] = _perPaxAmount;
    }
    if (_amount != null) {
      map['amount'] = _amount;
    }
    if (_currencyCode != null) {
      map['currencyCode'] = _currencyCode;
    }
    return map;
  }
}

/// amount : 128
/// currencyCode : "INR"
/// taxCode : "SGST"
/// taxDesc : null
/// perPaxAmount : 64

class Tax {
  Tax({
    double? amount,
    String? currencyCode,
    String? taxCode,
    String? taxDesc,
    double? perPaxAmount,
  }) {
    _amount = amount;
    _currencyCode = currencyCode;
    _taxCode = taxCode;
    _taxDesc = taxDesc;
    _perPaxAmount = perPaxAmount;
  }

  Tax.fromJson(Map<String, dynamic> json) {
    if (json['perPaxAmount'] != null) {
      _perPaxAmount = double.parse(json['perPaxAmount'].toString());
    }
    if (json['amount'] != null) {
      _amount = double.parse(json['amount'].toString());
    }
    if (json['currencyCode'] != null) {
      _currencyCode = json['currencyCode'];
    }
    if (json['taxCode'] != null) {
      _taxCode = json['taxCode'];
    }
    if (json['taxDesc'] != null) {
      _taxDesc = json['taxDesc'];
    }
  }
  double? _amount;
  String? _currencyCode;
  String? _taxCode;
  String? _taxDesc;
  double? _perPaxAmount;

  double? get amount => _amount;
  String? get currencyCode => _currencyCode;
  String? get taxCode => _taxCode;
  String? get taxDesc => _taxDesc;
  double? get perPaxAmount => _perPaxAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_taxCode != null) {
      map['taxCode'] = _taxCode;
    }
    if (_taxDesc != null) {
      map['taxDesc'] = _taxDesc;
    }
    if (_perPaxAmount != null) {
      map['perPaxAmount'] = _perPaxAmount;
    }
    if (_amount != null) {
      map['amount'] = _amount;
    }
    if (_currencyCode != null) {
      map['currencyCode'] = _currencyCode;
    }
    return map;
  }
}
