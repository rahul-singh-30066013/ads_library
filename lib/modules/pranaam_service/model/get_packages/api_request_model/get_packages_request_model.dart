/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_packages_request_model.freezed.dart';
part 'get_packages_request_model.g.dart';

/// This class is used to create package model for GetPackages API request body.
/// As by default child count and infant count is 0, if user doesn't
/// select any of these options in travellers list.
@Freezed(makeCollectionsUnmodifiable: false)
class GetPackagesRequestModel with _$GetPackagesRequestModel {
  const factory GetPackagesRequestModel({
    required String serviceTypeId,
    required String serviceType,
    required String travelSector,
    required String serviceDate,
    required String serviceTime,
    required String originAirport,
    required String destinationAirport,
    @JsonKey(name: 'oldBookingId') @Default(0) int oldBookingId,
    @JsonKey(name: 'OldBookingReferenceId')
    @Default('')
        String oldBookingReferenceId,
    @JsonKey(name: 'IsOrderDetailsToBeFetchedFromService')
    @Default(true)
        bool isOrderDetailsToBeFetchedFromService,
    required int adultCount,
    @Default(0) int childCount,
    @Default(0) int infantCount,
    @JsonKey(name: 'ServiceAirportId')
    @Default(0) int? serviceAirportId,
    @JsonKey(name: 'RoundTransitServiceTime')
    String? roundTransitServiceTime,
    @JsonKey(name: 'RoundTransitServiceDate')
    String? roundTransitServiceDate,
  }) = _GetPackagesRequestModel;

  factory GetPackagesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetPackagesRequestModelFromJson(json);
}
