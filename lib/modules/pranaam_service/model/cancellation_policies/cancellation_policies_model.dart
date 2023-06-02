/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// To parse this JSON data, do
//
//     final cancellationPoliciesModel = cancellationPoliciesModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancellation_policies_model.freezed.dart';
part 'cancellation_policies_model.g.dart';

CancellationPoliciesModel cancellationPoliciesModelFromJson(String str) =>
    CancellationPoliciesModel.fromJson(json.decode(str));

String cancellationPoliciesModelToJson(CancellationPoliciesModel data) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class CancellationPoliciesModel with _$CancellationPoliciesModel {
  const factory CancellationPoliciesModel({
    @JsonKey(name: 'name') @Default('') dynamic name,
    @JsonKey(name: 'path') @Default('') String path,
    @JsonKey(name: 'elements') @Default([]) List<Element> elements,
  }) = _CancellationPoliciesModel;

  factory CancellationPoliciesModel.fromJson(Map<String, dynamic> json) =>
      _$CancellationPoliciesModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Element with _$Element {
  const factory Element({
    @JsonKey(name: 'uid') @Default('') String uid,
    @JsonKey(name: 'componentName') @Default('') String componentName,
    @JsonKey(name: 'dataSource') @Default('') String dataSource,
    @JsonKey(name: 'params') @Default(Params()) Params params,
    @JsonKey(name: 'fields') @Default(Fields()) Fields fields,
  }) = _Element;

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Fields with _$Fields {
  const factory Fields({
    @JsonKey(name: 'header') @Default([]) List<Header> header,
    @JsonKey(name: 'rows') @Default([]) List<Row> rows,
  }) = _Fields;

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Header with _$Header {
  const factory Header({
    @JsonKey(name: 'title') @Default('') String title,
    @JsonKey(name: 'value') @Default('') String value,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Row with _$Row {
  const factory Row({
    @JsonKey(name: 'srNo') @Default('') String srNo,
    @JsonKey(name: 'services') @Default('') String services,
    @JsonKey(name: 'charges') @Default('') String charges,
  }) = _Row;

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Params with _$Params {
  const factory Params() = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
