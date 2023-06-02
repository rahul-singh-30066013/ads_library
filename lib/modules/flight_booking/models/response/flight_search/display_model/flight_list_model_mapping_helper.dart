/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_isolate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_airline_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_arrival_nearby_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/airline/airline_info.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';

///Class is made to handle all the flight display and filter data mapping after parsing.
class FlightListModelMappingHelper {
  ///OutBound Flights means the first journey
  final List<FlightsDisplayModel> outBoundFlightListing = [];

  ///InBound Flights means returning flights in case of roundTrip
  final List<FlightsDisplayModel> inBoundFlightListing = [];

  /// OutBound Filter Airline List
  final List<AirlineFilter>? createOutBoundFilterOptions = [];

  /// InBound Filter Airline List
  final List<AirlineFilter>? createInBoundFilterOptions = [];

  ///Out Bound Arrival Nearby Airport
  final List<NearbyAirports>? outBoundInternationalCreateArrivalNearbyAirport =
      [];

  ///In Bound Arrival Nearby Airport
  final List<NearbyAirports>? inBoundInternationalCreateArrivalNearbyAirport =
      [];

  ///Out Bound departure Nearby Airport
  final List<NearbyAirports>?
      outBoundInternationalCreateDepartureNearbyAirport = [];

  ///In Bound departure Nearby Airport
  final List<NearbyAirports>? inBoundInternationalCreateDepartureNearbyAirport =
      [];

  ///in and Out Bound Flights in case of international
  final List<FlightsDisplayModel> internationalFlightListing = [];

  ///Out Bound Arrival Nearby Airport map
  Map<String, int> outBoundInternationalAirportArrivalMap = {};

  ///Out Bound Arrival Nearby Airport List - Internal Use to remove the duplicate entries
  final List<String> _outBoundInternationalAirportArrivalUniqueKeyMap = [];

  ///In Bound Arrival Nearby Airport map
  Map<String, int> inBoundInternationalAirportArrivalMap = {};

  ///In Bound Arrival Nearby Airport List - Internal Use to remove the duplicate entries
  final List<String> _inBoundInternationalAirportArrivalUniqueKeyMap = [];

  ///Out Bound departure Nearby Airport map
  Map<String, int> outBoundInternationalAirportDepartureMap = {};

  ///Out Bound departure Nearby Airport List - Internal Use to remove the duplicate entries
  final List<String> _outBoundInternationalAirportDepartureUniqueKeyMap = [];

  ///In Bound departure Nearby Airport map
  Map<String, int> inBoundInternationalAirportDepartureMap = {};

  ///In Bound departure Nearby Airport List - Internal Use to remove the duplicate entries
  final List<String> _inBoundInternationalAirportDepartureUniqueKeyMap = [];

  ///Map for grouping international flights based on price and airlines
  final Map<String, List<FlightsDisplayModel>> _internationalFlightListingMap =
      {};

  ///This method is used to group all the Outbound Arrival nearby airports to show in filters.
  void setOutBoundMapInternationalArrivalAirports(
    FlightsDisplayModel value,
    FlightListIsolateModel isolateModel,
  ) {
    final String key = value
            .pricedItinerary
            .airItinerary
            ?.originDestinationOption
            ?.first
            .flightSegment
            ?.last
            .arrivalAirport
            ?.locationCode ??
        '';
    final double price =
        value.pricedItinerary.airItineraryPricingInfo?.totalFare?.amount ?? 0;
    if (price > 0.0) {
      final uniqueKey =
          '${value.pricedItinerary.itinerary.firstFlightDetails.uniqueKey}${value.flightDisplayInfo.unitPrice}';
      if (outBoundInternationalAirportArrivalMap.containsKey(key)) {
        if (!_outBoundInternationalAirportArrivalUniqueKeyMap
            .contains(uniqueKey)) {
          outBoundInternationalAirportArrivalMap[key] =
              outBoundInternationalAirportArrivalMap[key]! + 1;
          _outBoundInternationalAirportArrivalUniqueKeyMap.add(uniqueKey);
        }
      } else {
        outBoundInternationalAirportArrivalMap[key] = 1;
        _outBoundInternationalAirportArrivalUniqueKeyMap.add(uniqueKey);

        final CityDetailModel? model =
            isolateModel.internationalAirportMap[key];

        final NearbyAirports info = NearbyAirports(
          airportCode: model?.airportCode ?? key,
          airportName: model?.airportName ?? key,
          isSelected: false,
          itemCode: '01',
          cityName: model?.cityName ?? key,
        );
        outBoundInternationalCreateArrivalNearbyAirport?.add(info);
      }
    }
  }

