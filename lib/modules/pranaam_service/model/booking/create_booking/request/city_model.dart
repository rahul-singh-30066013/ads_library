/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

///
///
///supporting model for creating request json for Create booking api.
///this models have following parameters
/// cityId data type Integer default value is 0,
/// cityName data type String default value is 'Delhi',
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class CityModel with _$CityModel {
  @JsonSerializable(explicitToJson: true)
  const factory CityModel({
    @Default(0) @JsonKey(name: 'cityID') int cityId,
    @Default('') @JsonKey(name: 'cityName') String cityName,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
