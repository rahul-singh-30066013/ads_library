/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/air_itinerary_pricing_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/origin_destination_option.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_departure_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/site_core/model/airline/airline_info.dart';

class FlightsDisplayModel {
  final FlightInfo flightDisplayInfo;
  final FlightFilterInfo flightFilterInfo;
  final PricedItinerary pricedItinerary;
  final FareDetailsInfo flightFareInfo;
  final int uniqueIndex;
  final FlightInfo? internationReturnDisplayInfo;
  final FlightFilterInfo? internationReturnFilterInfo;
  final List<FlightsDisplayModel> flightGroups;

  FlightsDisplayModel({
    required this.flightDisplayInfo,
    required this.flightFilterInfo,
    required this.pricedItinerary,
    required this.flightFareInfo,
    required this.uniqueIndex,
    required this.flightGroups,
    this.internationReturnDisplayInfo,
    this.internationReturnFilterInfo,
  });

  OriginDestinationOption get returnFlightDetail =>
      pricedItinerary.itinerary.originDestinationOption?.last ??
      OriginDestinationOption(directionInd: 'I');

  factory FlightsDisplayModel.fromPricedItinerary({
    required PricedItinerary itinerary,
    required int uniqueIndex,
    required Map<String, AirLineInfo?>? airlineInfo,
  }) {
    return FlightsDisplayModel(
      uniqueIndex: uniqueIndex,
      flightDisplayInfo: FlightInfo(
        airLineCode: itinerary.itinerary.firstFlightDetails.validatingCarrier,
        airLineIcon: airlineInfo?[
                    itinerary.itinerary.firstFlightDetails.validatingCarrier]
                ?.icon ??
            itinerary.itinerary.firstFlightDetails.validatingCarrier,
        airLineName: airlineInfo?[
                    itinerary.itinerary.firstFlightDetails.validatingCarrier]
                ?.name ??
            itinerary.itinerary.firstFlightDetails.validatingCarrier,
        flightArrivalTime:
            itinerary.itinerary.firstFlightDetails.flightArrivalTime,
        arrivalDate: itinerary.itinerary.firstFlightDetails.flightArrivalDate,
        flightDepartureTime:
            itinerary.itinerary.firstFlightDetails.flightDepartureTime,
        flightDuration: FlightUtils.durationToString(
          itinerary.itinerary.firstFlightDetails.flightDuration,
        ),
        numberOfStops: itinerary.itinerary.firstFlightDetails.stops,
        stops: FlightUtils.numberOFStops(
          itinerary.itinerary.firstFlightDetails.stops,
        ),
        price: itinerary.priceInfo.price,
        unitPrice: itinerary.priceInfo.unitPrice,
        seat: itinerary.itinerary.firstFlightDetails.getLowestSeatFlightSegment
            .seatAvailable,
        dayChange: itinerary
            .itinerary.firstFlightDetails.flightSegmentDetails.isDayChange,
        isMultiCarrier: itinerary.itinerary.firstFlightDetails.isMultiCarrier,
        journeyDays: FlightUtils.journeyDaysByDate(
          itinerary.itinerary.firstFlightDetails.flightArrivalDate,
          itinerary.itinerary.firstFlightDetails.flightDepartureDate,
        ),
        priceAndDuration:
            itinerary.itinerary.firstFlightDetails.flightDuration +
                itinerary.priceInfo.price,
        timePriceDuration: FlightUtils.timeSeparate(
              itinerary.itinerary.firstFlightDetails.flightDepartureTime,
            ) +
            itinerary.itinerary.firstFlightDetails.flightDuration +
            itinerary.priceInfo.price,
        departureCity:
            itinerary.itinerary.firstFlightDetails.flightDepartureCityCode,
        arrivalCity:
            itinerary.itinerary.firstFlightDetails.flightArrivalCityCode,
      ),
      flightFilterInfo: FlightFilterInfo(
        airLineCode: itinerary.itinerary.firstFlightDetails.validatingCarrier,
        departureTimeType: FilterDepartureModel.getTimeTypeBasedOnDeparture(
          itinerary.itinerary.firstFlightDetails.flightDepartureNumTime,
        ),
        stopType: FlightUtils.numberOFStopsForFilter(
          itinerary.itinerary.firstFlightDetails.stops,
        ),
        duration: itinerary.itinerary.firstFlightDetails.flightDuration,
        departureTime:
            itinerary.itinerary.firstFlightDetails.flightDepartureNumTime,
        arrivalTimeType: FilterDepartureModel.getTimeTypeBasedOnDeparture(
          itinerary.itinerary.firstFlightDetails.flightArrivalNumTime,
        ),
        airLineName: airlineInfo?[
                    itinerary.itinerary.firstFlightDetails.validatingCarrier]
                ?.name ??
            itinerary.itinerary.firstFlightDetails.validatingCarrier,
        unitPrice: itinerary.priceInfo.unitPrice,
      ),
      internationReturnDisplayInfo: itinerary.isInternationRoundTrip
          ? FlightInfo(
              airLineCode:
                  itinerary.itinerary.lastFlightDetails.validatingCarrier,
              airLineIcon: airlineInfo?[itinerary
                          .itinerary.lastFlightDetails.validatingCarrier]
                      ?.icon ??
                  itinerary.itinerary.lastFlightDetails.validatingCarrier,
              airLineName: airlineInfo?[itinerary
                          .itinerary.lastFlightDetails.validatingCarrier]
                      ?.name ??
                  itinerary.itinerary.lastFlightDetails.validatingCarrier,
              flightArrivalTime:
                  itinerary.itinerary.lastFlightDetails.flightArrivalTime,
              arrivalDate:
                  itinerary.itinerary.lastFlightDetails.flightArrivalDate,
              flightDepartureTime:
                  itinerary.itinerary.lastFlightDetails.flightDepartureTime,
              flightDuration: FlightUtils.durationToString(
                itinerary.itinerary.lastFlightDetails.flightDuration,
              ),
              numberOfStops: itinerary.itinerary.lastFlightDetails.stops,
              stops: FlightUtils.numberOFStops(
                itinerary.itinerary.lastFlightDetails.stops,
              ),
              price: itinerary.priceInfo.price,
              unitPrice: itinerary.priceInfo.unitPrice,
              seat: itinerary.itinerary.lastFlightDetails
                  .getLowestSeatFlightSegment.seatAvailable,
              dayChange: itinerary
                  .itinerary.lastFlightDetails.flightSegmentDetails.isDayChange,
              isMultiCarrier:
                  itinerary.itinerary.lastFlightDetails.isMultiCarrier,
              journeyDays: FlightUtils.journeyDaysByDate(
                itinerary.itinerary.lastFlightDetails.flightArrivalDate,
                itinerary.itinerary.lastFlightDetails.flightDepartureDate,
              ),
              priceAndDuration:
                  itinerary.itinerary.firstFlightDetails.flightDuration +
                      itinerary.priceInfo.price,
              timePriceDuration: FlightUtils.timeSeparate(
                    itinerary.itinerary.firstFlightDetails.flightDepartureTime,
                  ) +
                  itinerary.itinerary.firstFlightDetails.flightDuration +
                  itinerary.priceInfo.price,
              departureCity: itinerary
                  .itinerary.firstFlightDetails.flightDepartureCityCode,
              arrivalCity:
                  itinerary.itinerary.firstFlightDetails.flightArrivalCityCode,
            )
          : null,
      internationReturnFilterInfo: itinerary.isInternationRoundTrip
          ? FlightFilterInfo(
              airLineCode:
                  itinerary.itinerary.lastFlightDetails.validatingCarrier,
              departureTimeType:
                  FilterDepartureModel.getTimeTypeBasedOnDeparture(
                itinerary.itinerary.lastFlightDetails.flightDepartureNumTime,
              ),
              stopType: FlightUtils.numberOFStopsForFilter(
                itinerary.itinerary.lastFlightDetails.stops,
              ),
              duration: itinerary.itinerary.lastFlightDetails.flightDuration,
              departureTime:
                  itinerary.itinerary.lastFlightDetails.flightDepartureNumTime,
              arrivalTimeType: FilterDepartureModel.getTimeTypeBasedOnDeparture(
                itinerary.itinerary.lastFlightDetails.flightArrivalNumTime,
              ),
              airLineName: airlineInfo?[itinerary
                          .itinerary.lastFlightDetails.validatingCarrier]
                      ?.name ??
                  itinerary.itinerary.lastFlightDetails.validatingCarrier,
              unitPrice: itinerary.priceInfo.unitPrice,
            )
          : null,
      pricedItinerary: itinerary,
      flightFareInfo: FareDetailsInfo(
        departureCity: itinerary
                .airItinerary?.firstFlightDetails.flightDepartureCityCode ??
            '',
        arrivalCity:
            itinerary.airItinerary?.lastFlightDetails.flightArrivalCityCode ??
                '',
        airItineraryPricingInfo: itinerary.priceInfo,
      ),
      flightGroups: [],
    );
  }
}

