/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_core_masters.freezed.dart';
part 'site_core_masters.g.dart';

SiteCoreMasters siteCoreMastersFromJson(String str) =>
    SiteCoreMasters.fromJson(json.decode(str));

String siteCoreMastersToJson(SiteCoreMasters data) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
abstract class SiteCoreMasters with _$SiteCoreMasters {
  const factory SiteCoreMasters({
    @Default([]) List<Element> elements,
  }) = _SiteCoreMasters;

  factory SiteCoreMasters.fromJson(Map<String, dynamic> json) =>
      _$SiteCoreMastersFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Element with _$Element {
  const factory Element({
    @Default('') String uid,
    @Default('') String componentName,
    @Default('') String dataSource,
    @Default(Params()) Params params,
    @Default(Fields()) Fields fields,
  }) = _Element;

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Fields with _$Fields {
  const factory Fields({
    @Default([]) List<Country> country,
    @Default([]) List<Nationality> nationality,
    @Default([]) List<BookingStatus> bookingStatus,
    @Default([]) List<BookingStatus> flyingClass,
    @Default([]) List<BookingStatus> passengerType,
    @Default([]) List<BookingStatus> serviceType,
    @Default([]) List<Salutation> salutation,
    @Default([]) List<State> state,
    @Default([]) List<TravelSector> travelSector,
  }) = _Fields;

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class BookingStatus with _$BookingStatus {
  const factory BookingStatus({
    @Default('') @JsonKey(name: 'label') String label,
    @Default('') @JsonKey(name: 'order') String order,
    @Default('') @JsonKey(name: 'id') String id,
  }) = _BookingStatus;

  factory BookingStatus.fromJson(Map<String, dynamic> json) =>
      _$BookingStatusFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Country with _$Country {
  const factory Country({
    @Default('') @JsonKey(name: 'countryName') String countryName,
    @Default('') @JsonKey(name: 'dialCode') String dialCode,
    @Default('') @JsonKey(name: 'isO3') String isO3,
    @Default('') @JsonKey(name: 'isO2') String isO2,
    @Default('') @JsonKey(name: 'currencyName') String currencyName,
    @Default('') @JsonKey(name: 'currencyCode') String currencyCode,
    @Default('') @JsonKey(name: 'untermEnglish') String untermEnglish,
    @Default('') @JsonKey(name: 'regionName') String regionName,
    @Default('') @JsonKey(name: 'capital') String capital,
    @Default('') @JsonKey(name: 'continent') String continent,
    @Default('') @JsonKey(name: 'tld') String tld,
    @Default('') @JsonKey(name: 'languages') String languages,
    @Default(false) @JsonKey(name: 'isDeleted') bool isDeleted,
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'countryFlagImage') String countryFlagImage,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Nationality with _$Nationality {
  const factory Nationality({
    @Default('') @JsonKey(name: 'countryName') String countryName,
    @Default('') @JsonKey(name: 'nationality') String nationality,
    @Default('') @JsonKey(name: 'countryFlagImage') String countryFlagImage,
  }) = _Nationality;

  factory Nationality.fromJson(Map<String, dynamic> json) =>
      _$NationalityFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Salutation with _$Salutation {
  const factory Salutation({
    @Default('') @JsonKey(name: 'label') String label,
    @Default('') @JsonKey(name: 'order') String order,
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'is_Adult') String isAdult,
    @Default('') @JsonKey(name: 'is_Child') String isChild,
    @Default('') @JsonKey(name: 'is_Infant') String isInfant,
  }) = _Salutation;

  factory Salutation.fromJson(Map<String, dynamic> json) =>
      _$SalutationFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class State with _$State {
  const factory State({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'import') String stateImport,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'country_Master') String countryMaster,
    @Default('') @JsonKey(name: 'country_Code') String countryCode,
    @Default('') @JsonKey(name: 'state_Code') String stateCode,
    @Default('') @JsonKey(name: 'updated_State_Code') String tinCode,
    @Default('') @JsonKey(name: 'latitude') String latitude,
    @Default('') @JsonKey(name: 'longitude') String longitude,
  }) = _State;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class TravelSector with _$TravelSector {
  const factory TravelSector({
    @Default('') @JsonKey(name: 'label') String label,
    @Default('') @JsonKey(name: 'order') String order,
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'is_Transit') String isTransit,
  }) = _TravelSector;

  factory TravelSector.fromJson(Map<String, dynamic> json) =>
      _$TravelSectorFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Params with _$Params {
  const factory Params() = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
