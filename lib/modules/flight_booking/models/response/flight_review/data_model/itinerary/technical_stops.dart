/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used for flight segment-itinerary

class TechnicalStops {
  TechnicalStops({
    this.stopDetail,
    required this.noOfStops,
  });

  final List<StopsDetail>? stopDetail;
  final int noOfStops;

  TechnicalStops copyWith({
    List<StopsDetail>? stopDetail,
    required int noOfStops,
  }) =>
      TechnicalStops(
        stopDetail: stopDetail ?? this.stopDetail,
        noOfStops: noOfStops,
      );

  factory TechnicalStops.fromJson(Map<String, dynamic> json) => TechnicalStops(
        stopDetail: json['stopDetail'] == null
            ? null
            : List<StopsDetail>.from(
                (json['stopDetail'] as List).map(
                  (x) => StopsDetail.fromJson(x),
                ),
              ),
        noOfStops: json['noOfStops'] ?? 0,
      );
}

class StopsDetail {
  StopsDetail({
    this.name,
    required this.duration,
    required this.layoverType,
  });

  final String? name;
  final int duration;
  final String layoverType;

  StopsDetail copyWith({
    String? name,
    required int duration,
    required String layoverType,
  }) =>
      StopsDetail(
        name: name ?? this.name,
        duration: duration,
        layoverType: layoverType,
      );

  factory StopsDetail.fromJson(Map<String, dynamic> json) => StopsDetail(
        name: json['name'],
        duration: json['duration'] ?? 0,
        layoverType: json['layoverType'] ?? '-1',
      );
}
