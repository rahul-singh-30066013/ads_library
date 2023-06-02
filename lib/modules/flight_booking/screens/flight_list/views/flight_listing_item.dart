/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/flight_listing_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_listing_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// creates a tile of flight and its details
class FlightListingItem extends StatelessWidget {
  /// [isRoundTrip] shows if it is round trip or one-way
  /// [isReturnTrip] checks if the flight is going or returning type
  const FlightListingItem({
    Key? key,
    this.isRoundTrip = false,
    this.isReturnTrip = false,
    required this.flightDisplayInfo,
    this.isSelected = false,
    this.sectorID = 'D',
    this.innerFlightListItem,
  }) : super(key: key);

  /// flight display info
  final FlightInfo flightDisplayInfo;

  /// shows if it is round trip or one-way
  final bool isRoundTrip;

  /// checks if the flight is going or returning type
  final bool isReturnTrip;

  /// checks if the item is selected or not
  final bool isSelected;

  /// inner list item - in case of international grouping
  final FlightsDisplayModel? innerFlightListItem;

  ///sector ID
  final String? sectorID;

  static const int _flexRoundTrip = 11;
  static const int _flexOneWayTrip = 4;
  static const double colorOpacity = 0.1;
  static const double letterSpacing = -0.4;

  static const double airlineNameW = 50;
  static const Color seatLeftColor = Color(0xffe40000);

  @override
  Widget build(BuildContext context) {
    final int seatLeft = flightDisplayInfo.seat;
    final int maxSeatThreshold =
        context.read<FlightListingState>().maxSeatThreshold;
    final isMultiCarrier = flightDisplayInfo.isMultiCarrier;
    return Container(
      color: isSelected
          ? context.adColors.blueColor.withOpacity(colorOpacity)
          : context.adColors.transparentColor,
      padding: EdgeInsets.only(
        top: context.k_16,
        bottom: context.k_16,
        left: isReturnTrip && isRoundTrip
            ? context.k_12
            : !isRoundTrip
                ? context.k_26
                : context.k_12,
        right: context.k_10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Utils.startsWithHttp(flightDisplayInfo.airLineIcon) &&
                  (isMultiCarrier==0))
                Container(
                  width: context.k_24,
                  height: context.k_24,
                  decoration: BoxDecoration(
                    color: context.adColors.whiteTextColor,
                    borderRadius: BorderRadius.circular(context.k_4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(context.k_4),
                    child: ADCachedImage(
                      width: context.k_24,
                      height: context.k_24,
                      imageUrl: flightDisplayInfo.airLineIcon,
                    ),
                  ),
                )
              else
                isMultiCarrier>0
                    ? SvgPicture.asset(
                        SvgAssets.multiCarrier,
                        width: context.k_24,
                        height: context.k_24,
                      )
                    : Image.asset(
                        flightDisplayInfo.airLineIcon,
                        width: context.k_24,
                        height: context.k_24,
                        fit: BoxFit.fill,
                      ),
              SizedBox(
                height: context.k_4,
              ),
              SizedBox(
                width: airlineNameW.sp,
                child: Text(
                  isMultiCarrier>0
                      ? 'multiple_airlines'.localize(context)
                      : flightDisplayInfo.airLineName,
                  style: isRoundTrip
                      ? ADTextStyle400.size10
                          .setTextColor(context.adColors.greyTextColor)
                      : ADTextStyle400.size12
                          .setTextColor(context.adColors.greyTextColor),
                ),
              ),
            ],
          ),
          const Spacer(),
          Expanded(
            flex: isRoundTrip ? _flexRoundTrip : _flexOneWayTrip,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${flightDisplayInfo.flightDepartureTime} - ${flightDisplayInfo.flightArrivalTime}',
                      style: ADTextStyle500.size14.setTextColor(
                        context.adColors.neutralInfoMsg,
                      ),
                    ),
                    SizedBox(
                      height: isRoundTrip ? context.k_6 : context.k_12,
                    ),
                    Text(
                      '${flightDisplayInfo.flightDuration} | ${flightDisplayInfo.stops}',
                      style: ADTextStyle400.size12
                          .setTextColor(context.adColors.greyTextColor)
                          .copyWith(letterSpacing: letterSpacing),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: isRoundTrip
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FlightUtils.getPriceFormatWithSymbol(
                        price: flightDisplayInfo.price.toDouble(),
                      ),
                      style: ADTextStyle700.size14,
                    ),
                    if (seatLeft > 0 && seatLeft <= maxSeatThreshold)
                      SizedBox(
                        height: isRoundTrip ? context.k_6 : context.k_12,
                      ),
                    if (seatLeft > 0 && seatLeft <= maxSeatThreshold)
                      Text(
                        seatLeft == 1
                            ? '$seatLeft ${'label_seat_left'.localize(context)}'
                            : '$seatLeft ${'label_seats_left'.localize(context)}',
                        style:
                            ADTextStyle400.size12.setTextColor(seatLeftColor),
                      ),
                  ],
                ).paddingBySide(
                  right: context.k_16,
                  top: !isOneWayTrip ? context.k_6 : 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
