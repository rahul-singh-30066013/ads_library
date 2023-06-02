/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this will used to display data on review detail screen
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/ticket_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/airport.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/flight_segment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/origin_destination_option.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/technical_stops.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/site_core/model/airline/airline_info.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';

/// this is display model to show data on review screen,
/// it will be created using FlightViewItineraryResponseModel
class FlightReviewDetailModel {
  FlightReviewDetailModel({
    this.flightReviewDetailInfo,
    this.flightFareInfo,
    this.miniRuleDisplayModel,
  });

  List<FlightReviewDetailInfo>? flightReviewDetailInfo;
  List<FareDetailsInfo>? flightFareInfo;
  MiniRuleDisplayModel? miniRuleDisplayModel;

  FlightReviewDetailModel copyWith({
    List<FlightReviewDetailInfo>? flightReviewDetailInfo,
    List<FareDetailsInfo>? flightFareInfo,
    MiniRuleDisplayModel? miniRuleDisplayModel,
  }) =>
      FlightReviewDetailModel(
        flightReviewDetailInfo:
            flightReviewDetailInfo ?? this.flightReviewDetailInfo,
        flightFareInfo: flightFareInfo ?? this.flightFareInfo,
        miniRuleDisplayModel: miniRuleDisplayModel ?? this.miniRuleDisplayModel,
      );
}

///display object for FlightReviewDetailInfo created from view itinerary response model
class FlightReviewDetailInfo {
  FlightReviewDetailInfo({
    this.passengerJourneyInfo,
    this.journeyFlightDetails,
    this.flightBaggageDetails,
    this.refundable,
    this.passengerListInJourney,
    this.directionInd,
    this.isJourneyCancelable,
  });

  PassengerJourneyInfo? passengerJourneyInfo;
  List<JourneyFlightDetails>? journeyFlightDetails;
  List<FlightBaggageDetails>? flightBaggageDetails;
  bool? refundable;
  PassengerListInJourney? passengerListInJourney;
  String? directionInd;
  bool? isJourneyCancelable;

  String firstPaxPnr() {
    final cancellableList =
        passengerListInJourney?.cancellablePaxInfoList ?? [];
    if (cancellableList.isNotEmpty) {
      return cancellableList.first.ticketInfo?.first?.pnr ?? '';
    }
    return '';
  }

//to show pnr on booking detail screen
  String firstPaxToShowPnr() {
    final allPaxList = passengerListInJourney?.allPaxInfoList ?? [];
    if (allPaxList.isNotEmpty) {
      final List<TicketInfo?> ticketInfo = allPaxList.first.ticketInfo ?? [];
      return ticketInfo.isNotEmpty
          ? ticketInfo.first?.pnr ?? ''
          : allPaxList.first.allPaxInfoList?.ticketInfo?.last.pnr ?? '';
    }
    return '';
  }

  FlightReviewDetailInfo copyWith({
    PassengerJourneyInfo? passengerJourneyInfo,
    List<JourneyFlightDetails>? journeyFlightDetails,
    List<FlightBaggageDetails>? flightBaggageDetails,
    bool? refundable,
    PassengerListInJourney? passengerListInJourney,
    String? directionInd,
    bool? isJourneyCancelable,
  }) =>
      FlightReviewDetailInfo(
        passengerJourneyInfo: passengerJourneyInfo ?? this.passengerJourneyInfo,
        journeyFlightDetails: journeyFlightDetails ?? this.journeyFlightDetails,
        flightBaggageDetails: flightBaggageDetails ?? this.flightBaggageDetails,
        refundable: refundable ?? this.refundable,
        passengerListInJourney:
            passengerListInJourney ?? this.passengerListInJourney,
        directionInd: directionInd ?? this.directionInd,
        isJourneyCancelable: isJourneyCancelable ?? this.isJourneyCancelable,
      );

