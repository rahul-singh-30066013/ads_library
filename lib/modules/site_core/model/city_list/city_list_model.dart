/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// To parse this JSON data, do
//
//     final cityListModel = cityListModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_list_model.freezed.dart';
part 'city_list_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CityListModel with _$CityListModel {
  const factory CityListModel({
    @Default('') dynamic name,
    @Default('') String path,
    @Default([]) List<Element> elements,
  }) = _CityListModel;

  factory CityListModel.fromJson(Map<String, dynamic> json) =>
      _$CityListModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Element with _$Element {
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
class Fields with _$Fields {
  const factory Fields({
    @Default([]) List<Result> results,
  }) = _Fields;

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Result with _$Result {
  const factory Result({
    @Default('') String stateMasterId,
    @Default('') String stateImportId,
    @Default('') String id,
    @Default('') String resultImport,
    @Default('') String name,
    @Default('') String countryMaster,
    @Default('') String countryCode,
    @Default('') String stateCode,
    @Default('') String latitude,
    @Default('') String longitude,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Params with _$Params {
  const factory Params() = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
