/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

///This class represents the model in which Flight data is received,It will be used for Service Booking.
///It contains following details of a flight
/// flightNumber : It is the unique field, Its data type is String.Its length is 6 ex: 6E 1234
/// arrivalTime : It is the arrival time of the flight, data type is String
/// arrivalDate : It is the arrival date of the flight, data type is String
/// departureTime : It is the departure time of the flight, data type is String
/// departureDate : It is the departure date of the flight, data type is String
/// serviceTime : It is the service time of the pranaam service staff for the flight, data type is String
///
class FlightDetailsModel {
  ///It is the unique field, Its data type is String.Its length is 6 ex: 6E 1234
  String flightNumber;

  ///It is the arrival time of the flight, data type is String
  String? arrivalTime;

  ///It is the arrival date of the flight, data type is String
  String? arrivalDate;

  ///It is the departure time of the flight, data type is String
  String? departureTime;

  ///It is the departure date of the flight, data type is String
  String? departureDate;

  ///It is the service time of the pranaam service staff for the flight, data type is String
  String? serviceTime;

  ///It is the icon for the flight, data type is String
  String? icon;

  FlightDetailsModel({
    required this.flightNumber,
    this.arrivalTime,
    this.arrivalDate,
    this.departureTime,
    this.departureDate,
    this.serviceTime,
    this.icon,
  });

  FlightDetailsModel copy() {
    return FlightDetailsModel(
      flightNumber: flightNumber,
      arrivalTime: arrivalTime,
      arrivalDate: arrivalDate,
      departureTime: departureTime,
      departureDate: departureDate,
      serviceTime: serviceTime,
      icon: icon,
    );
  }

  @override
  String toString() {
    return 'FlightDetailsModel{flightNumber: $flightNumber, arrivalTime: $arrivalTime, arrivalDate: $arrivalDate, departureTime: $departureTime, departureDate: $departureDate, serviceTime: $serviceTime}';
  }
}
