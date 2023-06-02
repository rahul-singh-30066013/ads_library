/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';

/// This class contain the number of passengers, passenger type and travel class type.
class Travellers {
  ///*[adults] used to show the number of adult passengers.
  int adults;

  ///*[children] used to show the number of children passengers.
  int children;

  ///*[infants] used to show the number of infants passengers.
  int infants;

  ///*[travelClass] used to show the class of passengers.
  TravelClass? travelClass;

  Travellers({
    this.adults = 1,
    this.children = 0,
    this.infants = 0,
    this.travelClass = TravelClass.economy,
  });

  int get totalSeatTravellers => adults + children;
  int get totalTravellers => adults + children + infants;

  ///This function is to pass the selected class value in API.
  String travelClassAPIValue() {
    switch (travelClass ?? TravelClass.economy) {
      case TravelClass.economy:
        return 'Economy';
      case TravelClass.premiumEconomy:
        return 'Premium Economy';
      case TravelClass.business:
        return 'Business';
      case TravelClass.first:
        return 'First';
    }
  }

  ///This function is to return the selected class localized key to UI.
  String travelClassToDisplay() {
    switch (travelClass ?? TravelClass.economy) {
      case TravelClass.economy:
        return 'economy';
      case TravelClass.premiumEconomy:
        return 'premiumEconomy';
      case TravelClass.business:
        return 'business';
      case TravelClass.first:
        return 'first';
    }
  }

  @override
  String toString() {
    return 'Travellers{adults: $adults, children: $children, infants: $infants,'
        ' travellClass: ${travelClass.toString().split('.').last}, travelClass: $travelClass}';
  }

  factory Travellers.fromJson(Map<String, dynamic> json) {
    final String travel = json['travelClass'];
    return Travellers(
      adults: json['adults'],
      children: json['children'],
      infants: json['infants'],
      travelClass: TravelClass.values.byName(travel),
    );
  }
  Map<String, dynamic> toJson() => {
        'adults': adults,
        'children': children,
        'infants': infants,
        'travelClass': travelClass?.name,
      };
}
