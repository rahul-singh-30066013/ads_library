/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/flight_review_detail_item_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/cached_image/ad_cached_image.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class HeaderDialog extends StatelessWidget {
  final double iconHeight = 130.sp;
  final double iconWidth = 130.sp;
  final double closeIconSize = 16.sp;
  final int maxLinesForText = 2;
  final double letterSpacing = 0.3;
  final double subtitleRightPadding = 120.sp;
  final String orderStatus;

  final String emailId;
  final String phoneNumber;
  final bool isForBookingConfirmationScreen;
  final String? bookingConfirmationMessage;
  final String? bookingDetailMessage;
  final Color? backgroundColor;

  final double lineHeight = 1.5;
  final double partiallyCancelledOpacity = 0.8;

  HeaderDialog({
    Key? key,
    required this.emailId,
    required this.phoneNumber,
    this.isForBookingConfirmationScreen = false,
    this.bookingConfirmationMessage,
    this.backgroundColor,
    this.bookingDetailMessage,
    required this.orderStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: backgroundColor?.withOpacity(
      //       orderStatus == 'Partially Cancelled'
      //           ? partiallyCancelledOpacity
      //           : 1,
      //     ) ??
      //     context.adColors.greenColor,
      color: (orderStatus == 'PENDING' || orderStatus == 'Partially Cancelled')
          ? backgroundColor?.withOpacity(
              partiallyCancelledOpacity,
            )
          : backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.topRight,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // GestureDetector(
                //   onTap: () => isForBookingConfirmationScreen
                //       ? navigateUsingPushNamedAndRemoveUntil(
                //           context,
                //           flightBooking,
                //           ModalRoute.withName(tabRoute),
                //         )
                //       : navigatorPopScreenUntil(
                //           context,
                //           ModalRoute.withName(flightBooking),
                //         ),
                //   child: SizedBox(
                //     width: context.k_16,
                //     height: context.k_16,
                //     child: SvgPicture.asset(
                //       SvgAssets.closingIcon,
                //     ),
                //   ).paddingBySide(bottom: context.k_8),
                // ),
                SizedBox(
                  height: context.k_26,
                ),
                Text(
                  bookingConfirmationMessage ??
                      'booking_confirmation_message'.localize(context),
                  maxLines: maxLinesForText,
                  overflow: TextOverflow.ellipsis,
                  style: ADTextStyle700.size26
                      .setTextColor(
                        orderStatus == 'Partially Cancelled'
                            ? context.adColors.blackTextColor
                            : context.adColors.whiteTextColor,
                      )
                      .copyWith(letterSpacing: -letterSpacing),
                ).paddingBySide(
                  top: context.k_8,
                  bottom: context.k_2,
                ),
                // Text(
                //   'booking_confirmation_message_description'
                //       .localize(context)
                //       .replaceFirst('#-emailId-#', emailId)
                //       .replaceFirst('#-phoneNumber-#', phoneNumber),
                //   overflow: TextOverflow.clip,
                //   style: ADTextStyle500.size16
                //       .setTextColor(context.adColors.whiteTextColor),
                // ).paddingBySide(
                //   top: context.k_4,
                //   bottom: context.k_8,
                //   // right: context.k_38,
                // ),
                RichText(
                  text: TextSpan(
                    style: ADTextStyle400.size14
                        .setTextColor(
                          orderStatus == 'Partially Cancelled'
                              ? context.adColors.blackTextColor
                              : context.adColors.whiteTextColor,
                        )
                        .setFontHeight(lineHeight),
                    children: [
                      if (orderStatus == 'PENDING')
                        const TextSpan(
                          text:
                              'It will take us up to 10 minutes to share your booking status.',
                        )
                      else
                        const TextSpan(text: ''),
                      TextSpan(
                        text: bookingDetailMessage ??
                            '${'ticket_emailed_to'.localize(context)}\n',
                      ),
                      TextSpan(
                        text: '$emailId ${'and'.localize(context).trim()}\n',
                      ),
                      TextSpan(
                        text: '${'sms_sent_to'.localize(context)} $phoneNumber',
                      ),
                    ],
                  ),
                ).paddingBySide(
                  top: context.k_8,
                  // bottom: context.k_20,
                ),
              ],
            ).paddingBySide(right: subtitleRightPadding),
            SizedBox(
              width: context.k_8,
            ),
            // icon-booking_confirmation_tick.png
            Positioned(
              right: FlightUtils.getConfirmationGifAlignValueLottie(orderStatus)
                  .right,
              bottom:
                  FlightUtils.getConfirmationGifAlignValueLottie(orderStatus)
                      .bottom,
              top: FlightUtils.getConfirmationGifAlignValueLottie(orderStatus)
                  .top,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: iconHeight,
                width: iconWidth,
                child: Lottie.asset(
                  FlightUtils.getBookingStatusTypeLottie(orderStatus),
                  width: iconWidth,
                  height: iconHeight,
                  alignment: Alignment.bottomCenter,
                  repeat: true,
                ),
              ),
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          top: context.k_16,
          // bottom: context.k_16,
        ),
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  final String mobileNumber;
  final String emailId;

  const ContactDetails({
    Key? key,
    required this.mobileNumber,
    required this.emailId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
            Text(
              'contact_details'.localize(context),
              style: ADTextStyle700.size22
                  .setTextColor(context.adColors.neutralInfoMsg),
            ).paddingBySide(bottom: context.k_10),
          ] +
          {'mobile_number': mobileNumber, 'email_id': emailId}
              .entries
              .map(
                (element) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      element.key.localize(context),
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.darkGreyTextColor,
                      ),
                    ).paddingBySide(
                      bottom: context.k_4,
                    ),
                    Text(
                      element.value,
                      style: ADTextStyle600.size16.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                  ],
                ).paddingBySide(bottom: context.k_10, top: context.k_10),
              )
              .toList(),
    );
  }
}

