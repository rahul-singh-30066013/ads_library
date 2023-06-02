// To parse this JSON data, do
//
//     final packageDetailResponse = packageDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_detail_response.freezed.dart';
part 'package_detail_response.g.dart';

PackageDetailResponse packageDetailResponseFromJson(String str) =>
    PackageDetailResponse.fromJson(json.decode(str));

String packageDetailResponseToJson(PackageDetailResponse data) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
abstract class PackageDetailResponse with _$PackageDetailResponse {
  const factory PackageDetailResponse({
    @JsonKey(name: 'standAloneProducts')
    @Default([])
        List<StandAloneProduct> standAloneProducts,
  }) = _PackageDetailResponse;

  factory PackageDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class StandAloneProduct with _$StandAloneProduct {
  const factory StandAloneProduct({
    int? id,
    String? name,
    int? travelSectorId,
    int? serviceTypeId,
    int? airportMasterId,
    String? description,
    @JsonKey(name: 'pricingInfo')
    @Default(PricingInfo())
        PricingInfo pricingInfo,
    int? count,
    String? imageUrl,
  }) = _StandAloneProduct;

  factory StandAloneProduct.fromJson(Map<String, dynamic> json) =>
      _$StandAloneProductFromJson(json);
}
