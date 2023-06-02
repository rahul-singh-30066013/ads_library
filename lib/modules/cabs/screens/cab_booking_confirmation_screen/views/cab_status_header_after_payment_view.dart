/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/cab_util.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/cab_booking_order_status.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:float_column/float_column.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabStatusHeaderAfterPaymentView extends StatelessWidget {
  const CabStatusHeaderAfterPaymentView({
    Key? key,
    required this.otp,
    required this.isKiosk,
  }) : super(key: key);

  final String otp;
  final bool isKiosk;

  @override
  Widget build(BuildContext context) {
    final double imageWidth = 100.sp;
    final double imageHeight = 100.sp;
    const double letterSpacing = 0.17;
    const double lineHeight = 1.5;

    adLog('Widget build', className: this);
    final double positionedTopPadding = 28.sp;

    final cabBookingConfirmationState =
        context.read<CabBookingConfirmationState>();
    final CabBookingOrderStatus cabBookingOrderStatus =
        cabBookingConfirmationState.cabBookingOrderStatus;
    final millis = cabBookingConfirmationState
            .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
        0;
    final date = CabUtil.dateConverter(
      DateTime.fromMillisecondsSinceEpoch(millis * 1000),
    );

    String getInfoText() {
      String infoText = '';
      if ((cabBookingOrderStatus == CabBookingOrderStatus.scheduled ||
              cabBookingOrderStatus == CabBookingOrderStatus.confirmed) &&
          otp.isNotEmpty &&
          !isKiosk) {
        infoText =
            'share_otp_with_the_driver_to_start_the_trip'.localize(context);
      }
      if ((cabBookingOrderStatus == CabBookingOrderStatus.scheduled ||
              cabBookingOrderStatus == CabBookingOrderStatus.confirmed) &&
          otp.isEmpty &&
          !isKiosk) {
        infoText =
            '${'your'.localize(context)} ${'cab_has_been_booked'.localize(context)}';
      }
      if ((cabBookingOrderStatus == CabBookingOrderStatus.scheduled ||
              cabBookingOrderStatus == CabBookingOrderStatus.confirmed) &&
          otp.isNotEmpty &&
          isKiosk) {
        infoText = 'otp_for_this_booking'.localize(context);
      }

      if (cabBookingOrderStatus == CabBookingOrderStatus.cancelled) {
        infoText =
            '${'your'.localize(context)} ${'cab_has_been_cancelled'.localize(context)}';
      }
      if (cabBookingOrderStatus == CabBookingOrderStatus.pending) {
        infoText =
            'It_will_take_us_up_to_10_minutes_to_share_your_booking_status.'
                .localize(context);
      }
      if (cabBookingOrderStatus == CabBookingOrderStatus.failed) {
        infoText = 'your_make_my_trip_cab_has_been_failed.'.localize(context);
      }

      if ((cabBookingOrderStatus == CabBookingOrderStatus.cancelled) &&
          (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.bookingInfo?.isAutoCancelled ??
              false)) {
        infoText =
            '${'your'.localize(context)} ${'cab_has_been_auto_cancelled_as_ride_didnt_start_within'.localize(context)}';
      }
      return infoText;
    }

    final infoText = getInfoText();

    return SafeArea(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.k_16),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.k_48.sp + context.k_2.sp,
                ),
                Text(
                  cabBookingOrderStatus == CabBookingOrderStatus.confirmed
                      ? 'booking_confirmation_message'.localize(context)
                      : cabBookingOrderStatus == CabBookingOrderStatus.scheduled
                          ? '${'booking_scheduled_for'.localize(context)} $date'
                          : cabBookingOrderStatus ==
                                  CabBookingOrderStatus.pending
                              ? 'cab_booking_pending'.localize(context)
                              : cabBookingOrderStatus ==
                                      CabBookingOrderStatus.failed
                                  ? 'booking_failed!'.localize(context)
                                  : 'booking_cancelled'.localize(context),
                  style: ADTextStyle700.size24.setTextColor(
                    cabBookingOrderStatus == CabBookingOrderStatus.pending
                        ? context.adColors.blackTextColor
                        : context.adColors.whiteTextColor,
                  ),
                ).paddingBySide(bottom: context.k_12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: infoText,
                              style: ADTextStyle400.size14,
                              children: [
                                TextSpan(
                                  text: ((cabBookingOrderStatus ==
                                              CabBookingOrderStatus
                                                  .cancelled) &&
                                          (cabBookingConfirmationState
                                                  .cabOrderDetailResponseModel
                                                  ?.bookingInfo
                                                  ?.isAutoCancelled ??
                                              false))
                                      ? '${cabBookingConfirmationState.cabOrderDetailResponseModel?.bookingInfo?.autoCancelledTime} ${'from_pickup_time'.localize(context)}'
                                      : '',
                                  style: ADTextStyle700.size14.copyWith(
                                    color: context.adColors.whiteTextColor,
                                  ),
                                ),
                              ],
                            ).copyWith(
                              style: TextStyle(
                                letterSpacing: letterSpacing,
                                height: lineHeight,
                                color: cabBookingOrderStatus ==
                                        CabBookingOrderStatus.pending
                                    ? context.adColors.blackTextColor
                                    : context.adColors.whiteTextColor,
                              ),
                            ),
                          ).paddingBySide(
                            right: cabBookingOrderStatus ==
                                    CabBookingOrderStatus.cancelled
                                ? context.k_64 + context.k_32
                                : 0,
                          ),
                          if (cabBookingOrderStatus ==
                                  CabBookingOrderStatus.confirmed ||
                              (cabBookingOrderStatus ==
                                      CabBookingOrderStatus.scheduled &&
                                  otp.isNotEmpty))
                            SizedBox(
                              height: context.k_40,
                              child: ListView.separated(
                                separatorBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  return SizedBox(
                                    width: context.k_8,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: otp.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: context.k_32,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment(0.5, 0),
                                        end: Alignment(0.5, 1),
                                        colors: [
                                          Color(0xffffe63e),
                                          Color(0xfff2b200),
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        otp[index].toString(),
                                        style:
                                            ADTextStyle700.size22.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ).paddingBySide(top: context.k_15),
                        ],
                      ),
                    ),
                    if (cabBookingOrderStatus !=
                            CabBookingOrderStatus.cancelled &&
                        cabBookingOrderStatus !=
                            CabBookingOrderStatus.pending &&
                        cabBookingOrderStatus != CabBookingOrderStatus.failed)
                      Lottie.asset(
                        'lib/assets/gif/lottie/car_confirmation_animation.json',
                        width: imageWidth,
                        // height: imageHeight,
                      ),
                  ],
                ),
                /* SizedBox(
                  height: context.k_24,
                ),*/
              ],
            ),
          ),
          if (cabBookingOrderStatus == CabBookingOrderStatus.cancelled ||
              cabBookingOrderStatus == CabBookingOrderStatus.pending ||
              cabBookingOrderStatus == CabBookingOrderStatus.failed)
            Positioned(
              top: positionedTopPadding,
              right: 0,
              child: SafeArea(
                child: Lottie.asset(
                  cabBookingOrderStatus == CabBookingOrderStatus.pending
                      ? 'lib/assets/gif/lottie/booking_partially_cancelled.json'
                      : 'lib/assets/gif/lottie/booking_cancelled.json',
                  width: imageWidth,
                  height: imageHeight,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
