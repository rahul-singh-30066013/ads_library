/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_masters.freezed.dart';
part 'country_masters.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CountryMasters with _$CountryMasters {
  const factory CountryMasters({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String dialCode,
    @Default('') String isO3,
    @Default('') String isO2,
    @Default('') String currencyName,
    @Default('') String currencyCode,
    @Default('') String untermEnglishFormal,
    @Default('') String regionName,
    @Default('') String capital,
    @Default('') String continent,
    @Default('') String tld,
    @Default('') String languages,
    @Default(false) bool isDeleted,
  }) = _CountryMasters;

  factory CountryMasters.fromJson(Map<String, dynamic> json) =>
      _$CountryMastersFromJson(json);
}
