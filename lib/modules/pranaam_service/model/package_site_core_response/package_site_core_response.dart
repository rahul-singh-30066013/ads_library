/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_site_core_response.freezed.dart';
part 'package_site_core_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PackageSiteCoreResponse with _$PackageSiteCoreResponse {
  const factory PackageSiteCoreResponse({
    @Default('') String name,
    @Default('') String path,
    @Default([]) List<Element> elements,
  }) = _PackageSiteCoreResponse;

  factory PackageSiteCoreResponse.fromJson(Map<String, dynamic> json) =>
      _$PackageSiteCoreResponseFromJson(json);
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
    @Default([]) List<PackageData> data,
  }) = _Fields;

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PackageData with _$PackageData {
  const factory PackageData({
    @Default('') String packageId,
    @Default('') String packageName,
    @Default(false) bool isRecommended,
    @Default([]) List<ServicesList> servicesList,
  }) = _PackageData;

  factory PackageData.fromJson(Map<String, dynamic> json) =>
      _$PackageDataFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ServicesList with _$ServicesList {
  const factory ServicesList({
    @Default('') String name,
    @Default(false) bool value,
  }) = _ServicesList;

  factory ServicesList.fromJson(Map<String, dynamic> json) =>
      _$ServicesListFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Params with _$Params {
  const factory Params({
    @Default('') String rewardsText,
  }) = _Params;
  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