  factory FlightReviewDetailInfo.fromPricedItinerary({
    required PricedItinerary itinerary,
    required List<PaxInfoList>? paxInfoList,
    required Map<String, AirLineInfo?>? airlineInfo,
    required bool isInternationalReturn,
  }) {
    final List<JourneyFlightDetails> _journeyFlightList = [];
    final List<FlightBaggageDetails> _flightBaggageDetails = [];
    final isRefundable = itinerary.miniRule?.isRefundable ?? false;
    final OriginDestinationOption? originDestination = isInternationalReturn
        ? itinerary.airItinerary?.originDestinationOption?.last
        : itinerary.airItinerary?.originDestinationOption?.first;
    final List<FlightSegment>? flightSegment =
        originDestination?.flightSegment ?? [];

    if (flightSegment != null && flightSegment.isNotEmpty) {
      for (int flight = 0; flight < flightSegment.length; flight++) {
        final FlightSegment flightDetailObj = flightSegment[flight];
        adLog('arrivalDate ${flightDetailObj.arrivalDate}');
        final JourneyFlightDetails journeyFlightDetails = JourneyFlightDetails(
          //operatingAirline? needs to change with validating carrier
          airLineIcon:
              airlineInfo?[flightDetailObj.operatingAirline?.code]?.icon ??
                  flightDetailObj.validatingCarrier.toString(),
          airLineName:
              airlineInfo?[flightDetailObj.operatingAirline?.code]?.name ??
                  flightDetailObj.validatingCarrier.toString(),
          airLineNumber:
              '${flightDetailObj.operatingAirline?.code}-${flightDetailObj.flightNumber ?? 'N/A'}',
          flightArrivalAirportName:
              flightDetailObj.arrivalAirport?.name ?? 'N/A',
          flightArrivalCityName: flightDetailObj.arrivalAirport?.city ?? 'N/A',
          flightArrivalDate: FlightUtils.getConvertedDateStringInDdMMYYYY(
            flightDetailObj.arrivalDate ?? 'N/A',
          ),
          flightArrivalTerminal: flightDetailObj.arrivalAirport?.terminal ?? '',
          flightArrivalTime: flightDetailObj.arrivalTime ?? 'N/A',
          flightDepartureAirportName:
              flightDetailObj.departureAirport?.name ?? 'N/A',
          flightDepartureCityName:
              flightDetailObj.departureAirport?.city ?? 'N/A',
          flightDepartureDate: FlightUtils.getConvertedDateStringInDdMMYYYY(
            flightDetailObj.departureDate ?? 'N/A',
          ),
          flightDepartureShortDate: FlightUtils.getConvertedDateShortString(
            flightDetailObj.departureDate ?? 'N/A',
          ),
          flightDepartureTerminal:
              flightDetailObj.departureAirport?.terminal ?? '',
          flightDepartureTime: flightDetailObj.departureTime ?? 'N/A',
          flightDuration: FlightUtils.durationToString(
            int.parse(flightDetailObj.duration ?? '0'),
          ),
          flightLayoverAirport: getLayoverAirport(
            originDestination?.technicalStops,
            flight,
          ),
          flightLayoverDuration: getLayoverDuration(
            originDestination?.technicalStops,
            flight,
          ),
          isPlaneChange: checkLayoverFlight(
            '${flightDetailObj.operatingAirline?.code ?? ''}${flightDetailObj.operatingAirline?.flightNumber ?? ''}',
            flight > 0 ? flightSegment[flight - 1] : null,
          ),
          flightArrivalCityCode:
              flightDetailObj.arrivalAirport?.locationCode ?? '',
          flightDepartureCityCode:
              flightDetailObj.departureAirport?.locationCode ?? '',
          flightDepartureDateOnlyDdMm: FlightUtils.getConvertedDdMmString(
            flightDetailObj.departureDate ?? 'N/A',
          ),
          flightArrivalDateOnlyDdMm: FlightUtils.getConvertedDdMmString(
            flightDetailObj.arrivalDate ?? 'N/A',
          ),
          flightArrivalShortDate: FlightUtils.getConvertedDateShortString(
            flightDetailObj.arrivalDate ?? 'N/A',
          ),
          isAirportChange: itinerary.airItinerary?.isAirportChange ?? false,
          isTerminalChange: itinerary.airItinerary?.isTerminalChange ?? false,
          transitVisaMessage: flightDetailObj.transitVisaMessage ?? '',
          layoverType: getLayoverTypeForCurrentSegment(
            originDestination?.technicalStops,
            flight,
          ),
          pnrCode: getPnrCodeBasedOnSegment(
            rph: flightDetailObj.rph ?? 0,
            directionInd: originDestination?.directionInd ?? '',
            ticketInfo: (paxInfoList?.length ?? 0) > 0
                ? paxInfoList?.first.ticketInfo ?? []
                : [],
          ),
          isOperatedByDifferentAirline:
              isSameOperatingAirline(flightDetailObj: flightDetailObj),
          operatedAirline: flightDetailObj.operatingAirline?.name ?? '',
          baggageInfoNote: flightDetailObj.baggageInfoNote ?? '',
        );
        final FlightBaggageDetails flightBaggageDetails = FlightBaggageDetails(
          fromLocationCode:
              flightDetailObj.departureAirport?.locationCode ?? 'N/A',
          toLocationCode: flightDetailObj.arrivalAirport?.locationCode ?? 'N/A',
          cabinBaggageWeight: flightDetailObj.cabinBaggage ?? '',
          checkInBaggageWeight: flightDetailObj.chekinBaggage ?? '',
          baggageInfoNote: flightDetailObj.baggageInfoNote,
        );
        _journeyFlightList.add(journeyFlightDetails);
        _flightBaggageDetails.add(flightBaggageDetails);
      }
    }

    return FlightReviewDetailInfo(
      // refundable: originDestination?.fareRefundable ?? false,
      refundable: isRefundable,
      passengerJourneyInfo: PassengerJourneyInfo.fromOriginDestinationOption(
        originDestination,
        (paxInfoList?.length ?? 0) > 0
            ? paxInfoList?.first.ticketInfo ?? []
            : [],
      ),
      journeyFlightDetails: _journeyFlightList,
      flightBaggageDetails: _flightBaggageDetails,
      passengerListInJourney: PassengerListInJourney.fromPricedItineraryAndPax(
        originDestinationOption: originDestination,
        paxList: paxInfoList,
        directionInd: originDestination?.directionInd ?? '',
      ),
      directionInd: originDestination?.directionInd ?? '',
      isJourneyCancelable: originDestination?.journeyCancelable ?? false,
    );
  }

