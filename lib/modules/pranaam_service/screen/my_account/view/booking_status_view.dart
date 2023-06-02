/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/tooltip_shape_border.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_order_status.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/timeline/adtimeline.dart';

const Color orangeColor = Color(0xffe67225);
const Color redColor = Color(0xffe3463b);
const Color greyColor = Color(0xff999999);
const Color lightGreyColor = Color(0xff666666);

///This will show thw booking status of the order.
class BookingStatusView extends StatelessWidget {
  final bool cancelled;
  const BookingStatusView({
    Key? key,
    this.bookingDetailsResponseModel,
    this.cancelled = false,
    this.isRoundTrip = false,
  }) : super(key: key);
  final CommonOrderDetailBaseResponse? bookingDetailsResponseModel;
  final bool isRoundTrip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        itemCount: isRoundTrip
            ? bookingDetailsResponseModel?.roundTripHistory?.length
            : bookingDetailsResponseModel?.statusHistory?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final statusHistory =
              bookingDetailsResponseModel?.statusHistory?[index];
          final roundTripStatusHistory =
              bookingDetailsResponseModel?.roundTripHistory?[index];

          final orderStatus = isRoundTrip
              ? roundTripStatusHistory?.orderStatus ?? ''
              : statusHistory?.orderStatus ?? '';

