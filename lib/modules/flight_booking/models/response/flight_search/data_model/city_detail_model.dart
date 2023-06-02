/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';

///Model class for City, it defines the structure of data received for each airport.
///[cityCode] it is a 3 letter code (String) which uniquely identifies each airport.
///[airportName] full name of airport, it is a String value.
///[cityName] name of the city where airport is located, it is a string.
///[keywords] it is a set of names for identifying an airport, it is a list of Strings.
@immutable
class CityDetailModel {
  ///
  /// usage
  /// CityDetailModel(
  ///         cityCode: 'DEL',
  ///         airportName: 'Indra Gandhi International Airport, Delhi',
  ///         cityName: 'Delhi',
  ///         keywords: [
  ///           'New Delhi',
  ///           'Delhi',
  ///           'NCR',
  ///         ],
  ///       );

  ///*[cityCode] it is a 3 letter code (String) which uniquely identifies each airport.
  final String? cityCode;

  ///*[airportName] used to show the short name of city(airport) name.
  final String? airportName;

  ///*[cityName] used to show the city(airport) name.
  final String? cityName;

  ///*[countryName] used to show the country name.
  final String? countryName;

  ///*[countryCode] used to show the country code like IN,UK.
  final String? countryCode;

  ///*[countryName] used to show the country name.
  final bool? isPranaam;

  ///*[countryName] used to show the country name.
  final bool? isPranaamMasterAirport;

  ///*[keywords] it is a set of names for identifying an airport.
  final List<String>? keywords;

  ///*[cityPlaceholder] used to identify the whether it is from city or to city.
  final String? cityPlaceholder;
  final bool? isPopular;
  final String? airportCode;

  final bool? isDomestic;

  final String? airportID;
  final bool? isMasterAirport;

  const CityDetailModel({
    this.cityName,
    this.keywords,
    this.cityCode,
    this.airportName,
    this.cityPlaceholder = '',
    this.countryName = '',
    this.countryCode = '',
    this.isPopular,
    this.airportCode,
    this.isPranaam,
    this.isPranaamMasterAirport,
    this.isDomestic,
    this.airportID,
    this.isMasterAirport = true,
  });

  @override
  String toString() {
    return 'CityDetailModel{cityCode: $cityCode, airportName: $airportName, cityName: $cityName, country: $countryName, keywords: $keywords, cityPlaceholder: $cityPlaceholder, isPopular: $isPopular, airportCode: $airportCode, isPranaam: $isPranaam,isPranaamMasterAirport:$isPranaamMasterAirport, isDomestic: $isDomestic, airportID: $airportID}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityDetailModel &&
          runtimeType == other.runtimeType &&
          cityCode == other.cityCode &&
          airportName == other.airportName &&
          cityName == other.cityName &&
          countryName == other.countryName &&
          countryCode == other.countryCode &&
          cityPlaceholder == other.cityPlaceholder &&
          isDomestic == other.isDomestic &&
          airportID == other.airportID &&
          airportCode == other.airportCode &&
          isMasterAirport == other.isMasterAirport;
  @override
  int get hashCode =>
      cityCode.hashCode ^
      airportName.hashCode ^
      airportCode.hashCode ^
      cityName.hashCode ^
      countryName.hashCode ^
      countryCode.hashCode ^
      keywords.hashCode ^
      cityPlaceholder.hashCode ^
      isPopular.hashCode ^
      isPranaam.hashCode ^
      isDomestic.hashCode ^
      isMasterAirport.hashCode ^
      airportID.hashCode;

  factory CityDetailModel.fromJson(Map<String, dynamic> json) {
    final List<String> listItems = [];
    if (json['keywords'] != null) {
      for (final object in json['keywords'] as List) {
        final String items = object;
        listItems.add(items);
      }
    }
    return CityDetailModel(
      cityCode: json['airportCode'],
      airportName: json['airportName'],
      cityName: json['cityName'],
      countryName: json['countryName'],
      countryCode: json['countryCode'],
      isPopular: json['isPopular'] as bool?,
      airportCode: json['airportCode'] as String?,
      keywords: listItems,
      cityPlaceholder: json['cityPlaceholder'] as String?,
      isPranaam: json['isPranaam'] as bool?,
      isPranaamMasterAirport: json['isPranaamMasterAirport'] as bool?,
      isDomestic: json['isDomestic'] as bool?,
      airportID: json['airportID'] as String?,
      isMasterAirport: json['isMasterAirport'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'cityCode': airportCode,
        'airportName': airportName,
        'cityName': cityName,
        'countryName': countryName,
        'countryCode': countryCode,
        'isPopular': isPopular,
        'airportCode': airportCode,
        'keywords': keywords,
        'cityPlaceholder': cityPlaceholder,
        'isPranaam': isPranaam,
        'isPranaamMasterAirport': isPranaamMasterAirport,
        'isDomestic': isDomestic,
        'airportID': airportID,
        'isMasterAirport': isMasterAirport,
      };
}