  ///This method is used to group all the Inbound Arrival nearby airports to show in filters.
  void setInBoundMapInternationalArrivalAirports(
    FlightsDisplayModel value,
    FlightListIsolateModel isolateModel,
  ) {
    if (value.pricedItinerary.isInternationRoundTrip) {
      final String key = value
              .pricedItinerary
              .airItinerary
              ?.originDestinationOption
              ?.last
              .flightSegment
              ?.last
              .arrivalAirport
              ?.locationCode ??
          '';
      final double price =
          value.pricedItinerary.airItineraryPricingInfo?.totalFare?.amount ?? 0;
      if (price > 0.0) {
        final uniqueKey =
            '${value.pricedItinerary.itinerary.lastFlightDetails.uniqueKey}${value.flightDisplayInfo.unitPrice}';
        if (inBoundInternationalAirportArrivalMap.containsKey(key)) {
          if (!_inBoundInternationalAirportArrivalUniqueKeyMap
              .contains(uniqueKey)) {
            inBoundInternationalAirportArrivalMap[key] =
                inBoundInternationalAirportArrivalMap[key]! + 1;
            _inBoundInternationalAirportArrivalUniqueKeyMap.add(uniqueKey);
          }
        } else {
          inBoundInternationalAirportArrivalMap[key] = 1;
          _inBoundInternationalAirportArrivalUniqueKeyMap.add(uniqueKey);

          final CityDetailModel? model =
              isolateModel.internationalAirportMap[key];

          final NearbyAirports info = NearbyAirports(
            airportCode: model?.airportCode ?? key,
            airportName: model?.airportName ?? key,
            isSelected: false,
            itemCode: '01',
            cityName: model?.cityName ?? key,
          );
          inBoundInternationalCreateArrivalNearbyAirport?.add(info);
        }
      }
    }
  }

  ///This method is used to group all the Outbound Departure nearby airports to show in filters.
  void setOutBoundMapInternationalDepartureAirports(
    FlightsDisplayModel value,
    FlightListIsolateModel isolateModel,
  ) {
    final String key = value
            .pricedItinerary
            .airItinerary
            ?.originDestinationOption
            ?.first
            .flightSegment
            ?.first
            .departureAirport
            ?.locationCode ??
        '';
    final double price =
        value.pricedItinerary.airItineraryPricingInfo?.totalFare?.amount ?? 0;
    if (price > 0.0) {
      final uniqueKey =
          '${value.pricedItinerary.itinerary.firstFlightDetails.uniqueKey}${value.flightDisplayInfo.unitPrice}';
      if (outBoundInternationalAirportDepartureMap.containsKey(key)) {
        if (!_outBoundInternationalAirportDepartureUniqueKeyMap
            .contains(uniqueKey)) {
          outBoundInternationalAirportDepartureMap[key] =
              outBoundInternationalAirportDepartureMap[key]! + 1;
          _outBoundInternationalAirportDepartureUniqueKeyMap.add(uniqueKey);
        }
      } else {
        outBoundInternationalAirportDepartureMap[key] = 1;
        _outBoundInternationalAirportDepartureUniqueKeyMap.add(uniqueKey);

        final CityDetailModel? model =
            isolateModel.internationalAirportMap[key];

        final NearbyAirports info = NearbyAirports(
          airportCode: model?.airportCode ?? key,
          airportName: model?.airportName ?? key,
          isSelected: false,
          itemCode: '01',
          cityName: model?.cityName ?? key,
        );
        outBoundInternationalCreateDepartureNearbyAirport?.add(info);
      }
    }
  }

  ///This method is used to group all the Inbound Departure nearby airports to show in filters.
  void setInBoundMapInternationalDepartureAirports(
    FlightsDisplayModel value,
    FlightListIsolateModel isolateModel,
  ) {
    if (value.pricedItinerary.isInternationRoundTrip) {
      final String key = value
              .pricedItinerary
              .airItinerary
              ?.originDestinationOption
              ?.last
              .flightSegment
              ?.first
              .departureAirport
              ?.locationCode ??
          '';
      final double price =
          value.pricedItinerary.airItineraryPricingInfo?.totalFare?.amount ?? 0;
      if (price > 0.0) {
        final uniqueKey =
            '${value.pricedItinerary.itinerary.lastFlightDetails.uniqueKey}${value.flightDisplayInfo.unitPrice}';
        if (inBoundInternationalAirportDepartureMap.containsKey(key)) {
          if (!_inBoundInternationalAirportDepartureUniqueKeyMap
              .contains(uniqueKey)) {
            inBoundInternationalAirportDepartureMap[key] =
                inBoundInternationalAirportDepartureMap[key]! + 1;
            _inBoundInternationalAirportDepartureUniqueKeyMap.add(uniqueKey);
          }
        } else {
          inBoundInternationalAirportDepartureMap[key] = 1;
          _inBoundInternationalAirportDepartureUniqueKeyMap.add(uniqueKey);

          final CityDetailModel? model =
              isolateModel.internationalAirportMap[key];

          final NearbyAirports info = NearbyAirports(
            airportCode: model?.airportCode ?? key,
            airportName: model?.airportName ?? key,
            isSelected: false,
            itemCode: '01',
            cityName: model?.cityName ?? key,
          );
          inBoundInternationalCreateDepartureNearbyAirport?.add(info);
        }
      }
    }
  }

