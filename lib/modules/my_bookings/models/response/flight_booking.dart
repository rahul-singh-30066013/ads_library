/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/arrival_departure.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/source_destination.dart';
import 'package:flutter/foundation.dart';

@immutable
class FlightBooking {
  const FlightBooking({
    this.tripType,
    this.from,
    this.to,
    this.departure,
    this.arrival,
    this.imageUrl,
    this.refundStatus,
  });

  final ItineraryTripType? tripType;
  final SourceDestination? from;
  final SourceDestination? to;
  final ArrivalDeparture? departure;
  final ArrivalDeparture? arrival;
  final String? imageUrl;
  final String? refundStatus;

  @override
  String toString() {
    return 'FlightBooking(tripType: $tripType, from: $from, to: $to, departure: $departure, arrival: $arrival, imageUrl: $imageUrl, refundStatus: $refundStatus)';
  }

  factory FlightBooking.fromJson(Map<String, dynamic> json) => FlightBooking(
    tripType: ItineraryTripType.values.byName(json['tripType'] ?? 'O'),
        from: json['from'] == null
            ? null
            : SourceDestination.fromJson(json['from'] as Map<String, dynamic>),
        to: json['to'] == null
            ? null
            : SourceDestination.fromJson(json['to'] as Map<String, dynamic>),
        departure: json['departure'] == null
            ? null
            : ArrivalDeparture.fromJson(
                json['departure'] as Map<String, dynamic>,
              ),
        arrival: json['arrival'] == null
            ? null
            : ArrivalDeparture.fromJson(
                json['arrival'] as Map<String, dynamic>,
              ),
        imageUrl: json['imageUrl'] as String?,
        refundStatus: json['refundStatus'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tripType': tripType,
        'from': from?.toJson(),
        'to': to?.toJson(),
        'departure': departure?.toJson(),
        'arrival': arrival?.toJson(),
        'imageUrl': imageUrl,
        'refundStatus': refundStatus,
      };

  FlightBooking copyWith({
    ItineraryTripType? tripType,
    SourceDestination? from,
    SourceDestination? to,
    ArrivalDeparture? departure,
    ArrivalDeparture? arrival,
    String? imageUrl,
    String? refundStatus,
  }) {
    return FlightBooking(
      tripType: tripType ?? this.tripType,
      from: from ?? this.from,
      to: to ?? this.to,
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
      imageUrl: imageUrl ?? this.imageUrl,
      refundStatus: refundStatus ?? this.refundStatus,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    return other is FlightBooking &&
        other.tripType == tripType &&
        other.from == from &&
        other.to == to &&
        other.departure == departure &&
        other.arrival == arrival &&
        other.imageUrl == imageUrl &&
        other.refundStatus == refundStatus;
  }

  @override
  int get hashCode =>
      tripType.hashCode ^
      from.hashCode ^
      to.hashCode ^
      departure.hashCode ^
      arrival.hashCode ^
      imageUrl.hashCode ^
      refundStatus.hashCode;
}
