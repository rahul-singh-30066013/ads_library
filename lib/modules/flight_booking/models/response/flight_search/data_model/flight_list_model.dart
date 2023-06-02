/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/default_filter_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_isolate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flight_list_model_mapping_helper.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';

class FlightListModel {
  FlightListModel({
    this.inBoundFlightListing,
    this.outBoundFlightListing,
    this.defaultFilterModel,
    this.specialPricedItinerary,
    this.internationalFlightListing,
    this.internationalFlightListingWithGroup,
  });

  ///Use to show the filter & Sort content
  List<FlightsDisplayModel>? inBoundFlightListing;
  List<FlightsDisplayModel>? outBoundFlightListing;
  List<FlightsDisplayModel>? internationalFlightListing;
  List<FlightsDisplayModel>? internationalFlightListingWithGroup;
  final Map<String, PricedItinerary>? specialPricedItinerary;

  FlightSort flightSort = FlightSort.byPrice;
  SortType sortType = SortType.des;

  DefaultFilterModel? defaultFilterModel;

  FlightListModel copyWith({
    List<FlightsDisplayModel>? inBoundFlightListing,
    List<FlightsDisplayModel>? outBoundFlightListing,
    DefaultFilterModel? defaultFilterModel,
    List<FlightsDisplayModel>? internationalFlightListing,
    List<FlightsDisplayModel>? internationalFlightListingWithGroup,
  }) =>
      FlightListModel(
        inBoundFlightListing: inBoundFlightListing ?? this.inBoundFlightListing,
        outBoundFlightListing:
            outBoundFlightListing ?? this.outBoundFlightListing,
        defaultFilterModel: defaultFilterModel ?? this.defaultFilterModel,
        internationalFlightListing:
            internationalFlightListing ?? this.internationalFlightListing,
        internationalFlightListingWithGroup:
            internationalFlightListingWithGroup ??
                this.internationalFlightListingWithGroup,
      );

  ///TODO:Need to set mainFlightListing as a copy of flightListing
  factory FlightListModel.fromJson(
    FlightListIsolateModel isolateModel,
  ) {
    final FlightListModelMappingHelper flightListModelMappingHelper =
        FlightListModelMappingHelper();

    if (isolateModel.jsonData['pricedItineraries'] != null) {
      final List listObject =
          isolateModel.jsonData['pricedItineraries'] as List;
      for (int index = 0; index < listObject.length; index++) {
        final PricedItinerary pricedItinerary =
            PricedItinerary.fromJson(listObject[index]);
        //for international flight only
        if (!pricedItinerary.isDomestic) {
          final value = FlightsDisplayModel.fromPricedItinerary(
            itinerary: pricedItinerary,
            uniqueIndex: index,
            airlineInfo: isolateModel.airlineInfo,
          );

          ///Create map for Out Bound international arrival airports
          flightListModelMappingHelper
            ..setOutBoundMapInternationalArrivalAirports(
              value,
              isolateModel,
            )

            ///Create map for In Bound international arrival airports
            ..setInBoundMapInternationalArrivalAirports(
              value,
              isolateModel,
            )

            ///Create map for Out Bound international departure airports
            ..setOutBoundMapInternationalDepartureAirports(
              value,
              isolateModel,
            )

            ///Create map for In Bound international departure airports
            ..setInBoundMapInternationalDepartureAirports(
              value,
              isolateModel,
            )

            ///Airline list ready for outbound flight filter
            ..setOutboundAirlineFilter(
              value,
              isolateModel,
            )
            ..setInBoundInternationalAirlineFilter(value, isolateModel,)
            ..addInInternationalFlightListWithMap(value);


        }
        //for domestic flight only
        else {
          if (pricedItinerary.directionInd == 'O') {
            final value = FlightsDisplayModel.fromPricedItinerary(
              itinerary: pricedItinerary,
              uniqueIndex: index,
              airlineInfo: isolateModel.airlineInfo,
            );

            flightListModelMappingHelper
              ..setOutboundAirlineFilter(value, isolateModel)
              ..addInDomesticOutBoundFlightList(value);
          } else {
            final value = FlightsDisplayModel.fromPricedItinerary(
              itinerary: pricedItinerary,
              uniqueIndex: index,
              airlineInfo: isolateModel.airlineInfo,
            );

            flightListModelMappingHelper
              ..setInboundAirlineFilter(value, isolateModel)
              ..addInDomesticInBoundFlightList(value);
          }
        }
      }
    }

    final Map<String, PricedItinerary> _specialPricedItinerary = {};
    if (isolateModel.jsonData['splrt'] != null) {
      final List listObject = isolateModel.jsonData['splrt'] as List;
      for (int index = 0; index < listObject.length; index++) {
        final PricedItinerary pricedItinerary =
            PricedItinerary.fromJson(listObject[index]);
        _specialPricedItinerary.addAll(
          {
            pricedItinerary.itinerary.uniqueKey: pricedItinerary,
          },
        );
      }
    }

    return FlightListModel(
      inBoundFlightListing: flightListModelMappingHelper.inBoundFlightListing,
      outBoundFlightListing: flightListModelMappingHelper.outBoundFlightListing,
      specialPricedItinerary: _specialPricedItinerary,
      internationalFlightListing:
          flightListModelMappingHelper.internationalFlightListing,
      internationalFlightListingWithGroup:
          flightListModelMappingHelper.setGroupedFlightModel(),
      defaultFilterModel: DefaultFilterModel(
        departureFlightCountMap: isolateModel.departureFlightCountMap,
        arrivalFlightCountMap: isolateModel.arrivalFlightCountMap,
        outBoundFilterOptions:
            flightListModelMappingHelper.createOutBoundFilterOptions ?? [],
        inBoundFilterOptions:
            flightListModelMappingHelper.createInBoundFilterOptions ?? [],

        ///International Out bound
        outBoundInternationalArrivalNearByAirportMap:
            flightListModelMappingHelper.outBoundInternationalAirportArrivalMap,
        outBoundInternationalDepartureNearByAirportMap:
            flightListModelMappingHelper
                .outBoundInternationalAirportDepartureMap,
        outBoundInternationalArrivalNearbyAirports: flightListModelMappingHelper
                .outBoundInternationalCreateArrivalNearbyAirport ??
            [],
        outBoundInternationalDepartureNearbyAirports:
            flightListModelMappingHelper
                    .outBoundInternationalCreateDepartureNearbyAirport ??
                [],

        /// International In bound
        inBoundInternationalArrivalNearByAirportMap:
            flightListModelMappingHelper.inBoundInternationalAirportArrivalMap,
        inBoundInternationalDepartureNearByAirportMap:
            flightListModelMappingHelper
                .inBoundInternationalAirportDepartureMap,
        inBoundInternationalArrivalNearbyAirports: flightListModelMappingHelper
                .inBoundInternationalCreateArrivalNearbyAirport ??
            [],
        inBoundInternationalDepartureNearbyAirports:
            flightListModelMappingHelper
                    .inBoundInternationalCreateDepartureNearbyAirport ??
                [],
      ),
    );
  }

  PricedItinerary? getSpecialPricedItinerary(uniqueKey) =>
      specialPricedItinerary?[uniqueKey];
}