  static String getLayoverAirport(
    TechnicalStops? technicalStops,
    int flightListIndex,
  ) {
    String layOverAirport = '';
    if (technicalStops != null && technicalStops.stopDetail != null) {
      final List<StopsDetail> stopDetail = technicalStops.stopDetail ?? [];
      if (stopDetail.isNotEmpty && stopDetail.length > flightListIndex) {
        layOverAirport = stopDetail[flightListIndex].name ?? '';
      }
    }
    return layOverAirport;
  }

  static String getLayoverDuration(
    TechnicalStops? technicalStops,
    int flightListIndex,
  ) {
    int layOverDuration = 0;
    if (technicalStops != null && technicalStops.stopDetail != null) {
      final List<StopsDetail> stopDetail = technicalStops.stopDetail ?? [];
      if (stopDetail.isNotEmpty && stopDetail.length > flightListIndex) {
        layOverDuration = stopDetail[flightListIndex].duration;
      }
    }
    return FlightUtils.durationToString(layOverDuration);
  }

  static bool checkLayoverFlight(
    String currentAirlineCode,
    FlightSegment? prevFlightDetailObj,
  ) {
    bool isChange = false;
    final String prevFlightCode =
        '${prevFlightDetailObj?.operatingAirline?.code ?? ''}${prevFlightDetailObj?.operatingAirline?.flightNumber ?? ''}';
    if (currentAirlineCode.isEmpty || prevFlightCode.isEmpty) {
      isChange = true;
    } else if (prevFlightCode == currentAirlineCode) {
      isChange = false;
    } else {
      isChange = true;
    }
    return isChange;
  }

  static String getLayoverTypeForCurrentSegment(
    TechnicalStops? technicalStops,
    int flightListIndex,
  ) {
    String layOverType = '-1';
    if (technicalStops != null && technicalStops.stopDetail != null) {
      final List<StopsDetail> stopDetail = technicalStops.stopDetail ?? [];
      if (stopDetail.isNotEmpty && stopDetail.length > flightListIndex) {
        layOverType = stopDetail[flightListIndex].layoverType;
      }
    }
    return layOverType;
  }