  ///This method is used to group all the Outbound airlines to show in filters.
  void setOutboundAirlineFilter(
    FlightsDisplayModel value,
    FlightListIsolateModel isolateModel,
  ) {
    final airlineCode = value.flightDisplayInfo.airLineCode;
    if (isolateModel.departureFlightCountMap.containsKey(airlineCode)) {
      isolateModel.departureFlightCountMap[airlineCode] =
          isolateModel.departureFlightCountMap[airlineCode]! + 1;

      if (isolateModel.departureFlightCountMap[airlineCode]! == 1) {
        final AirLineInfo? info = isolateModel.airlineInfo?[airlineCode];

        final AirlineFilter departureAirline = AirlineFilter(
          airlineCode: info?.airlineCode ?? '',
          airlineName: info?.name ?? airlineCode,
          airlineLogo: info?.icon ?? '',
          isSelected: false,
          itemCode: '01',
        );

        createOutBoundFilterOptions?.add(departureAirline);
      }
    }
  }

  void setInBoundInternationalAirlineFilter(
    FlightsDisplayModel value,
    FlightListIsolateModel isolateModel,
  ) {
    if (value.pricedItinerary.isInternationRoundTrip) {
      final airlineCode = value.internationReturnDisplayInfo?.airLineCode ?? '';
      if (isolateModel.arrivalFlightCountMap.containsKey(airlineCode)) {
        isolateModel.arrivalFlightCountMap[airlineCode] =
            isolateModel.arrivalFlightCountMap[airlineCode]! + 1;

        if (isolateModel.arrivalFlightCountMap[airlineCode]! == 1) {
          final AirLineInfo? info = isolateModel.airlineInfo?[airlineCode];

          final AirlineFilter departureAirline = AirlineFilter(
            airlineCode: info?.airlineCode ?? '',
            airlineName: info?.name ?? airlineCode,
            airlineLogo: info?.icon ?? '',
            isSelected: false,
            itemCode: '01',
          );
          createInBoundFilterOptions?.add(departureAirline);
        }
      }
    }
  }

  ///This method is used to group all the Inbound airlines to show in filters.
  void setInboundAirlineFilter(
    FlightsDisplayModel value,
    FlightListIsolateModel isolateModel,
  ) {
    final airlineCode = value.flightDisplayInfo.airLineCode;
    if (isolateModel.arrivalFlightCountMap.containsKey(airlineCode)) {
      isolateModel.arrivalFlightCountMap[airlineCode] =
          isolateModel.arrivalFlightCountMap[airlineCode]! + 1;

      if (isolateModel.arrivalFlightCountMap[airlineCode]! == 1) {
        final AirLineInfo? info = isolateModel.airlineInfo?[airlineCode];

        final AirlineFilter departureAirline = AirlineFilter(
          airlineCode: info?.airlineCode ?? '',
          airlineName: info?.name ?? airlineCode,
          airlineLogo: info?.icon ?? '',
          isSelected: false,
          itemCode: '01',
        );

        createInBoundFilterOptions?.add(departureAirline);
      }
    }
  }

  ///This method is used to group the data based on price and airlines and adding final value list to show same for both oneway and return
  List<FlightsDisplayModel> groupFilteredInterNationalFlights(
    List<FlightsDisplayModel> internationalFlightFilterList,
  ) {
    if (internationalFlightFilterList.isNotEmpty) {
      // to check same key available in map or not
      for (final object in internationalFlightFilterList) {
        final String keyToCheck =
            '${object.flightDisplayInfo.price}${object.pricedItinerary.combinedAirlineCode}';
        if (_internationalFlightListingMap.containsKey(keyToCheck)) {
          final valuesAdded = (_internationalFlightListingMap[keyToCheck] ?? {})
              as List<FlightsDisplayModel>
            ..add(object);
          // to update existing map
          final update = _internationalFlightListingMap.update(
            keyToCheck,
            (object) => valuesAdded,
          );
          adLog(update.toString());
        } else {
          // to add new item in map
          final add = _internationalFlightListingMap.putIfAbsent(
            keyToCheck,
            () => [object],
          );
          adLog(add.toString());
        }
        internationalFlightListing.add(object);
      }
    }
    return setGroupedFlightModel();
  }

