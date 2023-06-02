/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used for GST object in itinerary

/// gstHolderAddress : "Test , test apartment, test road, test phase, test nagar, Bangalore 560078"
/// gstHolderName : "Test Holder Name."
/// gstHolderStateCode : "22"
/// gstHolderStateName : "Chhattisgarh"
/// gstNumber : "22BHURJ3851M1Z5"

class GstDetails {
  GstDetails({
    String? gstHolderAddress,
    String? gstHolderName,
    String? gstHolderStateCode,
    String? gstHolderStateName,
    String? gstNumber,
    String? gstHolderCountryName,
    String? gstHolderPinCode,
    String? gstHolderCityName,
  }) {
    _gstHolderAddress = gstHolderAddress;
    _gstHolderName = gstHolderName;
    _gstHolderStateCode = gstHolderStateCode;
    _gstHolderStateName = gstHolderStateName;
    _gstNumber = gstNumber;
    _gstHolderCountryName = gstHolderCountryName;
    _gstHolderPinCode = gstHolderPinCode;
    _gstHolderCityName = gstHolderCityName;
  }

  GstDetails.fromJson(Map<String, dynamic> json) {
    _gstHolderAddress = json['gstHolderAddress'];
    _gstHolderName = json['gstHolderName'];
    _gstHolderStateCode = json['gstHolderStateCode'];
    _gstHolderStateName = json['gstHolderStateName'];
    _gstNumber = json['gstNumber'];
    _gstHolderCountryName = json['gstHolderCountry'];
    _gstHolderPinCode = json['gstHolderPIN'];
    _gstHolderCityName = json['gstHolderCity'];
  }

  String? _gstHolderAddress;
  String? _gstHolderName;
  String? _gstHolderStateCode;
  String? _gstHolderStateName;
  String? _gstNumber;
  String? _gstHolderCountryName;
  String? _gstHolderPinCode;
  String? _gstHolderCityName;

  String? get gstHolderAddress => _gstHolderAddress;

  String? get gstHolderName => _gstHolderName;

  String? get gstHolderStateCode => _gstHolderStateCode;

  String? get gstHolderStateName => _gstHolderStateName;

  String? get gstNumber => _gstNumber;

  String? get gstHolderCountryName => _gstHolderCountryName;

  String? get gstHolderPinCode => _gstHolderPinCode;

  String? get gstHolderCityName => _gstHolderCityName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gstHolderAddress'] = _gstHolderAddress;
    map['gstHolderName'] = _gstHolderName;
    map['gstHolderStateCode'] = _gstHolderStateCode;
    map['gstHolderStateName'] = _gstHolderStateName;
    map['gstNumber'] = _gstNumber;
    map['gstHolderCountry'] = _gstHolderCountryName;
    map['gstHolderPIN'] = _gstHolderPinCode;
    map['gstHolderCity'] = _gstHolderCityName;

    return map;
  }
}