  static String getPnrCodeBasedOnSegment({
    required int rph,
    required String directionInd,
    required List<TicketInfo> ticketInfo,
  }) {
    String pnrCode = '';
    if (ticketInfo.isNotEmpty) {
      for (final object in ticketInfo) {
        if (object.directionInd == directionInd && object.rph == rph) {
          pnrCode = object.pnr ?? '';
          break;
        }
      }
    }
    return pnrCode;
  }

//to check for same operating airline
  static bool isSameOperatingAirline({
    required FlightSegment flightDetailObj,
  }) {
    bool isSameOperator = false;
    if ((flightDetailObj.operatingAirline?.code ?? '').isNotEmpty &&
        (flightDetailObj.operatingAirline?.code ?? '') ==
            (flightDetailObj.marketingAirline?.code ?? '')) {
      isSameOperator = true;
    }
    return isSameOperator;
  }
}

//this will show journey info on top of screen
class PassengerJourneyInfo {
  PassengerJourneyInfo({
    required this.fromLocation,
    required this.toLocation,
    required this.fromCityName,
    required this.toCityName,
    required this.stoppage,
    required this.journeyDuration,
    required this.travelClass,
    required this.pnrTicketInfo,
  });

  final String fromLocation;
  final String toLocation;
  final String fromCityName;
  final String toCityName;
  final String stoppage;
  final String journeyDuration;
  final String travelClass;
  final List<TicketInfo> pnrTicketInfo;

  factory PassengerJourneyInfo.fromOriginDestinationOption(
    OriginDestinationOption? originDestinationOption,
    List<TicketInfo> ticketInfo,
  ) {
    return PassengerJourneyInfo(
      fromLocation: originDestinationOption
              ?.flightSegment?.first.departureAirport?.locationCode ??
          'N/A',
      toLocation: originDestinationOption
              ?.flightSegment?.last.arrivalAirport?.locationCode ??
          'N/A',
      toCityName:
          originDestinationOption?.flightSegment?.last.arrivalAirport?.city ??
              'N/A',
      fromCityName: originDestinationOption
              ?.flightSegment?.first.departureAirport?.city ??
          'N/A',
      journeyDuration: FlightUtils.durationToString(
        originDestinationOption?.flightDuration ?? 0,
      ),
      stoppage: FlightUtils.numberOFStops(
        originDestinationOption?.technicalStops?.noOfStops ?? 0,
      ),
      travelClass: FlightUtils.getTravelType(
        originDestinationOption?.flightSegment?.first.cabin?.code ?? '',
      ),
      pnrTicketInfo: ticketInfo,
    );
  }
}

// this will used to show flight overall details
class JourneyFlightDetails {
  JourneyFlightDetails({
    required this.airLineIcon,
    required this.airLineName,
    required this.airLineNumber,
    required this.flightDepartureTime,
    required this.flightArrivalTime,
    required this.flightDuration,
    required this.flightDepartureDate,
    required this.flightArrivalDate,
    required this.flightDepartureDateOnlyDdMm,
    required this.flightArrivalDateOnlyDdMm,
    required this.flightDepartureCityName,
    required this.flightArrivalCityName,
    required this.flightDepartureTerminal,
    required this.flightArrivalTerminal,
    required this.flightDepartureAirportName,
    required this.flightArrivalAirportName,
    required this.flightLayoverAirport,
    required this.flightLayoverDuration,
    required this.isPlaneChange,
    required this.flightDepartureCityCode,
    required this.flightArrivalCityCode,
    required this.flightDepartureShortDate,
    required this.flightArrivalShortDate,
    required this.isTerminalChange,
    required this.isAirportChange,
    required this.transitVisaMessage,
    required this.layoverType,
    required this.pnrCode,
    required this.isOperatedByDifferentAirline,
    required this.operatedAirline,
    required this.baggageInfoNote,
  });

