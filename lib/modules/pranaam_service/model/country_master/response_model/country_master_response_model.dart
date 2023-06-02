/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/country_master/response_model/country_masters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_master_response_model.freezed.dart';
part 'country_master_response_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CountryMasterResponseModel with _$CountryMasterResponseModel {
  const factory CountryMasterResponseModel({
    @Default([])
    @JsonKey(name: 'countryMasters')
        List<CountryMasters> countryMasters,
  }) = _CountryMasterResponseModel;

  factory CountryMasterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CountryMasterResponseModelFromJson(json);
}
