// To parse this JSON data, do
//
//     final packageDetailRequest = packageDetailRequestFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_detail_request.freezed.dart';
part 'package_detail_request.g.dart';

PackageDetailRequest packageDetailRequestFromJson(String str) =>
    PackageDetailRequest.fromJson(json.decode(str));

String packageDetailRequestToJson(PackageDetailRequest data) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
abstract class PackageDetailRequest with _$PackageDetailRequest {
  const factory PackageDetailRequest({
    required int travelSectorId,
    required int serviceTypeId,
    required String serviceAirport,
    required int standaloneProductType,
    required int itemCount,
  }) = _PackageDetailRequest;

  factory PackageDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailRequestFromJson(json);
}
