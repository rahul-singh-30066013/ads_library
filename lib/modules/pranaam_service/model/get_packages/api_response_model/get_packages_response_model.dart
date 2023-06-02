/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_packages_response_model.freezed.dart';
part 'get_packages_response_model.g.dart';

/// Class is used to parse JSON responses comes from GET PACKAGES API
@Freezed(makeCollectionsUnmodifiable: false)
class GetPackagesResponseModel with _$GetPackagesResponseModel {
  const factory GetPackagesResponseModel({
    @JsonKey(name: 'data') @Default(Data()) Data data,
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default(Error()) @JsonKey(name: 'warning') Error warning,
    @Default(Error()) @JsonKey(name: 'error') Error error,
  }) = _GetPackagesResponseModel;

  factory GetPackagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetPackagesResponseModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'packageDetails')
    @Default([])
        List<PackageDetail> packageDetails,
    @JsonKey(name: 'loyaltyPercentage') @Default('') String loyaltyPercentage,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Error with _$Error {
  const factory Error({
    @JsonKey(name: 'statusCode') @Default(0) int statusCode,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'source') @Default('') String source,
  }) = _Error;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}
