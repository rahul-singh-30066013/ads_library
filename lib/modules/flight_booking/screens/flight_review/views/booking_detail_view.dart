/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/flight_segment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/origin_destination_option.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/technical_stops.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/baggage_details_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/flight_review_detail_item_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/journey_flight_list_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/layover_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/refundable_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/source_destination_booking_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// [BookingDetailView] is used to show the booking details including source,destination, time ,status and terminal.
/// [FlightReviewDetailItemView] is used to show the details like flight time and date ,terminal.
/// [LayOverView] is used to show the layover time.
/// [BaggageDetailsView] is used to show your baggage of cabin and check-in.
/// [RefundableView] is used to show refundable policy and fare rules.

const double fontSize15 = 15;

class BookingDetailView extends StatelessWidget {
  const BookingDetailView({
    Key? key,
    required this.tripType,
    required this.flightReviewDetailInfoItem,
    this.headerBgColor,
    this.screenType,
    this.listIndex = 0,
    required this.isInternational,
    this.miniRuleDisplayModel,
    this.flightReviewDetailModel,
    this.orderStatus,
  }) : super(key: key);

  /// this is used to identify the type of trip.
  final TripType? tripType;
  final Color? headerBgColor;
  final String? screenType;
  final int? listIndex;
  final bool isInternational;
  final MiniRuleDisplayModel? miniRuleDisplayModel;
  final FlightReviewDetailModel? flightReviewDetailModel;
  final String? orderStatus;

//FlightReviewDetailInfo list from api response to show all flight related info
  final FlightReviewDetailInfo flightReviewDetailInfoItem;

  @override
  Widget build(BuildContext context) {
    final PassengerJourneyInfo? passengerJourneyInfo =
        flightReviewDetailInfoItem.passengerJourneyInfo;
    final List<JourneyFlightDetails> journeyFlightDetails =
        flightReviewDetailInfoItem.journeyFlightDetails ?? [];
    final List<FlightBaggageDetails> flightBaggageDetails =
        flightReviewDetailInfoItem.flightBaggageDetails ?? [];
    String pnrNo = '';
    if (screenType == 'flightBookingConfirmation') {
      pnrNo = journeyFlightDetails.first.pnrCode;
    }
    final siteCore = context.read<SiteCoreStateManagement>();
    final String travelType = passengerJourneyInfo?.travelClass ?? '';

    return Column(
      children: [
        SourceDestinationBookingView(
          destination: siteCore
                  .airportCityMap[passengerJourneyInfo?.toLocation]?.cityName ??
              passengerJourneyInfo?.toCityName ??
              '',
          source: siteCore.airportCityMap[passengerJourneyInfo?.fromLocation]
                  ?.cityName ??
              passengerJourneyInfo?.fromCityName ??
              '',
          directionalId: flightReviewDetailInfoItem.directionInd ?? '',
          pnrNo: pnrNo,
          fontSize15: fontSize15,
          journeyDuration: passengerJourneyInfo?.journeyDuration ?? '',
          stoppage: passengerJourneyInfo?.stoppage ?? '',
          screenType: screenType,
          travelType: travelType,
          isInternational: isInternational,
          orderStatus: orderStatus,
        ),
        JourneyFlightListView(
          fontSize15: fontSize15,
          flightBaggageDetails: flightBaggageDetails,
          journeyFlightDetails: journeyFlightDetails,
          passengerJourneyInfo: passengerJourneyInfo,
          pnrNo: pnrNo,
          isInternational: isInternational,
          screenType: screenType,
          miniRuleDisplayModel: miniRuleDisplayModel,
          flightReviewDetailModel: flightReviewDetailModel,
          orderStatus: orderStatus,
        ),
        if (screenType != null && screenType == 'flightList')
          RefundableView(
            refundable: flightReviewDetailInfoItem.refundable,
          ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }

//calculate duration including Layover
  String getTotalDurationIncludeLayover(
    TechnicalStops? technicalStop,
    OriginDestinationOption? originDestinationOption,
  ) {
    int duration = 0;
    final List<FlightSegment>? flightSegment =
        originDestinationOption?.flightSegment;
    final int noOfStop = technicalStop?.noOfStops ?? 0;
    final List<StopsDetail>? stop = technicalStop?.stopDetail;
    if (noOfStop > 0 && stop != null && stop.isNotEmpty) {
      for (int stoppage = 0; stoppage < stop.length; stoppage++) {
        final int stoppageDuration = stop[stoppage].duration;
        duration = duration + stoppageDuration;
      }
    }
    if (flightSegment != null && flightSegment.isNotEmpty) {
      for (int segment = 0; segment < flightSegment.length; segment++) {
        final int travelDuration =
            int.parse(flightSegment[segment].duration ?? '0');
        duration = duration + travelDuration;
      }
    }
    return FlightUtils.durationToString(duration);
  }
}
