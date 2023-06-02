/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_review_order_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_payment/views/flight_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/duty_free_service_type_view.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/review_pranaam_booking.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/service_type_view.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/stand_alone_service_type_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class PaymentUpperViewWrapper extends StatelessWidget {
  const PaymentUpperViewWrapper({
    Key? key,
    required this.paymentModule,
    this.tripType,
    this.onTapDetails,
    this.onInfoTap,
    this.flightReviewDetailInfo,
    this.passengerCount,
  }) : super(key: key);

  final PaymentModule paymentModule;
  final List<FlightReviewDetailInfo>? flightReviewDetailInfo;

  /// this is used to identify the type of trip.
  final TripType? tripType;

  /// this defines the full name of source city

  final int? passengerCount;

  /// on tap handler
  final ADTapCallback? onTapDetails;
  final GestureTapCallback? onInfoTap;

  @override
  Widget build(BuildContext context) {
    if (paymentModule == PaymentModule.dutyFree) {
      return DutyFreeServiceTypeView(
        onInfoTap: () => adShowBottomSheet(
          context: context,
          childWidget: const DutyFreeReviewOrderBottomSheet(),
          headerTitle: 'review_order'.localize(context),
        ),
      );
    } else if (paymentModule == PaymentModule.pranaam) {
      return ServiceTypeView(
        onInfoTap: () => adShowFareDetailsBottomSheet(
          context: context,
          childWidget: const ReviewPranaamBooking(),
          headerTitle: 'Review Booking',
        ),
      );
    }else if (paymentModule == PaymentModule.standAlone) {
      return StandAloneServiceTypeView(
        onInfoTap: () => adShowFareDetailsBottomSheet(
          context: context,
          childWidget: const ReviewPranaamBooking(),
          headerTitle: 'Review Booking',
        ),
      );
    }
    else {
      final siteCore = context.read<SiteCoreStateManagement>();
      return FlightDetail(
        tripType: tripType,
        fromCityCode:
            flightReviewDetailInfo?.first.passengerJourneyInfo?.fromLocation ??
                '',
        fromCityName: siteCore
                .airportCityMap[flightReviewDetailInfo
                    ?.first.journeyFlightDetails?.first.flightDepartureCityCode]
                ?.cityName ??
            flightReviewDetailInfo
                ?.first.journeyFlightDetails?.first.flightDepartureCityName ??
            '',
        fromDate: FlightUtils.isRoundTrip(
          tripType,
        )
            ? flightReviewDetailInfo?.first.journeyFlightDetails?.first
                    .flightDepartureShortDate ??
                ''
            : flightReviewDetailInfo?.first.journeyFlightDetails?.first
                    .flightDepartureShortDate ??
                '',
        toCityCode:
            flightReviewDetailInfo?.last.passengerJourneyInfo?.toLocation ?? '',
        toCityName: FlightUtils.isRoundTrip(
          tripType,
        )
            ? siteCore
                    .airportCityMap[flightReviewDetailInfo?.first
                        .journeyFlightDetails?.last.flightArrivalCityCode]
                    ?.cityName ??
                flightReviewDetailInfo
                    ?.first.journeyFlightDetails?.last.flightArrivalCityName ??
                ''
            : siteCore
                    .airportCityMap[flightReviewDetailInfo
                        ?.last.journeyFlightDetails?.last.flightArrivalCityCode]
                    ?.cityName ??
                flightReviewDetailInfo
                    ?.last.journeyFlightDetails?.last.flightArrivalCityName ??
                '',
        toDate: FlightUtils.isRoundTrip(
          tripType,
        )
            ? flightReviewDetailInfo
                    ?.last.journeyFlightDetails?.last.flightArrivalShortDate ??
                ''
            : '',
        passengerCount: passengerCount ?? 0,
        onTapDetails: onTapDetails,
      );
    }
  }
}