//This class is made to show the flight information on the listing page
class FlightInfo {
  final String airLineIcon;
  final String airLineName;
  final String flightDepartureTime;
  final String flightArrivalTime;
  final String airLineCode;
  final String flightDuration;
  final int numberOfStops;
  final String stops;
  final int price;
  final int unitPrice;
  final bool dayChange;
  final int seat;
  final int isMultiCarrier;
  final int journeyDays;
  final int priceAndDuration;
  final int timePriceDuration;
  final String departureCity;
  final String arrivalCity;
  final String arrivalDate;

  FlightInfo({
    required this.airLineIcon,
    required this.airLineName,
    required this.flightDepartureTime,
    required this.flightArrivalTime,
    required this.airLineCode,
    required this.flightDuration,
    required this.numberOfStops,
    required this.stops,
    required this.price,
    required this.unitPrice,
    required this.dayChange,
    required this.seat,
    required this.isMultiCarrier,
    required this.journeyDays,
    required this.priceAndDuration,
    required this.timePriceDuration,
    required this.departureCity,
    required this.arrivalCity,
    required this.arrivalDate,
  });
}

//This class is made to set the filter value on parsing time
class FlightFilterInfo {
  final TimeType departureTimeType;
  final int duration;
  final int departureTime;
  final String stopType;
  final TimeType arrivalTimeType;
  final String airLineName;
  final String airLineCode;
  final int unitPrice;

