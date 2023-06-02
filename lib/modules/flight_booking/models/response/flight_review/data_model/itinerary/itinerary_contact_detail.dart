/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used for flight air-itinerary

import 'package:adani_airport_mobile/utils/ad_log.dart';

///contact detail object related to itinerary,
///it will initially empty object,only have count related info in view itinerary response
///it will update from contact info screen
class ItineraryContactDetail {
  ItineraryContactDetail({
    PersonName? personName,
    List<ContactNumber>? contactNumber,
    List<Email>? email,
    List<Address>? address,
  }) {
    _personName = personName;
    _contactNumber = contactNumber;
    _email = email;
    _address = address;
  }

  ItineraryContactDetail.fromJson(Map<String, dynamic> json) {
    _personName = json['personName'] != null
        ? PersonName.fromJson(json['personName'])
        : null;
    if (json['contactNumber'] != null) {
      _contactNumber = [];
      for (final object in json['contactNumber'] as List) {
        final ContactNumber contactNumber = ContactNumber.fromJson(object);
        _contactNumber?.add(contactNumber);
      }
    }
    if (json['email'] != null) {
      _email = [];
      for (final object in json['email'] as List) {
        final Email email = Email.fromJson(object);
        _email?.add(email);
      }
    }
    if (json['address'] != null) {
      _address = [];
      for (final object in json['address'] as List) {
        final Address address = Address.fromJson(object);
        _address?.add(address);
      }
    }
  }

  PersonName? _personName;
  List<ContactNumber>? _contactNumber;
  List<Email>? _email;
  List<Address>? _address;

  PersonName? get personName => _personName;
  List<ContactNumber>? get contactNumber => _contactNumber;
  List<Email>? get email => _email;
  List<Address>? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_personName != null) {
      map['personName'] = _personName?.toJson();
    }
    if (_contactNumber != null) {
      map['contactNumber'] = _contactNumber?.map((v) => v.toJson()).toList();
    }
    if (_email != null) {
      map['email'] = _email?.map((v) => v.toJson()).toList();
    }
    if (_address != null) {
      map['address'] = _address?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

///Address object related to itinerary
class Address {
  Address({
    String? addressLine,
    String? street,
    City? city,
    String? postalCode,
    StateProv? stateProv,
    Country? country,
    String? formattedInd,
    String? type,
    bool? isPrimary,
    String? operation,
  }) {
    _addressLine = addressLine;
    _street = street;
    _city = city;
    _postalCode = postalCode;
    _stateProv = stateProv;
    _country = country;
    _formattedInd = formattedInd;
    _type = type;
    _isPrimary = isPrimary;
    _operation = operation;
  }

  Address.fromJson(Map<String, dynamic> json) {
    _addressLine = json['addressLine'];
    _street = json['street'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _postalCode = json['postalCode'];
    _stateProv = json['stateProv'] != null
        ? StateProv.fromJson(json['stateProv'])
        : null;
    _country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    _formattedInd = json['formattedInd'];
    _type = json['type'];
    _isPrimary = json['isPrimary'];
    _operation = json['operation'];
  }
  String? _addressLine;
  String? _street;
  City? _city;
  String? _postalCode;
  StateProv? _stateProv;
  Country? _country;
  String? _formattedInd;
  String? _type;
  bool? _isPrimary;
  String? _operation;

  String? get addressLine => _addressLine;
  String? get street => _street;
  City? get city => _city;
  String? get postalCode => _postalCode;
  StateProv? get stateProv => _stateProv;
  Country? get country => _country;
  String? get formattedInd => _formattedInd;
  String? get type => _type;
  bool? get isPrimary => _isPrimary;
  String? get operation => _operation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addressLine'] = _addressLine;
    map['street'] = _street;
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    map['postalCode'] = _postalCode;
    if (_stateProv != null) {
      map['stateProv'] = _stateProv?.toJson();
    }
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    map['formattedInd'] = _formattedInd;
    map['type'] = _type;
    map['isPrimary'] = _isPrimary;
    map['operation'] = _operation;
    return map;
  }
}

///Country object related to itinerary
class Country {
  Country({
    String? code,
    String? countryName,
  }) {
    _code = code;
    _countryName = countryName;
  }

  Country.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _countryName = json['countryName'];
  }
  String? _code;
  String? _countryName;

  String? get code => _code;
  String? get countryName => _countryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['countryName'] = _countryName;
    return map;
  }
}

///StateProv object related to itinerary
class StateProv {
  StateProv({
    String? stateCode,
    String? stateName,
  }) {
    _stateCode = stateCode;
    _stateName = stateName;
  }

