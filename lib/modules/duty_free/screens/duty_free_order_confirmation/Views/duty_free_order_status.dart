/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_ad_time_line/duty_free_ad_time_line.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

class DutyFreeOrderStatus extends StatelessWidget {
  const DutyFreeOrderStatus({Key? key}) : super(key: key);

  /// TODO Add color to Styleguide
  static const Color orangeColor = Color(0xffe67225);
  static const Color redColor = Color(0xffe3463b);

  @override
  Widget build(BuildContext context) {
    return Consumer<DutyFreeOrderState>(
      builder: (BuildContext context, dutyFreeOrderState, Widget? child) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                  ?.statusHistory?.length ??
              0,
          itemBuilder: (BuildContext context, int index) {
            // final parsedDate = DateTime.parse(
            //   dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
            //           ?.overallStatus.statusHistory[index].modifiedOn ??
            //       '',
            // );
            // final currentDateFormat =
            //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
            // final currentDate =
            //     DateTime.parse(currentDateFormat.format(DateTime.now()));
            // final dateDifference = parsedDate.difference(currentDate).inDays;
            return InkWell(
              onTap: () => {
                adLog('order_placed'),
              },
              child: DutyFreeADTimeLine(
                mainTextStyle: setTextStyle(
                  context,
                  dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                          ?.statusHistory?[index].orderStatus ??
                      '',
                  isFullFilled: dutyFreeOrderState
                              .dutyFreeCancelOrderDetailsResponseModel
                              ?.statusHistory?[index]
                              .orderStatus
                              ?.toLowerCase() ==
                          'fulfilled' ||
                      dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                              ?.statusHistory?[index].orderStatus
                              ?.toLowerCase() ==
                          'part_fulfilled',
                ),
                subTextStyle: ADTextStyle400.size12,
                descriptionTextStyle: ADTextStyle400.size12,
                nodeColor: setColor(
                  context,
                  dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                          ?.statusHistory?[index].orderStatus ??
                      '',
                  isFullFilled: dutyFreeOrderState
                              .dutyFreeCancelOrderDetailsResponseModel
                              ?.statusHistory?[index]
                              .orderStatus
                              ?.toLowerCase() ==
                          'fulfilled' ||
                      dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                              ?.statusHistory?[index].orderStatus
                              ?.toLowerCase() ==
                          'part_fulfilled',
                ),
                mainText: dutyFreeOrderState
                        .dutyFreeCancelOrderDetailsResponseModel
                        ?.statusHistory?[index]
                        .status ??
                    '',
                subText: '${'on'.localize(context)} ${dateTimeFormatter(
                  dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                          ?.statusHistory?[index].createdOn
                          .toString() ??
                      '',
                )}',
                status: true,
                isDashedLine: false,
                index: 1,
                timelineSize: context.k_28.toInt(),
                pathColor: (dutyFreeOrderState
                                    .dutyFreeCancelOrderDetailsResponseModel
                                    ?.statusHistory
                                    ?.length ??
                                0) -
                            1 ==
                        index
                    ? context.adColors.transparentColor
                    : context.adColors.greyCircleColor,
                orderStatus: dutyFreeOrderState
                        .dutyFreeCancelOrderDetailsResponseModel
                        ?.statusHistory?[index]
                        .orderStatus ??
                    '',
                flightNo:
                    '${'flight'.localize(context)} ${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.passengerDetail.first.flightNo ?? ''}',
                orderLastStatus: dutyFreeOrderState
                        .dutyFreeCancelOrderDetailsResponseModel
                        ?.statusHistory
                        ?.last
                        .status ??
                    '',
                description: dutyFreeOrderState
                    .dutyFreeCancelOrderDetailsResponseModel
                    ?.statusHistory?[index]
                    .description,
              ),
            );
          },
        );
      },
    );
  }

  Color setColor(
    BuildContext context,
    String type, {
    required bool isFullFilled,
  }) {
    if (type.toLowerCase() == 'booked' ||
        type.toLowerCase() == 'placed' ||
        type.toLowerCase() == 'confirmed') {
      return context.adColors.greenColor;
    } else if (type.toLowerCase() == 'cancelled' ||
        type.toLowerCase() == 'failed' ||
        type.toLowerCase() == 'cancellation_initiated') {
      return redColor;
    } else if (type.toLowerCase() == 'partially reschedule' ||
        type.toLowerCase() == 'partiallyreschedule' ||
        type.toLowerCase() == 'rescheduled' ||
        type.toLowerCase() == 'reschedule' ||
        type.toLowerCase() == 'pending') {
      return orangeColor;
    } else if (isFullFilled) {
      return context.adColors.greenColor;
    } else if ((type.toLowerCase() == 'complete' ||
            type.toLowerCase() == 'picked_up') &&
        !isFullFilled) {
      return context.adColors.circleGreyTextColor;
    }
    return context.adColors.greenColor;
  }

  TextStyle setTextStyle(
    BuildContext context,
    String type, {
    required bool isFullFilled,
  }) {
    if (type.toLowerCase() == 'booked' ||
        type.toLowerCase() == 'placed' ||
        type.toLowerCase() == 'confirmed') {
      return ADTextStyle700.size16.setTextColor(context.adColors.greenColor);
    } else if (type.toLowerCase() == 'cancelled' ||
        type.toLowerCase() == 'failed' ||
        type.toLowerCase() == 'cancellation_initiated') {
      return ADTextStyle700.size16.setTextColor(redColor);
    } else if (type.toLowerCase() == 'partially reschedule' ||
        type.toLowerCase() == 'partiallyreschedule' ||
        type.toLowerCase() == 'rescheduled' ||
        type.toLowerCase() == 'reschedule' ||
        type.toLowerCase() == 'pending') {
      return ADTextStyle700.size16.setTextColor(orangeColor);
    } else if (isFullFilled) {
      return ADTextStyle700.size16.setTextColor(context.adColors.greenColor);
    } else if ((type.toLowerCase() == 'complete' ||
            type.toLowerCase() == 'picked_up') &&
        !isFullFilled) {
      return ADTextStyle700.size16
          .setTextColor(context.adColors.circleGreyTextColor);
    }
    return ADTextStyle700.size16.setTextColor(context.adColors.greenColor);
  }

  String dateTimeFormatter(String dateTime, {String? format}) {
    return DateFormat(format ?? Constant.dateFormat13)
        .format(DateTime.parse(dateTime))
        .toString();
  }
}