class PassengerDetail extends StatelessWidget {
  final String passengerName;
  final String passengerType;
  final String? status;
  final String? ticketNo;
  final bool? isInternational;

  const PassengerDetail({
    Key? key,
    required this.passengerName,
    required this.passengerType,
    this.status,
    this.ticketNo = '',
    this.isInternational,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int defaultFlex = 35;
    const double statusFontSize = 11;
    const double statusOpacity = 0.07;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (passengerName.length > defaultFlex)
              Expanded(
                child: Text(
                  passengerName,
                  style: (status != BookingStatusType.Q.name &&
                          status != BookingStatusType.F.name)
                      ? ADTextStyle600.size16.setTextColor(
                          context.adColors.neutralInfoMsg,
                        )
                      : ADTextStyle600.size16
                          .setTextColor(
                            context.adColors.neutralInfoMsg,
                          )
                          .copyWith(decoration: TextDecoration.lineThrough),
                ),
              )
            else
              Text(
                passengerName,
                style: (status != BookingStatusType.Q.name &&
                        status != BookingStatusType.F.name)
                    ? ADTextStyle600.size16.setTextColor(
                        context.adColors.neutralInfoMsg,
                      )
                    : ADTextStyle600.size16
                        .setTextColor(
                          context.adColors.neutralInfoMsg,
                        )
                        .copyWith(decoration: TextDecoration.lineThrough),
              ),
            Text(
              passengerType.localize(context),
              style: (status != BookingStatusType.Q.name &&
                      status != BookingStatusType.F.name)
                  ? ADTextStyle400.size12.setTextColor(
                      context.adColors.greyTextColor,
                    )
                  : ADTextStyle400.size12
                      .setTextColor(
                        context.adColors.greyTextColor,
                      )
                      .copyWith(decoration: TextDecoration.lineThrough),
              textAlign: TextAlign.right,
            ).paddingBySide(left: context.k_8),
            if (status != null) const Spacer(),
            if (status != null)
              /*Container(
                padding: EdgeInsets.only(
                  left: context.k_10,
                  right: context.k_10,
                  top: context.k_2,
                  bottom: context.k_2,
                ),
                decoration: BoxDecoration(
                  color: getColorAsPerType(status ?? '', context)
                      .withOpacity(statusOpacity),
                  borderRadius: BorderRadius.circular(context.k_12),
                ),
                child: Text(
                  FlightUtils.getBookingStatusType(
                    status ?? '',
                  ).localize(context).toUpperCase(),
                  style: ADTextStyle700.size14
                      .setTextColor(
                        getColorAsPerType(status ?? '', context),
                      )
                      .copyWith(fontSize: statusFontSize),
                ),
              ),*/
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.k_8,
                  vertical: context.k_4,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: FlightUtils.getBookingStatusTypeColor(
                    status ?? '',
                    context,
                  ).withOpacity(statusOpacity),
                ),
                child: Text(
                  FlightUtils.getBookingStatusType(
                    status ?? '',
                  ).localize(context).toUpperCase(),
                  style: ADTextStyle500.size16
                      .setTextColor(
                        getColorAsPerType(status ?? '', context),
                      )
                      .setFontSize(
                        statusFontSize,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            /* Text(
                FlightUtils.getBookingStatusType(
                  status ?? '',
                ).localize(context),
                style: ADTextStyle500.size14.setTextColor(
                  getColorAsPerType(status ?? '', context),
                ),
              ),*/
          ],
        ),
        if ((ticketNo ?? '').isNotEmpty && isInternational == true)
          Text(
            '${'label_e_ticket_no'.localize(context)}$ticketNo',
            style: status != BookingStatusType.Q.name
                ? ADTextStyle400.size12.setTextColor(
                    context.adColors.greyTextColor,
                  )
                : ADTextStyle400.size12
                    .setTextColor(
                      context.adColors.greyTextColor,
                    )
                    .copyWith(decoration: TextDecoration.lineThrough),
          ).paddingBySide(
            top: context.k_8,
          ),
      ],
    );
  }

  Color getColorAsPerType(String status, BuildContext context) {
    if (status.isEmpty) {
      return context.adColors.greenColor;
    } else if (status == BookingStatusType.Q.name ||
        status == BookingStatusType.K.name) {
      return const Color(0xffdc464b);
    } else if (status == BookingStatusType.H.name) {
      return const Color(0xffeb9845);
    } else if (status == BookingStatusType.F.name) {
      return const Color(0xffdc464b);
    } else {
      return context.adColors.greenColor;
    }
  }
}