  StateProv.fromJson(Map<String, dynamic> json) {
    _stateCode = json['stateCode'];
    _stateName = json['stateName'];
  }
  String? _stateCode;
  String? _stateName;

  String? get stateCode => _stateCode;
  String? get stateName => _stateName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stateCode'] = _stateCode;
    map['stateName'] = _stateName;
    return map;
  }
}

///City object related to itinerary
class City {
  City({
    String? locationCode,
    String? codeContext,
    String? cityName,
  }) {
    _locationCode = locationCode;
    _codeContext = codeContext;
    _cityName = cityName;
  }

  City.fromJson(Map<String, dynamic> json) {
    _locationCode = json['locationCode'];
    _codeContext = json['codeContext'];
    _cityName = json['cityName'];
  }
  String? _locationCode;
  String? _codeContext;
  String? _cityName;

  String? get locationCode => _locationCode;
  String? get codeContext => _codeContext;
  String? get cityName => _cityName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['locationCode'] = _locationCode;
    map['codeContext'] = _codeContext;
    map['cityName'] = _cityName;
    return map;
  }
}

///Email object related to itinerary
class Email {
  Email({
    String? emailId,
    bool? isPrimary,
    String? emailType,
  }) {
    _emailId = emailId;
    _isPrimary = isPrimary;
    _emailType = emailType;
  }

  Email.fromJson(Map<String, dynamic> json) {
    _emailId = json['emailId'];
    _isPrimary = json['isPrimary'];
    _emailType = json['emailType'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emailId'] = _emailId;
    map['isPrimary'] = _isPrimary;
    map['emailType'] = _emailType;
    return map;
  }

  String? _emailId;
  bool? _isPrimary;
  String? _emailType;

  String? get emailId => _emailId;
  bool? get isPrimary => _isPrimary;
  String? get emailType => _emailType;
}

///ContactNumber object related to itinerary
class ContactNumber {
  ContactNumber({
    String? phoneNumber,
    String? mobile,
    String? fax,
    String? phoneLocationType,
    String? countryAccessCode,
    String? areaCityCode,
    String? extension,
    String? pin,
    String? formattedInd,
    String? locationCode,
    bool? isPrimary,
  }) {
    _phoneNumber = phoneNumber;
    _mobile = mobile;
    _fax = fax;
    _phoneLocationType = phoneLocationType;
    _countryAccessCode = countryAccessCode;
    _areaCityCode = areaCityCode;
    _extension = extension;
    _pin = pin;
    _formattedInd = formattedInd;
    _locationCode = locationCode;
    _isPrimary = isPrimary;
  }

  ContactNumber.fromJson(Map<String, dynamic> json) {
    _phoneNumber = json['phoneNumber'];
    _mobile = json['mobile'];
    _fax = json['fax'];
    _phoneLocationType = json['phoneLocationType'];
    _countryAccessCode = json['countryAccessCode'];
    _areaCityCode = json['areaCityCode'];
    _extension = json['extension'];
    _pin = json['pin'];
    _formattedInd = json['formattedInd'];
    _locationCode = json['locationCode'];
    _isPrimary = json['isPrimary'];
  }
  String? _phoneNumber;
  String? _mobile;
  String? _fax;
  String? _phoneLocationType;
  String? _countryAccessCode;
  String? _areaCityCode;
  String? _extension;
  String? _pin;
  String? _formattedInd;
  String? _locationCode;
  bool? _isPrimary;

  String? get phoneNumber => _phoneNumber;
  String? get mobile => _mobile;
  String? get fax => _fax;
  String? get phoneLocationType => _phoneLocationType;
  String? get countryAccessCode => _countryAccessCode;
  String? get areaCityCode => _areaCityCode;
  String? get extension => _extension;
  String? get pin => _pin;
  String? get formattedInd => _formattedInd;
  String? get locationCode => _locationCode;
  bool? get isPrimary => _isPrimary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = _phoneNumber;
    map['mobile'] = _mobile;
    map['phoneLocationType'] = _phoneLocationType;
    map['countryAccessCode'] = _countryAccessCode;
    map['areaCityCode'] = _areaCityCode;
    map['extension'] = _extension;
    map['isPrimary'] = _isPrimary;
    return map;
  }
}

///PersonName object related to itinerary
class PersonName {
  PersonName({
    this.namePrefix,
    this.firstName,
    this.lastName,
    this.middleName,
  }) {
    adLog('data not found');
  }

  PersonName.fromJson(Map<String, dynamic> json) {
    namePrefix = json['namePrefix'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
  }

  String? namePrefix;
  String? firstName;
  String? lastName;
  String? middleName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['namePrefix'] = namePrefix;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['middleName'] = middleName;
    return map;
  }
}
