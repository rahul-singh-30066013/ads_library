/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_flight_model.freezed.dart';
part 'saved_flight_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SavedFlightModel with _$SavedFlightModel {
  const factory SavedFlightModel({
    @Default(0) int totalRecords,
    @Default(0) int totalPages,
    @Default(0) int pageSize,
    @Default(0) int promoId,
    @Default([]) List<SavedFlightListData> flights,
  }) = _SavedFlightModel;
  factory SavedFlightModel.fromJson(Map<String, dynamic> json) =>
      _$SavedFlightModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class SavedFlightListData with _$SavedFlightListData {
  const factory SavedFlightListData({
    @Default('') String cardId,
    @Default('') String airlineCode,
    @Default('') String flightNo,
    @Default('') String flightName,
    @Default('') String scheduledDate,
    @Default('') String scheduledTime,
    @Default('') String upcomingDate,
    Origin? origin,
    Destination? destination,
    @Default('') String terminal,
    @Default('') String status,
    @Default('') String remarkes,
    @Default('') String type,
    @Default('') String baggageBelt,
    @Default('') String mobileNo,
    @Default(false) bool? isSelected,
  }) = _SavedFlightListData;

  factory SavedFlightListData.fromJson(Map<String, dynamic> json) =>
      _$SavedFlightListDataFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Origin with _$Origin {
  const factory Origin({
    @Default('') String name,
    @Default('') String code,
  }) = _Origin;
  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Destination with _$Destination {
  const factory Destination({
    @Default('') String name,
    @Default('') String code,
  }) = _Destination;
  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);
}
