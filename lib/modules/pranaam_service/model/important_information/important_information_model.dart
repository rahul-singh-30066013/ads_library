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

part 'important_information_model.freezed.dart';
part 'important_information_model.g.dart';

ImportantInformationModel importantInformationModelFromJson(String str) =>
    ImportantInformationModel.fromJson(json.decode(str));

String importantInformationModelToJson(ImportantInformationModel data) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class ImportantInformationModel with _$ImportantInformationModel {
  const factory ImportantInformationModel({
    @JsonKey(name: 'name') @Default('') dynamic name,
    @JsonKey(name: 'path') @Default('') String path,
    @JsonKey(name: 'elements') @Default([]) List<Element> elements,
  }) = _ImportantInformationModel;

  factory ImportantInformationModel.fromJson(Map<String, dynamic> json) =>
      _$ImportantInformationModelFromJson(json);
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
    @Default([]) List<ContentList> contentList,
  }) = _Fields;
  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ContentList with _$ContentList {
  const factory ContentList({
    @Default('') String title,
    @Default([]) List<Lines> lines,
  }) = _ContentList;
  factory ContentList.fromJson(Map<String, dynamic> json) =>
      _$ContentListFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Lines with _$Lines {
  const factory Lines({
    @Default('') String line,
    @Default([]) List<Links> links,
  }) = _Lines;
  factory Lines.fromJson(Map<String, dynamic> json) => _$LinesFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Links with _$Links {
  const factory Links({
    @Default('') String link,
    @Default('') String linkText,
    @Default('') String linkURL,
  }) = _Links;
  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Params with _$Params {
  const factory Params() = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