class TextComponent extends StatelessWidget {
  final String title;
  final String value;

  const TextComponent({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.localize(context).toUpperCase(),
          style: ADTextStyle500.size14
              .setTextColor(context.adColors.greyTextColor),
          overflow: TextOverflow.ellipsis,
        ).paddingBySide(
          bottom: context.k_4,
        ),
        Text(
          value,
          style: ADTextStyle500.size16.setTextColor(
            const Color(0xff484848),
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class FlightDetails extends StatelessWidget {
  final double seperatorRadius = 2;
  static const double airlineLogoRadius = 16;
  final double seperatorSpacing = 5;
  final int maxLinesForAirportName = 3;
  final double flightDurationIconWidth = 76.sp;
  final FlightViewTripResponseModel flightBookingResponseModel;
  final double reviewFontSize = 15;

  FlightDetails({Key? key, required this.flightBookingResponseModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlightReviewDetailModel? flightReviewDetailModel =
        flightBookingResponseModel.flightReviewDetailModel;
    final List<FlightReviewDetailInfo> flightReviewDetailInfo =
        flightReviewDetailModel?.flightReviewDetailInfo ?? [];
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: flightReviewDetailInfo.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final FlightReviewDetailInfo flightReviewDetailInfoItem =
              flightReviewDetailInfo[index];
          final PassengerJourneyInfo? passengerJourneyInfo =
              flightReviewDetailInfoItem.passengerJourneyInfo;
          final List<JourneyFlightDetails> journeyFlightDetails =
              flightReviewDetailInfoItem.journeyFlightDetails ?? [];
          final List<FlightBaggageDetails> flightBaggageDetails =
              flightReviewDetailInfoItem.flightBaggageDetails ?? [];
          final String travelType =
              flightReviewDetailInfoItem.passengerJourneyInfo?.travelClass ??
                  '';
          return Column(
            children: [
              // summary
              Container(
                decoration: BoxDecoration(
                  color: context.adColors.containerGreyBg,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          flightReviewDetailInfoItem
                                  .passengerJourneyInfo?.fromLocation ??
                              '',
                          style: ADTextStyle700.size18.setTextColor(
                            context.adColors.neutralInfoMsg,
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.flight,
                            size: context.k_18,
                            color: context.adColors.greyCircleColor,
                          ),
                        ).paddingBySide(
                          left: context.k_8,
                          right: context.k_8,
                        ),
                        Text(
                          flightReviewDetailInfoItem
                                  .passengerJourneyInfo?.toLocation ??
                              '',
                          style: ADTextStyle700.size18.setTextColor(
                            context.adColors.neutralInfoMsg,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.k_6,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${passengerJourneyInfo?.stoppage ?? ''} • ',
                          style: ADTextStyle400.size14.setTextColor(
                            context.adColors.greyTextColor,
                          ),
                        ),
                        Text(
                          // '02h 20m • ',
                          passengerJourneyInfo?.journeyDuration ?? '',
                          style: ADTextStyle400.size14.setTextColor(
                            context.adColors.greyTextColor,
                          ),
                        ),
                        if (travelType.isNotEmpty)
                          Text(
                            ' • ${travelType.localize(context)}',
                            style: ADTextStyle400.size14.setTextColor(
                              context.adColors.greyTextColor,
                            ),
                          ),
                      ],
                    ),
                  ],
                ).paddingAllSide(context.k_16),
              ),
              // details
              SizedBox(
                height: context.k_20,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: journeyFlightDetails.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final JourneyFlightDetails journeyFlightDetailsItems =
                      journeyFlightDetails[index];
                  // final FlightSegment flightData = flightSegment[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.k_32,
                            height: context.k_32,
                            child: ADCachedImage(
                              imageUrl: journeyFlightDetailsItems.airLineIcon,
                              placeHolderSize: context.k_32,
                            ),
                          ),
                          ADSizedBox(
                            width: context.k_4,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  style: ADTextStyle600.size14,
                                  text:
                                      '  ${journeyFlightDetailsItems.airLineName}',
                                ),
                                TextSpan(
                                  style: ADTextStyle400.size14,
                                  text:
                                      '  ${journeyFlightDetailsItems.airLineNumber}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      FlightReviewDetailItemView(
                        journeyFlightDetailsItems: journeyFlightDetailsItems,
                        newFontSize: reviewFontSize,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          indent: 20,
                          endIndent: 10,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        passengerJourneyInfo?.stoppage == '0'
                            ? ''
                            : '${'layover'.localize(context)}: ${journeyFlightDetails[index].flightLayoverDuration}',
                        style: ADTextStyle400.size12.setTextColor(
                          context.adColors.greyTextColor,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          indent: 10,
                          endIndent: 20,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_56,
                    right: context.k_56,
                    top: context.k_20,
                    bottom: context.k_20,
                  );
                },
              ),
              SizedBox(
                height: context.k_20,
              ),
              Container(
                color: context.adColors.tileBorderColor,
                height: 1,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: flightBaggageDetails.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final FlightBaggageDetails flightCabinBaggageData =
                      flightBaggageDetails[index];
                  return Row(
                    children: [
                      Text(
                        'baggage'.localize(context),
                        style: ADTextStyle500.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      SizedBox(
                        width: context.k_8,
                      ),
                      Text(
                        'T&Cs',
                        style: ADTextStyle600.size12
                            .setTextColor(context.adColors.blackTextColor)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            flightCabinBaggageData.checkInBaggageWeight,
                            style: ADTextStyle600.size16
                                .setTextColor(context.adColors.blackTextColor),
                          ),
                          Text(
                            'checkIn'.localize(context),
                            style: ADTextStyle500.size12
                                .setTextColor(context.adColors.greyTextColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: context.k_24,
                      ),
                      Column(
                        children: [
                          Text(
                            flightCabinBaggageData.cabinBaggageWeight,
                            style: ADTextStyle600.size16
                                .setTextColor(context.adColors.blackTextColor),
                          ),
                          Text(
                            'cabin'.localize(context),
                            style: ADTextStyle500.size12
                                .setTextColor(context.adColors.greyTextColor),
                          ),
                        ],
                      ),
                    ],
                  ).paddingBySide(
                    top: context.k_12,
                    bottom: context.k_12,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: context.adColors.tileBorderColor,
                    thickness: 1,
                  );
                },
              ),
              SizedBox(
                height: context.k_10,
              ),
              Container(
                color: context.adColors.tileBorderColor,
                height: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
