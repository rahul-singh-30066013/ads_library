/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/booking_model_for_api.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/duty_free_booking.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// My Booking view for dutyfree bookings section
class DutyFreeBookingView extends StatelessWidget {
  final double boxHeight = 66.sp;
  final double boxWidth = 66.sp;
  static const double borderWidth = 0.5;

  final Color iconColor = const Color(0xff999999);

  final double circleRadius = 5;

  final MyBookingListItem myBookingListItem;

  final ADTapCallback? onTap;

  final BookingHistory? bookingHistory;

  DutyFreeBookingView({
    required this.myBookingListItem,
    Key? key,
    this.onTap,
    this.bookingHistory,
  }) : super(key: key);

  /// TODO Add color to Styleguide
  static const Color orangeColor = Color(0xffe67225);
  static const Color redColor = Color(0xffe3463b);

  final index2 = 2;
  final maxImageLength = 4;
  final showCountLength = 3;
  final margin = 7.sp;
  final dotSize = 5.sp;

  @override
  Widget build(BuildContext context) {
    ProfileGaAnalytics().selectOrderAndBookingAnalyticsData(
      type: bookingHistory?.tabType,
      label: 'duty_free',
      date: bookingHistory?.history?.first.createdOn,
      transactionId: '',
    );
    adLog('Orders Booking Status $myBookingListItem');
    final DutyFreeBooking? bookings =
        myBookingListItem.orderDetail?.dutyfreeDetail;
    return InkWell(
      onTap: () => navigateToCancelDetailPage(context),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: boxWidth,
              height: boxHeight,
              padding: EdgeInsets.all(context.k_4),
              decoration: BoxDecoration(
                color: context.adColors.whiteTextColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(context.k_4),
                ),
                border: Border.all(
                  color: context.adColors.tileBorderColor,
                  width: borderWidth,
                ),
              ),
              child: (bookings?.imageUrl?.length ?? 0) > 1
                  ? ADSizedBox(
                      height: (bookings?.imageUrl?.length ?? 0) > index2
                          ? boxHeight
                          : boxHeight / index2,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => Stack(
                          alignment: Alignment.center,
                          children: [
                            if (index <= index2)
                              ADCachedImage(
                                width: boxWidth,
                                height: boxHeight,
                                imageUrl:
                                    (bookings?.imageUrl?.isNotEmpty ?? false)
                                        ? Utils.validateAndAppendBaseUrl(
                                            bookings?.imageUrl?[index] ?? '',
                                          )
                                        : '',
                                boxFit: BoxFit.contain,
                              ),
                            if (index >= showCountLength)
                              Text(
                                '+${(bookings?.imageUrl?.length ?? 1) - showCountLength}',
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.greyTextColor,
                                ),
                              ),
                          ],
                        ),
                        itemCount: min(
                          maxImageLength,
                          bookings?.imageUrl?.length ?? 0,
                        ),
                      ),
                    )
                  : ADCachedImage(
                      imageUrl: (bookings?.imageUrl?.isNotEmpty ?? false)
                          ? Utils.validateAndAppendBaseUrl(
                              bookings?.imageUrl?.firstOrNull ?? '',
                            )
                          : '',
                      boxFit: BoxFit.contain,
                    ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookings?.storeName ?? '',
                    style: ADTextStyle600.size16
                        .setTextColor(context.adColors.blackTextColor),
                  ),
                  ADSizedBox(
                    height: context.k_8,
                  ),
                  Row(
                    children: [
                      Text(
                        (bookings?.quantity ?? 0) > 1
                            ? 'multiple_items'.localize(context)
                            : bookings?.materialName ?? '',
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      Icon(
                        Icons.circle,
                        size: circleRadius,
                        color: iconColor,
                      ).paddingBySide(left: context.k_4, right: context.k_4),
                      Text(
                        '${'qty'.localize(context)} ${bookings?.quantity ?? 0}',
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                      //
                      // RichText(
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: '${'qty'.localize(context)} ',
                      //         style: ADTextStyle500.size14
                      //             .setTextColor(context.adColors.greyTextColor),
                      //       ),
                      //       TextSpan(
                      //         text: '${bookings?.quantity ?? 0}',
                      //         style: ADTextStyle400.size14.setTextColor(
                      //           context.adColors.blackTextColor,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: context.k_8,
                  ),
                  Text(
                    myBookingListItem.status ?? '',
                    style: ADTextStyle600.size14.setTextColor(
                      setColor(
                        context,
                        myBookingListItem.status ?? '',
                      ),
                    ),
                  ),
                  if (myBookingListItem.status?.toLowerCase() !=
                          'cancellation_initiated' &&
                      myBookingListItem.status?.toLowerCase() != 'cancelled')
                    Container(
                      margin: EdgeInsets.only(top: context.k_8),
                      child: Text(
                        'duty_free_pick_up'.localize(context).replaceAll(
                              '#',
                              dateTimeFormatter(
                                myBookingListItem.orderDetail?.dutyfreeDetail
                                        ?.pickupDate ??
                                    '',
                              ),
                            ),
                        style: ADTextStyle400.size12.setTextColor(
                          context.adColors.greyTextColor,
                        ),
                      ),
                    ),
                  // RichText(
                  //   overflow: TextOverflow.ellipsis,
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: '${myBookingListItem.orderStatus}: ',
                  //         style: ADTextStyle500.size12.setTextColor(
                  //           setColor(
                  //             context,
                  //             myBookingListItem.orderStatus ?? '',
                  //           ),
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text: dateTimeFormatter(
                  //           myBookingListItem.updatedDate ?? '',
                  //         ),
                  //         style: ADTextStyle400.size12
                  //             .setTextColor(context.adColors.greyTextColor),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ).paddingBySide(left: context.k_16),
            ),
            // Spacer(),
            Align(
              child: Icon(
                Icons.keyboard_arrow_right,
                size: context.k_20,
                color: context.adColors.blackTextColor,
              ),
            ),
          ],
        ).paddingAllSide(context.k_16),
      ),
    );
  }

  void navigateToCancelDetailPage(BuildContext context) {
    context.read<DutyFreeOrderState>().dutyFreeCancellationRequest = context
        .read<DutyFreeOrderState>()
        .dutyFreeCancellationRequest
        .copyWith(orderReferenceId: myBookingListItem.orderReferenceId);
    navigateToScreenWithRootNavigatorResult(
      context,
      dutyFreeConfirmationOrder,
      argumentObject: myBookingListItem.orderReferenceId ?? '',
    ).then(
      (value) => onTap?.call(),
    );
  }

  Color setColor(BuildContext context, String type) {
    if (type.toLowerCase() == 'booked' ||
        type.toLowerCase() == 'placed' ||
        type.toLowerCase() == 'confirmed') {
      return context.adColors.greenColor;
    } else if (type.toLowerCase() == 'cancelled' ||
        type.toLowerCase() == 'failed') {
      return context.adColors.red900;
    } else if (type.toLowerCase() == 'reschedule' ||
        type.toLowerCase() == 'partiallyreschedule' ||
        type.toLowerCase() == 'pending') {
      return orangeColor;
    }
    return context.adColors.greenColor;
  }

  String dateTimeFormatter(String dateTime, {String? format}) {
    return DateFormat(format ?? Constant.dateFormat13)
        .format(DateTime.parse(dateTime))
        .toString();
  }
}
