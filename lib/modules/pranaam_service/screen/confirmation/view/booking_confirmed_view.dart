/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/confirmation_gif_align_value.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_order_status.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_name.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

final double imageWidth = 130.sp;
final double imageHeight = 130.sp;
const int flexValue = 3;
final double bottomMargin = 260.sp;
final double bottomMarginRoundTrip = 285.sp;

class BookingConfirmedView extends StatefulWidget {
  /// this is used to draw the booking confirmed banner.
  ///
  /// BookingConfirmedView(
  ///                 title: 'title',
  ///                 subTitle: ' subTitle',
  ///                 email: 'email',
  ///               )
  const BookingConfirmedView({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.phoneNumber,
    required this.email,
    required this.state,
    required this.pranaamBookingType,
    required this.isRoundTrip,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.lotte,
    required this.confirmationGifAlignValue,
    required this.orderStatusString,
    required this.countryDialCode,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String phoneNumber;
  final String email;
  final String pranaamBookingType;
  final PranaamConfirmationController state;
  final bool isRoundTrip;
  final Color backgroundColor;
  final Color foregroundColor;
  final String lotte;
  final ConfirmationGifAlignValue confirmationGifAlignValue;
  final String orderStatusString;
  final String countryDialCode;

  @override
  State<BookingConfirmedView> createState() => _BookingConfirmedViewState();
}

class _BookingConfirmedViewState extends State<BookingConfirmedView> {
  @override
  void initState() {
    final getBookingDetailsState = context.read<BookingAndCancellationState>();
    if (isStandAloneService(
      getBookingDetailsState.bookingDetailsResponse?.orderDetail?.pranaamDetail
              ?.pranaamBookingType ??
          '',
    )) {
      if ((getBookingDetailsState.bookingDetailsResponse?.orderDetail
                  ?.pranaamDetail?.pranaamBookingType ??
              '') ==
          porterBookingType) {
        ScreenEvents.porter_confirmation_screen.log();
      } else if ((getBookingDetailsState.bookingDetailsResponse?.orderDetail
                  ?.pranaamDetail?.pranaamBookingType ??
              '') ==
          wheelChairBookingType) {
        ScreenEvents.wheel_chair_confirmation_screen.log();
      }
      StandAloneGaAnalytics().paymentEcommerceEvent(
        context,
        StandAloneGaName(context).bookSuccessName(),
      );
      StandAloneGaAnalytics().paymentEvent(
        context,
        ClickEvents.purchase,
      );
    } else {
      ScreenEvents.pranaam_confirmation_screen.log();
      PranaamBookingGaAnalytics().ecommerceEventConfirmation(
        ClickEvents.purchase,
        context.read<PranaamAppDataStateManagement>(),
        getBookingDetailsState,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final double rightPadding = 120.sp;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              //todo make method for margin
              margin: PranaamOrderStatus.isPending(widget.orderStatusString) ||
                      PranaamOrderStatus.getStatus(
                            widget.orderStatusString,
                          ) ==
                          PranaamOrderStatus.FAILED
                  ? EdgeInsets.zero
                  : EdgeInsets.only(
                      bottom: widget.isRoundTrip
                          ? bottomMarginRoundTrip
                          : bottomMargin,
                    ),
              padding: EdgeInsets.symmetric(horizontal: context.k_16),
              width: double.infinity,
              color: widget.backgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: flexValue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: ADTextStyle700.size24
                              .setTextColor(widget.foregroundColor),
                        ),
                        SizedBox(
                          height: context.k_10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.subTitle,
                                style: ADTextStyle400.size14
                                    .setTextColor(widget.foregroundColor),
                              ),
                              TextSpan(
                                text:
                                    ' ${widget.email}${'and'.localize(context)}',
                                style: ADTextStyle400.size14
                                    .setTextColor(widget.foregroundColor),
                              ),
                              TextSpan(
                                text: 'sms_sent_to'.localize(context),
                                style: ADTextStyle400.size14
                                    .setTextColor(widget.foregroundColor),
                              ),
                              TextSpan(
                                text:
                                    '${'${widget.countryDialCode}-${widget.phoneNumber}'}.',
                                style: ADTextStyle500.size14
                                    .setTextColor(widget.foregroundColor),
                              ),
                            ],
                          ),
                        ).paddingBySide(
                          right: rightPadding,
                        ),
                        SizedBox(
                          height: context.k_48,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: widget.confirmationGifAlignValue.top,
              bottom: widget.confirmationGifAlignValue.bottom,
              right: widget.confirmationGifAlignValue.right,
              child: Lottie.asset(
                widget.lotte,
                width: imageWidth,
                height: imageHeight,
                repeat: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
