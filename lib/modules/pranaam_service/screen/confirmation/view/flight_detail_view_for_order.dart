/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/flight_detail_row.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double dotWidth = 17.sp;
final double serviceTimePadding = 42.sp;
const Color paidWithCreditCardSectionColor = Color(0xfffbfbfb);

String year = '';
String yearFormatter(String dateTime, {String? format}) {
  return DateFormat(format ?? Constant.dateFormat12)
      .format(DateTime.parse(dateTime).toLocal())
      .toString();
}

class FlightDetailViewForOrder extends StatefulWidget {
  /// this class gives detail about your flight source and destination which includes
  /// no of travellers, date time and flight number.
  ///
  final String bookingID;
  final bool isRoundTrip;
  final bool isRoundTripDeparture;
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;
  const FlightDetailViewForOrder({
    Key? key,
    required this.bookingID,
    required this.bookingDetailsResponseModel,
    required this.isRoundTrip,
    this.isRoundTripDeparture = false,
  }) : super(key: key);

  @override
  State<FlightDetailViewForOrder> createState() =>
      _FlightDetailViewForOrderState();
}

class _FlightDetailViewForOrderState extends State<FlightDetailViewForOrder> {
  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();

  int travellerCount = 0;

  @override
  void initState() {
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    travellerCount = getTotalPassengersByType(
      pranaamAppDataStateManagement.cartDataResponse,
      adultPassengerCode,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final TripDetails tripDetails = widget.bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.tripDetails ??
        const TripDetails();
    final TripDetails roundTripDetails = widget.bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.roundTripDetail ??
        const TripDetails();
    final isTrvAirport = getCityName(
          tripDetails.serviceAirport ?? '',
          context.read<SiteCoreStateManagement>(),
        ) ==
        'Thiruvananthapuram';
    return Container(
      margin: EdgeInsets.all(context.k_20),
      color: paidWithCreditCardSectionColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlightDetailRow(
            rightText: 'Meeting Point',
            leftTextStyle: ADTextStyle400.size14
                .setTextColor(context.adColors.greyTextColor),
            leftText: 'Service',
            rightTextStyle: ADTextStyle400.size14
                .setTextColor(context.adColors.greyTextColor),
          ),
          ADSizedBox(
            height: context.k_4,
          ),
          FlightDetailRow(
            rightText: isTrvAirport
                ? tripDetails.flightTerminal == 'N/A' ||
                        tripDetails.flightTerminal == ''
                    ? '${getCityName(
                        tripDetails.serviceAirport ?? '',
                        context.read<SiteCoreStateManagement>(),
                      )}\n${'airportTitle'.localize(context)}'
                    : '${getCityName(
                        tripDetails.serviceAirport ?? '',
                        context.read<SiteCoreStateManagement>(),
                      )}\n${'airportTitle'.localize(context)}\n(${tripDetails.flightTerminal})'
                : tripDetails.flightTerminal == 'N/A' ||
                        tripDetails.flightTerminal == ''
                    ? '${getCityName(
                        tripDetails.serviceAirport ?? '',
                        context.read<SiteCoreStateManagement>(),
                      )} ${'airportTitle'.localize(context)}'
                    : '${getCityName(
                        tripDetails.serviceAirport ?? '',
                        context.read<SiteCoreStateManagement>(),
                      )} ${'airportTitle'.localize(context)}\n(${tripDetails.flightTerminal})',
            leftTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.blackTextColor),
            rightTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.blackTextColor),
            leftText: tripDetails.serviceType ?? '',
          ),
          ADSizedBox(
            height: context.k_28,
          ),
          FlightDetailRow(
            leftText: 'service_date'.localize(context),
            leftTextStyle: ADTextStyle400.size14
                .setTextColor(context.adColors.greyTextColor),
            rightText: 'service_time'.localize(context),
            rightTextStyle: ADTextStyle400.size14
                .setTextColor(context.adColors.greyTextColor),
          ),
          ADSizedBox(
            height: context.k_4,
          ),
          if (widget.isRoundTrip)
            FlightDetailRow(
              leftText: formatDateTimeFlightServiceDate(
                roundTripDetails.serviceDateTime,
              ),
              leftTextStyle: ADTextStyle500.size16
                  .setTextColor(context.adColors.blackTextColor),
              rightTextStyle: ADTextStyle500.size16
                  .setTextColor(context.adColors.blackTextColor),
              rightText: formatDateTimeFlightService12Time(
                roundTripDetails.serviceDateTime,
              ),
            )
          else
            FlightDetailRow(
              leftText: formatDateTimeFlightServiceDate(
                tripDetails.serviceDateTime,
              ),
              leftTextStyle: ADTextStyle500.size16
                  .setTextColor(context.adColors.blackTextColor),
              rightTextStyle: ADTextStyle500.size16
                  .setTextColor(context.adColors.blackTextColor),
              rightText: formatDateTimeFlightService12Time(
                tripDetails.serviceDateTime,
              ),
            ),
          ADSizedBox(
            height: context.k_28,
          ),
          FlightDetailRow(
            rightText: 'Booking ID',
            leftTextStyle: ADTextStyle400.size14
                .setTextColor(context.adColors.greyTextColor),
            leftText: 'flight_no'.localize(context),
            rightTextStyle: ADTextStyle400.size14
                .setTextColor(context.adColors.greyTextColor),
          ),
          ADSizedBox(
            height: context.k_4,
          ),
          FlightDetailRow(
            leftTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.blackTextColor),
            rightTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.blackTextColor),
            leftText: widget.isRoundTrip && roundTripDetails.flightName != ''
                ? tripDetails.transitRoundTripSecFlightName ?? ''
                : widget.isRoundTrip &&
                        tripDetails.transitRoundTripSecFlightName == ''
                    ? tripDetails.transitRoundTripSecFlightNumber.toString()
                    : tripDetails.flightName != ''
                        ? tripDetails.flightName ?? ''
                        : tripDetails.flightNumber ?? '',
            // rightText: widget.isRoundTrip
            //     ? roundTripDetails.tripBookingNumber ?? ''
            //     : widget.isRoundTripDeparture
            //         ? widget.bookingDetailsResponseModel.orderDetail
            //                 ?.pranaamDetail?.tripDetails?.tripBookingNumber ??
            //             ''
            //         : widget.bookingDetailsResponseModel.orderReferenceId ?? '',
            rightText:
                widget.bookingDetailsResponseModel.orderReferenceId ?? '',
          ),
          ADSizedBox(
            height: context.k_60,
          ),
        ],
      ),
    );
  }
}
