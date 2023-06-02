/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

//this class will used to request Flight request -reference from flight list screen
String flightSearchRequestModelToJson(FlightSearchRequestModel data) =>
    json.encode(data.toJson());

class FlightSearchRequestModel {
  FlightSearchRequestModel({
    ProcessingInfo? processingInfo,
    List<OriginDestinationInformation>? originDestinationInformation,
    TravelPreferences? travelPreferences,
    List<Passengers>? passengers,
  }) {
    _processingInfo = processingInfo;
    _originDestinationInformation = originDestinationInformation;
    _travelPreferences = travelPreferences;
    _passengers = passengers;
  }

  ProcessingInfo? _processingInfo;
  List<OriginDestinationInformation>? _originDestinationInformation;
  TravelPreferences? _travelPreferences;
  List<Passengers>? _passengers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_processingInfo != null) {
      map['processingInfo'] = _processingInfo?.toJson();
    }
    if (_originDestinationInformation != null) {
      map['originDestinationInformation'] =
          _originDestinationInformation?.map((v) => v.toJson()).toList();
    }
    if (_travelPreferences != null) {
      map['travelPreferences'] = _travelPreferences?.toJson();
    }
    if (_passengers != null) {
      map['passengers'] = _passengers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// type : "ADT"
/// count : 1
/// age : 40

String passengersToJson(Passengers data) => json.encode(data.toJson());

class Passengers {
  Passengers({
    String? type,
    int? count,
  }) {
    _type = type;
    _count = count;
  }

  String? _type;
  int? _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['count'] = _count;
    return map;
  }
}

/// farePref : {"fareDisplayCurrency":"INR"}
/// cabinPref : [{"cabin":"Economy"}]

String travelPreferencesToJson(TravelPreferences data) =>
    json.encode(data.toJson());

class TravelPreferences {
  TravelPreferences({
    FarePref? farePref,
    List<CabinPref>? cabinPref,
  }) {
    _farePref = farePref;
    _cabinPref = cabinPref;
  }

  FarePref? _farePref;
  List<CabinPref>? _cabinPref;

  FarePref? get farePref => _farePref;
  List<CabinPref>? get cabinPref => _cabinPref;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_farePref != null) {
      map['farePref'] = _farePref?.toJson();
    }
    if (_cabinPref != null) {
      map['cabinPref'] = _cabinPref?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// cabin : "Economy"

String cabinPrefToJson(CabinPref data) => json.encode(data.toJson());

class CabinPref {
  CabinPref({
    String? cabin,
  }) {
    _cabin = cabin;
  }

  String? _cabin;

  String? get cabin => _cabin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cabin'] = _cabin;
    return map;
  }
}

/// fareDisplayCurrency : "INR"

String farePrefToJson(FarePref data) => json.encode(data.toJson());

class FarePref {
  FarePref({
    String? fareDisplayCurrency,
  }) {
    _fareDisplayCurrency = fareDisplayCurrency;
  }

  String? _fareDisplayCurrency;

  String? get fareDisplayCurrency => _fareDisplayCurrency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fareDisplayCurrency'] = _fareDisplayCurrency;
    return map;
  }
}

/// departureDateTime : {"windowAfter":"20-01-2022"}
/// originLocation : {"locationCode":"DEL"}
/// destinationLocation : {"locationCode":"BOM"}
/// rph : "1"

String originDestinationInformationToJson(OriginDestinationInformation data) =>
    json.encode(data.toJson());

class OriginDestinationInformation {
  OriginDestinationInformation({
    DepartureDateTime? departureDateTime,
    OriginLocation? originLocation,
    DestinationLocation? destinationLocation,
    String? rph,
  }) {
    _departureDateTime = departureDateTime;
    _originLocation = originLocation;
    _destinationLocation = destinationLocation;
    _rph = rph;
  }

  DepartureDateTime? _departureDateTime;
  OriginLocation? _originLocation;
  DestinationLocation? _destinationLocation;
  String? _rph;

  DepartureDateTime? get departureDateTime => _departureDateTime;
  OriginLocation? get originLocation => _originLocation;
  DestinationLocation? get destinationLocation => _destinationLocation;
  String? get rph => _rph;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_departureDateTime != null) {
      map['departureDateTime'] = _departureDateTime?.toJson();
    }
    if (_originLocation != null) {
      map['originLocation'] = _originLocation?.toJson();
    }
    if (_destinationLocation != null) {
      map['destinationLocation'] = _destinationLocation?.toJson();
    }
    map['rph'] = _rph;
    return map;
  }
}

/// locationCode : "BOM"

String destinationLocationToJson(DestinationLocation data) =>
    json.encode(data.toJson());

class DestinationLocation {
  DestinationLocation({
    String? locationCode,
    String? countryCode,
  }) {
    _locationCode = locationCode;
    _countryCode = countryCode;
  }

  String? _locationCode;
  String? _countryCode;

  String? get locationCode => _locationCode;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['locationCode'] = _locationCode;
    map['countryCode'] = _countryCode;
    return map;
  }
}

/// locationCode : "DEL"

String originLocationToJson(OriginLocation data) => json.encode(data.toJson());

class OriginLocation {
  OriginLocation({
    String? locationCode,
    String? countryCode,
  }) {
    _locationCode = locationCode;
    _countryCode = countryCode;
  }

  String? _locationCode;
  String? _countryCode;

  String? get locationCode => _locationCode;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['locationCode'] = _locationCode;
    map['countryCode'] = _countryCode;
    return map;
  }
}

/// windowAfter : "20-01-2022"

String departureDateTimeToJson(DepartureDateTime data) =>
    json.encode(data.toJson());

class DepartureDateTime {
  DepartureDateTime({
    String? windowAfter,
  }) {
    _windowAfter = windowAfter;
  }

  String? _windowAfter;

  String? get windowAfter => _windowAfter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['windowAfter'] = _windowAfter;
    return map;
  }
}

/// SectorInd : "D"
/// TripType : "ONEWAY"
/// countryCode : "IN"

String processingInfoToJson(ProcessingInfo data) => json.encode(data.toJson());

class ProcessingInfo {
  ProcessingInfo({
    String? sectorInd,
    String? tripType,
    String? countryCode,
  }) {
    _sectorInd = sectorInd;
    _tripType = tripType;
    _countryCode = countryCode;
  }

  String? _sectorInd;
  String? _tripType;
  String? _countryCode;

  String? get sectorInd => _sectorInd;
  String? get tripType => _tripType;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sectorInd'] = _sectorInd;
    map['tripType'] = _tripType;
    map['countryCode'] = _countryCode;
    return map;
  }
}
