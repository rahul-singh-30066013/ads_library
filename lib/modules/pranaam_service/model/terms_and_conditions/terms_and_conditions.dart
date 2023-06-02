/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// To parse this JSON data, do
//
//     final termsAndConditions = termsAndConditionsFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_and_conditions.freezed.dart';
part 'terms_and_conditions.g.dart';

TermsAndConditions termsAndConditionsFromJson(String str) =>
    TermsAndConditions.fromJson(json.decode(str));

String termsAndConditionsToJson(TermsAndConditions data) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class TermsAndConditions with _$TermsAndConditions {
  const factory TermsAndConditions({
    @Default('') dynamic name,
    @Default('') String path,
    @Default([]) List<Element> elements,
  }) = _TermsAndConditions;

  factory TermsAndConditions.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionsFromJson(json);
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
    @Default([]) List<ContentItem> contentItems,
  }) = _Fields;

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ContentItem with _$ContentItem {
  const factory ContentItem({
    @Default('') String name,
    @Default('') String title,
    @Default('') String richText,
  }) = _ContentItem;

  factory ContentItem.fromJson(Map<String, dynamic> json) =>
      _$ContentItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Params with _$Params {
  const factory Params() = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