  FlightFilterInfo copyWith(
    departureTimeType,
    duration,
    departureTime,
    stopType,
    arrivalTimeType,
    airLineName,
    airLineCode,
    unitPrice,
  ) {
    return FlightFilterInfo(
      departureTimeType: departureTimeType,
      duration: duration,
      departureTime: departureTime,
      stopType: stopType,
      airLineName: airLineName,
      arrivalTimeType: arrivalTimeType,
      airLineCode: airLineCode,
      unitPrice: unitPrice,
    );
  }

  FlightFilterInfo({
    required this.departureTimeType,
    required this.duration,
    required this.departureTime,
    required this.stopType,
    required this.airLineName,
    required this.arrivalTimeType,
    required this.airLineCode,
    required this.unitPrice,
  });
}

class FareDetailsInfo {
  final String departureCity;
  final String arrivalCity;
  final AirItineraryPricingInfo airItineraryPricingInfo;

  FareDetailsInfo({
    required this.departureCity,
    required this.arrivalCity,
    required this.airItineraryPricingInfo,
  });
}

///This class is used to keep the price to show on the bottom view on SRP Page.
class SelectedFlightPrice {
  double totalFare;
  double totalDisplayFare;

  SelectedFlightPrice({
    required this.totalFare,
    required this.totalDisplayFare,
  });
}

class InterNationalInboundFlights {
  FlightsDisplayModel flightsDisplayModel;
  bool isEnabled;

  InterNationalInboundFlights({
    required this.flightsDisplayModel,
    required this.isEnabled,
  });
}