  ///This method is used to group the data based on price and airlines and adding final value list to show same for both oneway and return
  void addInInternationalFlightListWithMap(FlightsDisplayModel value) {
    if (value.flightDisplayInfo.price > 0) {
      // to check same key available in map or not
      final String keyToCheck =
          '${value.flightDisplayInfo.price}${value.pricedItinerary.combinedAirlineCode}';
      if (_internationalFlightListingMap.containsKey(keyToCheck)) {
        final valuesAdded = (_internationalFlightListingMap[keyToCheck] ?? {})
            as List<FlightsDisplayModel>
          ..add(value);
        // to update existing map
        final update = _internationalFlightListingMap.update(
          keyToCheck,
          (value) => valuesAdded,
        );
        adLog(update.toString());
      } else {
        // to add new item in map
        final add = _internationalFlightListingMap.putIfAbsent(
          keyToCheck,
          () => [value],
        );
        adLog(add.toString());
      }
      internationalFlightListing.add(value);
    }
  }

  ///This method is used to group the flights based on price and airlines code.
  List<FlightsDisplayModel> setGroupedFlightModel() {
    final List<FlightsDisplayModel> outBoundGroupFlightListing = [];
    if (internationalFlightListing.isNotEmpty) {
      if (_internationalFlightListingMap.isNotEmpty) {
        final List keys = _internationalFlightListingMap.keys.toList();
        for (final object in keys) {
          final List<FlightsDisplayModel> data =
              _internationalFlightListingMap[object] ??
                  [] as List<FlightsDisplayModel>
                ..
                    //sorting
                    sort(
                  (a, b) => a.flightDisplayInfo.flightDuration
                      .compareTo(b.flightDisplayInfo.flightDuration),
                );

          final List<FlightsDisplayModel> group = [];
          if (data.length > 1) {
            // group.clear();
            group.addAll(data);
          }
          final FlightsDisplayModel model = FlightsDisplayModel(
            flightDisplayInfo: data.first.flightDisplayInfo,
            flightFareInfo: data.first.flightFareInfo,
            flightFilterInfo: data.first.flightFilterInfo,
            flightGroups: group,
            pricedItinerary: data.first.pricedItinerary,
            uniqueIndex: data.first.uniqueIndex,
            internationReturnDisplayInfo:
                data.first.internationReturnDisplayInfo,
            internationReturnFilterInfo: data.first.internationReturnFilterInfo,
          );
          // final firstElement = model;

          outBoundGroupFlightListing.add(model);
        }
      }
    }
    return outBoundGroupFlightListing;
  }

  ///This method is used to make the list of domestic outbound for oneway and return
  void addInDomesticOutBoundFlightList(FlightsDisplayModel value) {
    outBoundFlightListing.add(value);
  }

  ///This method is used to make the list of domestic inbound for return
  void addInDomesticInBoundFlightList(FlightsDisplayModel value) {
    inBoundFlightListing.add(value);
  }

  ///This method is used to find out the unique outbound flights in a group.
  List<FlightsDisplayModel> setInterNationalOutBoundGroup(
    List<FlightsDisplayModel> flightGroup,
  ) {
    final List<FlightsDisplayModel> outBoundGroupFlightListing = [];
    final List<String> tempKeys = [];
    if (flightGroup.isNotEmpty) {
      for (final object in flightGroup) {
        final outBoundUniqueKey =
            object.pricedItinerary.itinerary.firstFlightDetails.uniqueKey;
        if (!tempKeys.contains(outBoundUniqueKey)) {
          tempKeys.add(outBoundUniqueKey);
          outBoundGroupFlightListing.add(object);
        }
      }
    }
    return outBoundGroupFlightListing;
  }

  ///This method is used to find out the unique outbound flights in a group.
  List<InterNationalInboundFlights>
      getInterNationalInBoundGroupBasedOnSelectedOutBound(
    List<FlightsDisplayModel> flightGroup,
    FlightsDisplayModel selectedOutBound,
  ) {
    final List<InterNationalInboundFlights> inBoundGroupFlightListing = [];
    if (flightGroup.isNotEmpty) {
      for (final object in flightGroup) {
        final combinedUniqueKey = object.pricedItinerary.itinerary.uniqueKey;
        if (combinedUniqueKey.contains(
          selectedOutBound
              .pricedItinerary.itinerary.firstFlightDetails.uniqueKey,
        )) {
          final newObject = InterNationalInboundFlights(
            flightsDisplayModel: object,
            isEnabled: true,
          );
          inBoundGroupFlightListing.add(newObject);
        }
        // else {
        //   final newObject = InterNationalInboundFlights(
        //     flightsDisplayModel: object,
        //     isEnabled: false,
        //   );
        //   inBoundGroupFlightListing.add(newObject);
        // }
      }
    }
    return inBoundGroupFlightListing;
  }
}
