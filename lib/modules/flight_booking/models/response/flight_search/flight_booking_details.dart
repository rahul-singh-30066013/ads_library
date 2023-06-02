/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

/// this class is used to retrieve/ manipulate data from api/local_db.
/// it will return data to repository class.
///
class FlightBookingDetails {
  static final FlightBookingDetails _flightBookingDetails =
      FlightBookingDetails();

  static FlightBookingDetails getInstance() {
    return _flightBookingDetails;
  }

  ///TODO: as of now this is returning the static data. later on will retrieve data from local db.
  FlightBookingModel getData() {
    return FlightBookingModel(
      tripType: TripType.oneWay,
      oneWayTrip: TripDetailModel(
        fromCity: const CityDetailModel(
          countryName: 'India',
          countryCode: 'IN',
          cityCode: 'DEL',
          airportName: 'Indira Gandhi International Airport',
          cityName: 'New Delhi',
          isDomestic: true,
          airportID: '31',
          keywords: [],
          cityPlaceholder: 'to',
          airportCode: 'DEL',
        ),
        toCity: const CityDetailModel(
          countryName: 'India',
          countryCode: 'IN',
          cityCode: 'BOM',
          airportName: 'Chhatrapati Shivaji Maharaj International Airport ',
          isDomestic: true,
          airportID: '17',
          cityName: 'Mumbai',
          keywords: [],
          cityPlaceholder: 'from',
          airportCode: 'BOM',
        ),
        date: FlightUtils.nextValidDate(sameDate: DateTime.now()),
      ),
      roundTrip: TripDetailModel(
        fromCity: const CityDetailModel(
          countryName: 'India',
          countryCode: 'IN',
          cityCode: 'DEL',
          airportName: 'Indira Gandhi International Airport',
          cityName: 'New Delhi',
          isDomestic: true,
          airportID: '31',
          keywords: [],
          cityPlaceholder: 'from',
          airportCode: 'DEL',
        ),
        toCity: const CityDetailModel(
          countryName: 'India',
          countryCode: 'IN',
          cityCode: 'BOM',
          airportName: 'Chhatrapati Shivaji Maharaj International Airport ',
          isDomestic: true,
          airportID: '17',
          cityName: 'Mumbai',
          keywords: [],
          cityPlaceholder: 'to',
          airportCode: 'BOM',
        ),
        date: FlightUtils.nextValidDate(sameDate: DateTime.now()),
      ),
      travellers: Travellers(),
    );
  }

  FlightBookingModel getDeepLinkData(
    FlightBookingDeepLinkModel? flightBookingDeepLinkModel,
    List<CityDetailModel> mainAirportCityList,
  ) {
    final departureDate =
        flightBookingDeepLinkModel?.departureDate?.isNotEmpty ?? false
            ? DateFormat(Constant.dateFormat5)
                .parse(flightBookingDeepLinkModel?.departureDate ?? '')
            : FlightUtils.nextValidDate(sameDate: DateTime.now());

    final arrivalDate = flightBookingDeepLinkModel?.tripType == 'R'
        ? flightBookingDeepLinkModel?.arrivalDate?.isNotEmpty ?? false
            ? DateFormat(Constant.dateFormat5)
                .parse(flightBookingDeepLinkModel?.arrivalDate ?? '')
            : departureDate
        : departureDate;

    final fromCityModel = mainAirportCityList.firstWhere(
      (element) =>
          element.cityCode == (flightBookingDeepLinkModel?.fromCity ?? 'DEL'),
    );
    final toCityModel = mainAirportCityList.firstWhere(
      (element) =>
          element.cityCode == (flightBookingDeepLinkModel?.toCity ?? 'BOM'),
    );

    return FlightBookingModel(
      tripType: flightBookingDeepLinkModel?.tripType == 'O'
          ? TripType.oneWay
          : TripType.roundTrip,
      oneWayTrip: TripDetailModel(
        fromCity: CityDetailModel(
          countryName: fromCityModel.countryName,
          countryCode: fromCityModel.countryCode,
          cityCode: fromCityModel.cityCode,
          airportName: fromCityModel.airportName,
          cityName: fromCityModel.cityName,
          isDomestic: fromCityModel.isDomestic,
          airportID: fromCityModel.airportID,
          keywords: const [],
          cityPlaceholder: 'to',
          airportCode: fromCityModel.cityCode,
        ),
        toCity: CityDetailModel(
          countryName: toCityModel.countryName,
          countryCode: toCityModel.countryCode,
          cityCode: toCityModel.cityCode,
          airportName: toCityModel.airportName,
          isDomestic: toCityModel.isDomestic,
          airportID: toCityModel.airportID,
          cityName: toCityModel.cityName,
          keywords: const [],
          cityPlaceholder: 'from',
          airportCode: toCityModel.cityCode,
        ),
        date: departureDate,
      ),
      roundTrip: TripDetailModel(
        fromCity: CityDetailModel(
          countryName: fromCityModel.countryName,
          countryCode: fromCityModel.countryCode,
          cityCode: fromCityModel.cityCode,
          airportName: fromCityModel.airportName,
          cityName: fromCityModel.cityName,
          isDomestic: fromCityModel.isDomestic,
          airportID: fromCityModel.airportID,
          keywords: const [],
          cityPlaceholder: 'to',
          airportCode: fromCityModel.cityCode,
        ),
        toCity: CityDetailModel(
          countryName: toCityModel.countryName,
          countryCode: toCityModel.countryCode,
          cityCode: toCityModel.cityCode,
          airportName: toCityModel.airportName,
          isDomestic: toCityModel.isDomestic,
          airportID: toCityModel.airportID,
          cityName: toCityModel.cityName,
          keywords: const [],
          cityPlaceholder: 'from',
          airportCode: toCityModel.cityCode,
        ),
        date: arrivalDate,
      ),
      travellers: Travellers(
        adults: int.parse(flightBookingDeepLinkModel?.adult ?? '1'),
        children: int.parse(flightBookingDeepLinkModel?.child ?? '0'),
        infants: int.parse(flightBookingDeepLinkModel?.infant ?? '0'),
      ),
    );
  }

  List<CityDetailModel> getPopularAndRecentCitiesList(
    BuildContext context,
  ) {
    final List<CityDetailModel> tempListOfCities = [
      CityDetailModel(
        cityCode: '-1',
        airportName: 'recent_search'.localize(context),
        cityName: '',
        keywords: const [],
      ),
      CityDetailModel(
        cityCode: '-2',
        airportName: 'popular_cities'.localize(context),
        cityName: '',
        keywords: const [],
      ),
    ];

    return tempListOfCities;
  }
}