          final status = isRoundTrip
              ? roundTripStatusHistory?.status ?? ''
              : statusHistory?.status ?? '';
          final bool isPartiallyCancelled =
              bookingDetailsResponseModel?.cancelType == 'Partial';
          final bool isFailed = PranaamOrderStatus.getStatus(
                bookingDetailsResponseModel?.statusHistory?.first.orderStatus,
              ) ==
              PranaamOrderStatus.FAILED;
          final bool failedCase = orderStatus == 'FAILED' ||
              orderStatus == 'RESCHEDULE_FAILED' ||
              orderStatus == 'UPGRADE_FAILED';
          const blurRadius = 2.0;
          const opacity = 0.5;
          return InkWell(
            onTap: () => adLog('order_placed'),
            child: ADTimeline(
              image: 'lib/assets/images/pranaam/information.png',
              toolTipDecoration: ShapeDecoration(
                shape: const TooltipShapeBorder(
                  arrowArc: 0.9,
                  arrowHeight: 0,
                  radius: 4,
                ),
                color: context.adColors.blackTextColor,
                shadows: [
                  BoxShadow(
                    color: context.adColors.blackColor.withOpacity(opacity),
                    blurRadius: blurRadius,
                  ),
                ],
              ),
              showTooltip: failedCase,
              toolTipText:
                  'Any amount deducted will be refunded to your payment source.',
              mainTextStyle: setTextStyle(
                context,
                orderStatus,
                cancelled: cancelled,
                isPartiallyCancelled: isPartiallyCancelled,
                failed: isFailed,
                status: status,
              ),
              subTextStyle: setSubTextStyle(
                orderStatus,
                cancelled: cancelled,
                isPartiallyCancelled: isPartiallyCancelled,
                failed: isFailed,
              ),
              nodeColor: setColor(context, orderStatus, status),
              mainText: status,
              subText: getStatusSubtitle(orderStatus, index),
              status: true,
              isDashedLine: false,
              index: 1,
              timelineSize: context.k_28.toInt(),
              pathColor: (isRoundTrip
                          ? (bookingDetailsResponseModel
                                      ?.roundTripHistory?.length ??
                                  0) -
                              1
                          : (bookingDetailsResponseModel
                                      ?.statusHistory?.length ??
                                  0) -
                              1) ==
                      index
                  ? context.adColors.transparentColor
                  : context.adColors.greyCircleColor,
            ),
          );
        },
      ),
    );
  }

  Color setColor(
    BuildContext context,
    String? orderStatusString,
    String status,
  ) {
    final PranaamOrderStatus? orderStatus =
        PranaamOrderStatus.getStatus(orderStatusString);
    if (orderStatus == PranaamOrderStatus.COMPLETE) {
      return greyColor;
    }
    if (status == 'Partially Cancelled') {
      return orangeColor;
    }
    if (orderStatus == PranaamOrderStatus.COMPLETED ||
        orderStatus == PranaamOrderStatus.RESCHEDULED ||
        orderStatus == PranaamOrderStatus.UPGRADED) {
      return context.adColors.greenColor;
    } else if (orderStatus == PranaamOrderStatus.CANCELLATION_INITIATED ||
        orderStatus == PranaamOrderStatus.RESCHEDULE_FAILED ||
        orderStatus == PranaamOrderStatus.UPGRADE_FAILED ||
        orderStatus == PranaamOrderStatus.FAILED ||
        orderStatus == PranaamOrderStatus.CANCELLED) {
      return redColor;
    } else if (orderStatus == PranaamOrderStatus.PARTIALLY_CANCELLED ||
        orderStatus == PranaamOrderStatus.RESCHEDULED ||
        (orderStatus?.isPendingGetter ?? false)) {
      return orangeColor;
    }

    return context.adColors.greenColor;
  }

  TextStyle setTextStyle(
    BuildContext context,
    String? orderStatusString, {
    required bool cancelled,
    required bool isPartiallyCancelled,
    required bool failed,
    required String status,
  }) {
    final PranaamOrderStatus? orderStatus =
        PranaamOrderStatus.getStatus(orderStatusString);
    if (status == 'Partially Cancelled') {
      return ADTextStyle700.size16.setTextColor(orangeColor);
    }
    if (orderStatus == PranaamOrderStatus.COMPLETED ||
        orderStatus == PranaamOrderStatus.RESCHEDULED ||
        orderStatus == PranaamOrderStatus.UPGRADED) {
      return ADTextStyle700.size16.setTextColor(context.adColors.greenColor);
    }
    if ((orderStatus == PranaamOrderStatus.COMPLETE) && failed) {
      return ADTextStyle700.size16
          .setTextColor(greyColor)
          .copyWith(decoration: TextDecoration.lineThrough);
    } else if (orderStatus == PranaamOrderStatus.CANCELLATION_INITIATED ||
        orderStatus == PranaamOrderStatus.RESCHEDULE_FAILED ||
        orderStatus == PranaamOrderStatus.UPGRADE_FAILED ||
        orderStatus == PranaamOrderStatus.FAILED ||
        orderStatus == PranaamOrderStatus.CANCELLED) {
      return ADTextStyle700.size16.setTextColor(redColor);
    } else if ((orderStatus == PranaamOrderStatus.COMPLETE) &&
        cancelled &&
        !isPartiallyCancelled) {
      return ADTextStyle700.size16
          .setTextColor(greyColor)
          .copyWith(decoration: TextDecoration.lineThrough);
    } else if (orderStatus == PranaamOrderStatus.COMPLETE) {
      return ADTextStyle700.size16.setTextColor(greyColor);
    } else if (orderStatus == PranaamOrderStatus.PARTIALLY_CANCELLED ||
        orderStatus == PranaamOrderStatus.RESCHEDULED ||
        (orderStatus?.isPendingGetter ?? false)) {
      return ADTextStyle700.size16.setTextColor(orangeColor);
    }

    return ADTextStyle700.size16.setTextColor(context.adColors.greenColor);
  }

  TextStyle setSubTextStyle(
    String? type, {
    required bool cancelled,
    required bool isPartiallyCancelled,
    required bool failed,
  }) {
    final PranaamOrderStatus? orderStatus = PranaamOrderStatus.getStatus(type);
    if ((orderStatus == PranaamOrderStatus.COMPLETE ||
            orderStatus == PranaamOrderStatus.COMPLETED) &&
        failed) {
      return ADTextStyle400.size12
          .setTextColor(greyColor)
          .copyWith(decoration: TextDecoration.lineThrough);
    }
    if (cancelled &&
        (orderStatus == PranaamOrderStatus.COMPLETE ||
            orderStatus == PranaamOrderStatus.COMPLETED) &&
        !isPartiallyCancelled) {
      return ADTextStyle400.size12
          .setTextColor(lightGreyColor)
          .copyWith(decoration: TextDecoration.lineThrough);
    }
    return ADTextStyle400.size12;
  }

  String getStatusSubtitle(
    String? status,
    int index,
  ) {
    final PranaamOrderStatus? orderStatus =
        PranaamOrderStatus.getStatus(status);
    if (status?.toLowerCase() == 'completed' && isRoundTrip) {
      if ((bookingDetailsResponseModel?.statusHistory ?? []).isNotEmpty) {
        return 'on ${dateFormatter(
          bookingDetailsResponseModel?.statusHistory?.last.createdOn ?? '',
        )} , ${timeFormatter12Hour(
          bookingDetailsResponseModel?.statusHistory?.last.createdOn ?? '',
        )}';
      }
    } else if (orderStatus?.isPendingGetter ?? false) {
      if ((bookingDetailsResponseModel?.statusHistory ?? []).isNotEmpty) {
        final statusHistoryLength =
            bookingDetailsResponseModel?.statusHistory?.length ?? 0;
        const lastSecondIndex = 2;
        return 'on ${dateFormatter(
          bookingDetailsResponseModel
                  ?.statusHistory?[statusHistoryLength - lastSecondIndex]
                  .createdOn ??
              '',
        )} , ${timeFormatter12Hour(
          bookingDetailsResponseModel
                  ?.statusHistory?[statusHistoryLength - lastSecondIndex]
                  .createdOn ??
              '',
        )}. ${bookingDetailsResponseModel?.statusHistory?[statusHistoryLength - lastSecondIndex].description}';
      }
    }
    return 'on ${dateFormatter(
      bookingDetailsResponseModel?.statusHistory?[index].createdOn ?? '',
    )} , ${timeFormatter12Hour(
      bookingDetailsResponseModel?.statusHistory?[index].createdOn ?? '',
    )}';
  }
}
