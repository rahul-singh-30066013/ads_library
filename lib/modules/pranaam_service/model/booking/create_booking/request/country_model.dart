/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

///
///
///supporting model for creating request json for Create booking api.
///this models have following parameters
/// countryCode data type Integer default value is 0,
/// countryName data type String default value is 'India',
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class CountryModel with _$CountryModel {
  @JsonSerializable(explicitToJson: true)
  const factory CountryModel({
    @Default(0) @JsonKey(name: 'code') int countryCode,
    @Default('') @JsonKey(name: 'countryName') String countryName,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
