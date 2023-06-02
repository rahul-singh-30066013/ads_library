/*
* Copyright (c) 2023 .
* All rights reserved.
* Adani Digital Labs Confidential Information
*/

class UpdateCabCartRequestModel {
  String? category;
  String? firstName;
  String? lastName;
  String? countryCode;
  String? mobileNumber;
  String? email;
  String? gstNumber;
  String? companyName;
  String? address;
  String? nationality;
  String? pinCode;
  String? state;
  String? city;
  List<BillingAddress>? billingAddress;

  UpdateCabCartRequestModel({
    this.category,
    this.firstName,
    this.lastName,
    this.countryCode,
    this.mobileNumber,
    this.gstNumber,
    this.companyName,
    this.email,
    this.address,
    this.nationality,
    this.pinCode,
    this.state,
    this.city,
    this.billingAddress,
  });

  UpdateCabCartRequestModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    countryCode = json['countryCode'];
    mobileNumber = json['mobileNumber'];
    gstNumber = json['gstNumber'];
    companyName = json['companyName'];
    email = json['email'];
    address = json['address'];
    nationality = json['nationality'];
    pinCode = json['pincode'];
    state = json['state'];
    city = json['city'];
    if (json['billingAddress'] != null) {
      billingAddress = <BillingAddress>[];
      for (final Map<String, dynamic> billingAddressItem
          in json['billingAddress']) {
        billingAddress?.add(BillingAddress.fromJson(billingAddressItem));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['countryCode'] = countryCode;
    data['mobileNumber'] = mobileNumber;
    data['gstNumber'] = gstNumber;
    data['companyName'] = companyName;
    data['email'] = email;
    data['address'] = address;
    data['nationality'] = nationality;
    data['pincode'] = pinCode;
    data['state'] = state;
    data['city'] = city;
    if (billingAddress != null) {
      data['billingAddress'] = billingAddress?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BillingAddress {
  String? addressLine;
  String? street;
  City? city;
  String? postalCode;
  StateProv? stateProv;
  Country? country;
  String? formattedInd;
  String? type;
  bool? isPrimary;
  String? operation;

  BillingAddress({
    this.addressLine,
    this.street,
    this.city,
    this.postalCode,
    this.stateProv,
    this.country,
    this.formattedInd,
    this.type,
    this.isPrimary,
    this.operation,
  });

  BillingAddress.fromJson(Map<String, dynamic> json) {
    addressLine = json['addressLine'];
    street = json['street'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    postalCode = json['postalCode'];
    stateProv = json['stateProv'] != null
        ? StateProv.fromJson(json['stateProv'])
        : null;
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    formattedInd = json['formattedInd'];
    type = json['type'];
    isPrimary = json['isPrimary'];
    operation = json['operation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressLine'] = addressLine;
    data['street'] = street;
    if (city != null) {
      data['city'] = city?.toJson();
    }
    data['postalCode'] = postalCode;
    if (stateProv != null) {
      data['stateProv'] = stateProv?.toJson();
    }
    if (country != null) {
      data['country'] = country?.toJson();
    }
    data['formattedInd'] = formattedInd;
    data['type'] = type;
    data['isPrimary'] = isPrimary;
    data['operation'] = operation;
    return data;
  }
}

class City {
  String? locationCode;
  String? codeContext;
  String? cityName;

  City({this.locationCode, this.codeContext, this.cityName});

  City.fromJson(Map<String, dynamic> json) {
    locationCode = json['locationCode'];
    codeContext = json['codeContext'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locationCode'] = locationCode;
    data['codeContext'] = codeContext;
    data['cityName'] = cityName;
    return data;
  }
}

class StateProv {
  String? stateCode;
  String? stateName;

  StateProv({this.stateCode, this.stateName});

  StateProv.fromJson(Map<String, dynamic> json) {
    stateCode = json['stateCode'];
    stateName = json['stateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stateCode'] = stateCode;
    data['stateName'] = stateName;
    return data;
  }
}

class Country {
  String? code;
  String? countryName;

  Country({this.code, this.countryName});

  Country.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    countryName = json['countryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['countryName'] = countryName;
    return data;
  }
}
