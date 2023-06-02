/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// creates a tile of flight and its details -used in case of international only
class InternationalFlightListingItem extends StatelessWidget {
  /// [isRoundTrip] shows if it is round trip or one-way
  /// [isReturnTrip] checks if the flight is going or returning type
  const InternationalFlightListingItem({
    Key? key,
    this.isRoundTrip = false,
    this.isReturnTrip = false,
    required this.flightDisplayInfo,
    this.isSelected = false,
    this.sectorID = 'D',
    this.innerFlightListItem,
    this.maxSeatThreshold,
    this.isMoreOptionVisible = false,
    this.isEnable = true,
    this.isReturnFlightVisible = false,
    this.flightBookingModel,
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

  /// max threshold
  final int? maxSeatThreshold;

  ///bool to check more options visible or not
  final bool isMoreOptionVisible;

  /// bool to show widget enable/disable
  final bool isEnable;

  ///bool to check whether return flight needs to show on same strip
  final bool isReturnFlightVisible;

  /// to show color for city
  final FlightBookingModel? flightBookingModel;

  static const double colorOpacity = 0.1;
  static const double letterSpacing = -0.4;
  static const double colorOpacityDisableItem = 0.5;
  static const double airlineNameW = 54;
  static const double leftSidePadding = 64;
  static const Color seatLeftColor = Color(0xffe40000);
  static const Color locationCodeStripColor = Color(0xfffff7b7);

  int multiCarrierCount() {
    if (isMoreOptionVisible && isRoundTrip) {
      final multiAirlineCount = max(
        flightDisplayInfo.isMultiCarrier,
        innerFlightListItem?.internationReturnDisplayInfo?.isMultiCarrier ?? 0,
      );
      if (multiAirlineCount == 0 &&
          flightDisplayInfo.airLineCode !=
              innerFlightListItem?.internationReturnDisplayInfo?.airLineCode) {
        return 1;
      }
      return multiAirlineCount;
    } else {
      return flightDisplayInfo.isMultiCarrier;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSeatLeftVisible = false;
    final innerListLength = innerFlightListItem?.flightGroups ?? [];
    final int seatLeft = flightDisplayInfo.seat;
    final sourceCityCode =
        flightBookingModel?.oneWayTrip?.fromCity?.cityCode ?? '';
    final isMultiCarrier = multiCarrierCount();
    final destinationCityCode =
        flightBookingModel?.oneWayTrip?.toCity?.cityCode ?? '';
    if (seatLeft > 0 && seatLeft <= (maxSeatThreshold ?? 0)) {
      isSeatLeftVisible = true;
    }
    return Opacity(
      opacity: isEnable
          ? 1
          : isRoundTrip
              ? colorOpacityDisableItem
              : 1,
      child: Container(
        color: isRoundTrip && isSelected
            ? context.adColors.blueColor.withOpacity(colorOpacity)
            : context.adColors.transparentColor,
        padding: EdgeInsets.only(
          top: context.k_24,
          bottom: context.k_24,
          left:
              isRoundTrip && !isMoreOptionVisible ? context.k_14 : context.k_16,
          right:
              isRoundTrip && !isMoreOptionVisible ? context.k_2 : context.k_16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Utils.startsWithHttp(flightDisplayInfo.airLineIcon) &&
                        isMultiCarrier == 0)
                      Container(
                        width: isRoundTrip && !isMoreOptionVisible
                            ? context.k_22
                            : context.k_24,
                        height: isRoundTrip && !isMoreOptionVisible
                            ? context.k_22
                            : context.k_24,
                        decoration: BoxDecoration(
                          color: context.adColors.whiteTextColor,
                          borderRadius: BorderRadius.circular(context.k_4),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(context.k_4),
                          child: ADCachedImage(
                            width: isRoundTrip && !isMoreOptionVisible
                                ? context.k_22
                                : context.k_24,
                            height: isRoundTrip && !isMoreOptionVisible
                                ? context.k_22
                                : context.k_24,
                            imageUrl: flightDisplayInfo.airLineIcon,
                          ),
                        ),
                      )
                    else
                      isMultiCarrier > 0
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: isRoundTrip && !isMoreOptionVisible
                                      ? context.k_22
                                      : context.k_24,
                                  height: isRoundTrip && !isMoreOptionVisible
                                      ? context.k_22
                                      : context.k_24,
                                  decoration: BoxDecoration(
                                    color: context.adColors.whiteTextColor,
                                    borderRadius:
                                        BorderRadius.circular(context.k_4),
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(context.k_4),
                                    child: ADCachedImage(
                                      width: isRoundTrip && !isMoreOptionVisible
                                          ? context.k_22
                                          : context.k_24,
                                      height:
                                          isRoundTrip && !isMoreOptionVisible
                                              ? context.k_22
                                              : context.k_24,
                                      imageUrl: flightDisplayInfo.airLineIcon,
                                    ),
                                  ),
                                ).paddingBySide(right: context.k_4),
                                Container(
                                  width: isRoundTrip && !isMoreOptionVisible
                                      ? context.k_22
                                      : context.k_24,
                                  height: isRoundTrip && !isMoreOptionVisible
                                      ? context.k_22
                                      : context.k_24,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe7e7e7),
                                    borderRadius:
                                        BorderRadius.circular(context.k_4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '+$isMultiCarrier',
                                      style: ADTextStyle400.size12.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Image.asset(
                              flightDisplayInfo.airLineIcon,
                              width: isRoundTrip && !isMoreOptionVisible
                                  ? context.k_22
                                  : context.k_24,
                              height: isRoundTrip && !isMoreOptionVisible
                                  ? context.k_22
                                  : context.k_24,
                              fit: BoxFit.fill,
                            ),
                  ],
                ),
                SizedBox(
                  width: isMultiCarrier > 0 ? context.k_6 : context.k_36,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${flightDisplayInfo.flightDepartureTime} - ${flightDisplayInfo.flightArrivalTime}',
                      style: ADTextStyle500.size16.setTextColor(
                        context.adColors.neutralInfoMsg,
                      ),
                    ),
                    if (flightDisplayInfo.journeyDays > 0 &&
                        (isMoreOptionVisible || !isRoundTrip))
                      Text(
                        ' +${flightDisplayInfo.journeyDays}',
                        style: ADTextStyle400.size12.setTextColor(
                          seatLeftColor,
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                ).paddingBySide(
                  left:
                      (isRoundTrip && !isMoreOptionVisible) ? 0 : context.k_12,
                ),
                const Spacer(),
                if (!isRoundTrip || isMoreOptionVisible)
                  Text(
                    FlightUtils.getPriceFormatWithSymbol(
                      price: flightDisplayInfo.price.toDouble(),
                    ),
                    style: ADTextStyle700.size16,
                  ),
              ],
            ),
            SizedBox(
              height: context.k_4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: airlineNameW.sp,
                  child: Text(
                    isMultiCarrier > 0
                        ? 'multiple_airlines'.localize(context)
                        : flightDisplayInfo.airLineName,
                    style: ADTextStyle400.size12
                        .setTextColor(context.adColors.greyTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: context.k_6,
                ),
                if (isRoundTrip && !isMoreOptionVisible)
                  Text(
                    '${flightDisplayInfo.flightDuration} | ${flightDisplayInfo.stops}',
                    style: ADTextStyle400.size12
                        .setTextColor(context.adColors.greyTextColor)
                        .copyWith(letterSpacing: letterSpacing),
                  ).paddingBySide(
                    left: (isRoundTrip && !isMoreOptionVisible)
                        ? 0
                        : context.k_10,
                  )
                else
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: flightDisplayInfo.flightDuration,
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                        TextSpan(
                          text: ' | ',
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                        WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.k_2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: sourceCityCode !=
                                      flightDisplayInfo.departureCity
                                  ? locationCodeStripColor
                                  : Colors.transparent,
                            ),
                            child: Text(
                              flightDisplayInfo.departureCity,
                              style: ADTextStyle400.size12
                                  .setTextColor(
                                    context.adColors.greyTextColor,
                                  )
                                  .copyWith(letterSpacing: letterSpacing),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: SvgPicture.asset(
                            'lib/assets/images/svg/icons/flight/left_arrow.svg',
                            height: context.k_8,
                            color: context.adColors.greyCircleColor,
                          ).paddingBySide(
                            left: context.k_4,
                            right: context.k_4,
                            bottom: context.k_2,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.k_2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: destinationCityCode !=
                                      flightDisplayInfo.arrivalCity
                                  ? locationCodeStripColor
                                  : Colors.transparent,
                            ),
                            child: Text(
                              flightDisplayInfo.arrivalCity,
                              style: ADTextStyle400.size12
                                  .setTextColor(
                                    context.adColors.greyTextColor,
                                  )
                                  .copyWith(letterSpacing: letterSpacing),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ' | ',
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                        TextSpan(
                          text: flightDisplayInfo.stops,
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                      ],
                    ),
                  ).paddingBySide(left: context.k_12),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // if (!isRoundTrip &&
                    //     seatLeft > 0 &&
                    //     seatLeft <= (maxSeatThreshold ?? 0))
                    if ((!isRoundTrip ||
                            (isRoundTrip && isMoreOptionVisible)) &&
                        isSeatLeftVisible)
                      Text(
                        seatLeft == 1
                            ? '$seatLeft ${'label_seat_left'.localize(context)}'
                            : '$seatLeft ${'label_seats_left'.localize(context)}',
                        style:
                            ADTextStyle400.size12.setTextColor(seatLeftColor),
                      ).paddingBySide(
                        bottom:
                            !isRoundTrip && isSeatLeftVisible ? context.k_8 : 0,
                      ),
                    if (innerListLength.length > 1 &&
                        isMoreOptionVisible &&
                        ((isRoundTrip && !isSeatLeftVisible) || !isRoundTrip))
                      Text(
                        'more_options'.localize(context),
                        style: ADTextStyle400.size12
                            .setTextColor(context.adColors.black)
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (isRoundTrip && isReturnFlightVisible)
                      SizedBox(
                        width: context.k_56,
                      ),
                    if (isRoundTrip && isReturnFlightVisible)
                      Text(
                        '${innerFlightListItem?.returnFlightDetail.flightDepartureTime} - ${innerFlightListItem?.returnFlightDetail.flightArrivalTime}',
                        style: ADTextStyle500.size16.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                    if (isRoundTrip &&
                        isReturnFlightVisible &&
                        (innerFlightListItem?.internationReturnDisplayInfo
                                    ?.journeyDays ??
                                0) >
                            0)
                      Text(
                        ' +${innerFlightListItem?.internationReturnDisplayInfo?.journeyDays}',
                        style: ADTextStyle400.size12.setTextColor(
                          seatLeftColor,
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    const Spacer(),
                    if (innerListLength.length > 1 &&
                        isMoreOptionVisible &&
                        isRoundTrip &&
                        isSeatLeftVisible)
                      Text(
                        'more_options'.localize(context),
                        style: ADTextStyle400.size12
                            .setTextColor(context.adColors.black)
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                  ],
                ),
                if (isRoundTrip && isReturnFlightVisible)
                  SizedBox(
                    height: isRoundTrip ? context.k_8 : context.k_10,
                  ),
                if (isRoundTrip && isReturnFlightVisible)
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FlightUtils.durationToString(
                            innerFlightListItem
                                    ?.returnFlightDetail.flightDuration ??
                                0,
                          ),
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                        TextSpan(
                          text: ' | ',
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                        WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.k_2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: destinationCityCode !=
                                      innerFlightListItem?.returnFlightDetail
                                          .flightDepartureCityCode
                                  ? locationCodeStripColor
                                  : Colors.transparent,
                            ),
                            child: Text(
                              '${innerFlightListItem?.returnFlightDetail.flightDepartureCityCode}',
                              style: ADTextStyle400.size12
                                  .setTextColor(
                                    context.adColors.greyTextColor,
                                  )
                                  .copyWith(letterSpacing: letterSpacing),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: SvgPicture.asset(
                            'lib/assets/images/svg/icons/flight/left_arrow.svg',
                            height: context.k_8,
                            color: context.adColors.greyCircleColor,
                          ).paddingBySide(
                            right: context.k_4,
                            left: context.k_4,
                            bottom: context.k_2,
                          ),
                        ),
                        WidgetSpan(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.k_2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: sourceCityCode !=
                                      innerFlightListItem?.returnFlightDetail
                                          .flightArrivalCityCode
                                  ? locationCodeStripColor
                                  : Colors.transparent,
                            ),
                            child: Text(
                              '${innerFlightListItem?.returnFlightDetail.flightArrivalCityCode}',
                              style: ADTextStyle400.size12
                                  .setTextColor(
                                    context.adColors.greyTextColor,
                                  )
                                  .copyWith(letterSpacing: letterSpacing),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ' | ',
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                        TextSpan(
                          text: FlightUtils.numberOFStops(
                            innerFlightListItem?.returnFlightDetail.stops ?? 0,
                          ),
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                      ],
                    ),
                  ).paddingBySide(
                    left: context.k_56,
                  ),
              ],
            ).paddingBySide(
              top: isRoundTrip && isReturnFlightVisible ? context.k_18 : 0,
              left: isRoundTrip && isReturnFlightVisible ? context.k_16 : 0,
            ),
            if (isRoundTrip && !isReturnFlightVisible)
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.k_2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: isReturnTrip
                              ? destinationCityCode !=
                                      innerFlightListItem?.returnFlightDetail
                                          .flightDepartureCityCode
                                  ? locationCodeStripColor
                                  : Colors.transparent
                              : sourceCityCode !=
                                      flightDisplayInfo.departureCity
                                  ? locationCodeStripColor
                                  : Colors.transparent,
                        ),
                        child: Text(
                          isReturnTrip
                              ? '${innerFlightListItem?.returnFlightDetail.flightDepartureCityCode}'
                              : flightDisplayInfo.departureCity,
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: SvgPicture.asset(
                        'lib/assets/images/svg/icons/flight/left_arrow.svg',
                        height: context.k_8,
                        color: context.adColors.greyCircleColor,
                      ).paddingBySide(
                        right: context.k_4,
                        left: context.k_4,
                        bottom: context.k_2,
                      ),
                    ),
                    WidgetSpan(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.k_2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: isReturnTrip
                              ? sourceCityCode !=
                                      innerFlightListItem?.returnFlightDetail
                                          .flightArrivalCityCode
                                  ? locationCodeStripColor
                                  : Colors.transparent
                              : destinationCityCode !=
                                      flightDisplayInfo.arrivalCity
                                  ? locationCodeStripColor
                                  : Colors.transparent,
                        ),
                        child: Text(
                          isReturnTrip
                              ? '${innerFlightListItem?.returnFlightDetail.flightArrivalCityCode}'
                              : flightDisplayInfo.arrivalCity,
                          style: ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(letterSpacing: letterSpacing),
                        ),
                      ),
                    ),
                  ],
                ),
              ).paddingBySide(left: leftSidePadding, top: context.k_4),
            if (isRoundTrip && !isReturnFlightVisible && isSeatLeftVisible)
              Text(
                seatLeft == 1
                    ? '$seatLeft ${'label_seat_left'.localize(context)}'
                    : '$seatLeft ${'label_seats_left'.localize(context)}',
                style: ADTextStyle400.size12.setTextColor(seatLeftColor),
              ).paddingBySide(left: leftSidePadding, top: context.k_4),
          ],
        ),
      ),
    );
  }
}