  final String airLineIcon;
  final String airLineName;
  final String airLineNumber;
  final String flightDepartureTime;
  final String flightArrivalTime;
  final String flightDuration;
  final String flightDepartureDate;
  final String flightDepartureShortDate;
  final String flightArrivalDate;
  final String flightArrivalShortDate;
  final String flightDepartureDateOnlyDdMm;
  final String flightArrivalDateOnlyDdMm;
  final String flightDepartureCityName;
  final String flightArrivalCityName;
  final String flightDepartureTerminal;
  final String flightArrivalTerminal;
  final String flightDepartureAirportName;
  final String flightArrivalAirportName;
  final String flightLayoverAirport;
  final String flightLayoverDuration;
  final bool isPlaneChange;
  final String flightDepartureCityCode;
  final String flightArrivalCityCode;
  final bool? isTerminalChange;
  final bool? isAirportChange;
  final String? transitVisaMessage;
  final String layoverType;
  final String pnrCode;
  final bool isOperatedByDifferentAirline;
  final String operatedAirline;
  final String baggageInfoNote;
}

//this will show journey info on top of screen
class FlightBaggageDetails {
  FlightBaggageDetails({
    required this.fromLocationCode,
    required this.toLocationCode,
    required this.checkInBaggageWeight,
    required this.cabinBaggageWeight,
    this.baggageInfoNote,
  });

  final String fromLocationCode;
  final String toLocationCode;
  final String checkInBaggageWeight;
  final String cabinBaggageWeight;
  final String? baggageInfoNote;
}

class PassengerListInJourney {
  PassengerListInJourney({
    this.fromLocation,
    this.toLocation,
    this.allPaxInfoList,
    this.cancellablePaxInfoList,
    this.journeyWisePaxInfoList,
  });

  final Airport? fromLocation;
  final Airport? toLocation;
  final List<PassengerTicketInfo>? allPaxInfoList;
  final List<PassengerTicketInfo>? cancellablePaxInfoList;
  final List<PaxInfoList>? journeyWisePaxInfoList;

  factory PassengerListInJourney.fromPricedItineraryAndPax({
    OriginDestinationOption? originDestinationOption,
    List<PaxInfoList>? paxList,
    required String directionInd,
  }) {
    final List<PassengerTicketInfo> filteredPaxListPaxList = [];
    final List<PassengerTicketInfo> allPaxListPaxList = [];
    final travellerList = paxList ?? [];

    for (final traveller in travellerList) {
      final ticketInfo = traveller.ticketInfo ?? [];
      final List<TicketInfo> filteredTicketInfo = [];
      final List<TicketInfo> allTicketInfo = [];
      for (final ticket in ticketInfo) {
        if (ticket.directionInd == directionInd) {
          if (ticket.bookingStatus != BookingStatusType.Q.name &&
              ticket.bookingStatus != BookingStatusType.K.name) {
            filteredTicketInfo.add(ticket.copyWith());
          }
          allTicketInfo.add(ticket.copyWith());
        }
      }

      final passengerTicketInfo = PassengerTicketInfo(
        ticketInfo: filteredTicketInfo,
        cancellablePaxInfoList: traveller.copyWith(),
        allPaxInfoList: traveller.copyWith(),
        allTicketInfo: allTicketInfo,
      );
      if (filteredTicketInfo.isNotEmpty) {
        filteredPaxListPaxList.add(passengerTicketInfo);
      }
      allPaxListPaxList.add(passengerTicketInfo);
    }

    return PassengerListInJourney(
      fromLocation:
          originDestinationOption?.flightSegment?.first.departureAirport,
      toLocation: originDestinationOption?.flightSegment?.last.arrivalAirport,
      cancellablePaxInfoList: filteredPaxListPaxList,
      allPaxInfoList: allPaxListPaxList,
    );
  }
}

///This is to maintain the cancellable pax list
class PassengerTicketInfo {
  final List<TicketInfo?>? ticketInfo;
  final PaxInfoList? cancellablePaxInfoList;
  final PaxInfoList? allPaxInfoList;
  final List<TicketInfo>? allTicketInfo;

  PassengerTicketInfo({
    this.ticketInfo,
    this.cancellablePaxInfoList,
    this.allPaxInfoList,
    this.allTicketInfo,
  });
}
