/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

class AirportTerminalDetailModel {
  String? terminalName;
  String? terminalCode;
  String? flightType;
  String? airportCity;
  String? airportPrefixName;
  String? latitude;
  String? longitude;
  String? airportCode;
  String? airportName;
  String? placeID;
  String? airportNameDescription;
  String? airportAddressDescription;
  List<String>? keywords;

  AirportTerminalDetailModel({
    this.terminalName,
    this.terminalCode,
    this.flightType,
    this.airportCity,
    this.airportPrefixName,
    this.latitude,
    this.longitude,
    this.airportCode,
    this.airportName,
    this.placeID,
    this.airportNameDescription,
    this.airportAddressDescription,
    this.keywords,
  });

  AirportTerminalDetailModel.fromJson(Map<String, dynamic> json) {
    terminalName = json['terminalName'];
    terminalCode = json['terminalCode'];
    flightType = json['flightType'];
    airportCity = json['airportCity'];
    airportPrefixName = json['airportPrefixName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    airportCode = json['airportCode'];
    airportName = json['airportName'];
    placeID = json['placeID'];
    airportNameDescription = json['airportNameDescription'];
    airportAddressDescription = json['airportAddressDescription'];
    keywords = json['keywords'] != null
        ? (json['keywords'] as List).map((v) => v.toString()).toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['terminalName'] = terminalName;
    data['terminalCode'] = terminalCode;
    data['flightType'] = flightType;
    data['airportCity'] = airportCity;
    data['airportPrefixName'] = airportPrefixName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['airportCode'] = airportCode;
    data['airportName'] = airportName;
    data['placeID'] = placeID;
    data['airportNameDescription'] = airportNameDescription;
    data['airportAddressDescription'] = airportAddressDescription;
    data['keywords'] = keywords;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AirportTerminalDetailModel &&
          runtimeType == other.runtimeType &&
          terminalName == other.terminalName &&
          terminalCode == other.terminalCode &&
          flightType == other.flightType &&
          airportCity == other.airportCity &&
          airportPrefixName == other.airportPrefixName &&
          airportCode == other.airportCode &&
          airportName == other.airportName &&
          placeID == other.placeID &&
          airportNameDescription == other.airportNameDescription &&
          airportAddressDescription == other.airportAddressDescription;

  @override
  int get hashCode => Object.hash(
        terminalName,
        terminalCode,
        flightType,
        airportCity,
        airportPrefixName,
        airportName,
        placeID,
        airportNameDescription,
        airportAddressDescription,
      );
}
