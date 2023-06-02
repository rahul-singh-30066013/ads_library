/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/booking_model_for_api.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/arrival.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/pranaam_booking.dart';
import 'package:adani_airport_mobile/modules/my_bookings/screens/flight_booking_list_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
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

/// My Booking view for pranaam bookings section
class PranaamBookingView extends StatefulWidget {
  static const double borderWidth = 0.5;
  final ADTapCallback? onTap;

  final MyBookingListItem myBookingListItem;
  final bool isFromMoreScreen;
  final BookingHistory? bookingHistory;

  const PranaamBookingView({
    required this.myBookingListItem,
    Key? key,
    this.isFromMoreScreen = false,
    this.onTap,
    this.bookingHistory,
  }) : super(key: key);

  @override
  State<PranaamBookingView> createState() => _PranaamBookingViewState();
}

class _PranaamBookingViewState extends State<PranaamBookingView> {
  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  final double boxHeight = 82.sp;

  final double boxWidth = 82.sp;

  final Color iconColor = const Color(0xff999999);

  final double circleRadius = 5;

  final refundColor = const Color(0xfffff7df);

  @override
  void initState() {
    super.initState();
    ProfileGaAnalytics().selectOrderAndBookingAnalyticsData(
      type: widget.bookingHistory?.tabType,
      label: 'pranaam',
      date: widget.bookingHistory?.history?.first.createdOn,
      transactionId: '',
    );
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
  }

  @override
  Widget build(BuildContext context) {
    final PranaamBooking? bookings =
        widget.myBookingListItem.orderDetail?.pranaamDetail;
    final Arrival? roundTripDetails =
        widget.myBookingListItem.orderDetail?.pranaamDetail?.arrival;

    adLog('PranaamBooking ${bookings?.flightName}');
    final bookingViewSize = 66.sp;
    final bool isRoundTrip = bookings?.serviceType == 'Round Trip' ||
        bookings?.serviceType == 'round trip';
    final bookingFirstRow = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(context.k_4),
              ),
              border: Border.all(
                color: context.adColors.tileBorderColor,
                width: PranaamBookingView.borderWidth,
              ),
              color: context.adColors.whiteTextColor,
            ),
            child: bookings?.imageUrl == null
                ? Image.asset(
                    'lib/assets/images/pranaam/pranaam_booking.png',
                    width: bookingViewSize,
                    height: bookingViewSize,
                    fit: BoxFit.fitHeight,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(context.k_4),
                    child: ADCachedImage(
                      width: bookingViewSize,
                      height: bookingViewSize,
                      imageUrl: bookings?.imageUrl ??
                          'lib/assets/images/pranaam/pranaam_booking.png',
                      boxFit: BoxFit.fitHeight,
                    ),
                  ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${getBookingTitle(
                          bookings?.pranaamBookingType ?? '',
                          context,
                        )} ',
                        style: ADTextStyle600.size16,
                      ),
                      TextSpan(
                        text: '${'service'.localize(context)} ',
                        style: ADTextStyle600.size16,
                      ),
                      TextSpan(
                        text: getCityName(
                          bookings?.serviceAirport ?? 'AMD',
                          context.read<SiteCoreStateManagement>(),
                        ).toUpperCase(),
                        style: ADTextStyle600.size12
                            .setTextColor(const Color(0xff333333))
                            .copyWith(
                              letterSpacing: 0,
                            ),
                      ),
                    ],
                  ),
                ),
                ADSizedBox(
                  height: context.k_8,
                ),
                Row(
                  children: [
                    Text(
                      '${(bookings?.travelSector ?? '').capitalizeFirstChar()} ',
                      style: ADTextStyle400.size14
                          .setTextColor(context.adColors.blackTextColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Icon(
                      Icons.circle,
                      size: circleRadius,
                      color: iconColor,
                    ).paddingBySide(left: context.k_2, right: context.k_2),
                    Text(
                      ' ${isRoundTrip ? 'Departure  ' : (bookings?.serviceType ?? '').capitalizeFirstChar()} ',
                      style: ADTextStyle400.size14
                          .setTextColor(context.adColors.blackTextColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (isStandAloneService(
                      bookings?.pranaamBookingType ?? '',
                    ))
                      Icon(
                        Icons.circle,
                        size: circleRadius,
                        color: iconColor,
                      ).paddingBySide(left: context.k_2, right: context.k_2),
                    if (isStandAloneService(
                      bookings?.pranaamBookingType ?? '',
                    ))
                      Text(
                        ' Qty ${bookings?.itemCount}',
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.blackTextColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
                SizedBox(
                  height: context.k_8,
                ),
                Text(
                  // (isRoundTrip && isReschedule)
                  //     ? widget.myBookingListItem.orderDetail?.pranaamDetail
                  //             ?.departure?.orderStatus ??
                  //         ''
                  //     :
                  widget.myBookingListItem.status ?? '',
                  style: ADTextStyle600.size14.setTextColor(
                    getBookingStatusTextColor(
                      // (isRoundTrip && isReschedule)
                      //     ? widget.myBookingListItem.orderDetail?.pranaamDetail
                      //             ?.departure?.orderStatus ??
                      //         ''
                      //     :
                      widget.myBookingListItem.status ?? '',
                      context,
                    ),
                  ),
                ),
                getSubtitleWidget(bookings),
                getRefundContainer(),
              ],
            ).paddingBySide(left: context.k_16),
          ),
          Align(
            child: Icon(
              Icons.keyboard_arrow_right,
              size: context.k_20,
              color: context.adColors.blackTextColor,
            ).paddingBySide(left: context.k_20),
          ),
        ],
      ).paddingAllSide(context.k_16),
    );
    final bookingSecondRow = Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(context.k_4),
            ),
            border: Border.all(
              color: context.adColors.tileBorderColor,
              width: PranaamBookingView.borderWidth,
            ),
            color: context.adColors.whiteTextColor,
          ),
          child: bookings?.imageUrl == null
              ? Image.asset(
                  'lib/assets/images/pranaam/pranaam_booking.png',
                  width: bookingViewSize,
                  height: bookingViewSize,
                  fit: BoxFit.fitHeight,
                )
              : ADCachedImage(
                  width: bookingViewSize,
                  height: bookingViewSize,
                  imageUrl: bookings?.imageUrl ??
                      'lib/assets/images/pranaam/pranaam_booking.png',
                  boxFit: BoxFit.fitHeight,
                ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${getBookingTitle(
                        bookings?.pranaamBookingType ?? '',
                        context,
                      )} ',
                      style: ADTextStyle600.size16,
                    ),
                    TextSpan(
                      text: '${'service'.localize(context)} ',
                      style: ADTextStyle600.size16,
                    ),
                    TextSpan(
                      text: getCityName(
                        bookings?.serviceAirport ?? 'AMD',
                        context.read<SiteCoreStateManagement>(),
                      ).toUpperCase(),
                      style: ADTextStyle600.size12
                          .setTextColor(const Color(0xff333333))
                          .copyWith(
                            letterSpacing: 0,
                          ),
                    ),
                  ],
                ),
              ),
              ADSizedBox(
                height: context.k_10,
              ),
              Row(
                children: [
                  Text(
                    '${(bookings?.travelSector ?? '').capitalizeFirstChar()} ',
                    style: ADTextStyle400.size14
                        .setTextColor(context.adColors.blackTextColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Icon(
                    Icons.circle,
                    size: circleRadius,
                    color: iconColor,
                  ).paddingBySide(left: context.k_2, right: context.k_2),
                  Text(
                    ' Arrival ',
                    style: ADTextStyle400.size14
                        .setTextColor(context.adColors.blackTextColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (isStandAloneService(
                    bookings?.pranaamBookingType ?? '',
                  ))
                    Icon(
                      Icons.circle,
                      size: circleRadius,
                      color: iconColor,
                    ).paddingBySide(left: context.k_2, right: context.k_2),
                  if (isStandAloneService(
                    bookings?.pranaamBookingType ?? '',
                  ))
                    Text(
                      ' Qty ${bookings?.itemCount}',
                      style: ADTextStyle400.size14
                          .setTextColor(context.adColors.blackTextColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
              SizedBox(
                height: context.k_10,
              ),
              Text(
                // (isRoundTrip && isReschedule)
                //     ? widget.myBookingListItem.orderDetail?.pranaamDetail
                //             ?.arrival?.orderStatus ??
                //         ''
                //     :
                widget.myBookingListItem.status ?? '',
                style: ADTextStyle600.size14.setTextColor(
                  getBookingStatusTextColor(
                    widget.myBookingListItem.status ?? '',
                    context,
                  ),
                ),
              ),
              if (!isCancelled(widget.myBookingListItem.status ?? '') &&
                      widget.myBookingListItem.status?.toUpperCase() ==
                          'COMPLETE' ||
                  widget.myBookingListItem.status?.toUpperCase() == 'CONFIRMED')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.k_10,
                    ),
                    Text(
                      '${'service'.localize(context)} ${'on'.localize(context)} ${formatDateTime(
                        dateTimeType: formatFlightDateForCartScreen(
                          roundTripDetails?.date ?? '',
                        ),
                        dateTimeFormat: dateTimeFormatDayMonthYear,
                      )}, ${formatPranaamRoundTripServiceTime(roundTripDetails?.time ?? '')}',
                      style: ADTextStyle400.size12
                          .copyWith(color: context.adColors.greyTextColor),
                    ),
                  ],
                ),
              getRefundContainer(),
            ],
          ).paddingBySide(left: context.k_16),
        ),
        // Spacer(),
        Icon(
          Icons.keyboard_arrow_right,
          size: context.k_20,
          color: context.adColors.blackTextColor,
        ).paddingBySide(left: context.k_20),
      ],
    ).paddingAllSide(context.k_16);
    adLog(
      'selectedServiceId ${pranaamAppDataStateManagement.serviceBookingData.selectedService?.serviceId}',
    );

    return isRoundTrip
        ? Column(
            children: [
              InkWell(
                onTap: () => onBookingTap(
                  context,
                  isRoundTrip: false,
                  isRoundTripDeparture: true,
                ),
                child: bookingFirstRow,
              ),
              Divider(
                thickness: borderWidth,
                color: context.adColors.lightGreyGridSeparatorColor,
              ).paddingBySide(
                left: context.k_20,
                right: context.k_20,
              ),
              InkWell(
                onTap: () => onBookingTap(
                  context,
                  isRoundTrip: true,
                ),
                child: bookingSecondRow,
              ),
            ],
          )
        : InkWell(
            onTap: () => onBookingTap(
              context,
              isRoundTrip: false,
            ),
            child: bookingFirstRow,
          );
  }

  dynamic getSubtitleWidget(PranaamBooking? bookings) {
    if (widget.myBookingListItem.status?.toUpperCase() == 'COMPLETE' ||
        widget.myBookingListItem.status?.toUpperCase() == 'CONFIRMED') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.k_10,
          ),
          Text(
            '${'service'.localize(context)} ${'on'.localize(context)} ${formatDateTime(
              dateTimeType: formatFlightDateForCartScreen(
                bookings?.serviceDateTime ?? '',
              ),
              dateTimeFormat: dateTimeFormatDayMonthYear,
            )}, ${formatPranaamOrderServiceTime(bookings?.serviceDateTime ?? '')}',
            style: ADTextStyle400.size12
                .copyWith(color: context.adColors.greyTextColor),
          ),
        ],
      );
    }
    return const ADSizedBox.shrink();
  }

  dynamic getRefundContainer() {
    if (widget.myBookingListItem.status?.toUpperCase() == 'PENDING') {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.k_12,
          vertical: context.k_8,
        ),
        margin: EdgeInsets.only(
          top: context.k_12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_4),
          ),
          color: const Color(0xfffff7df),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          widget.myBookingListItem.description ?? '',
          style: ADTextStyle400.size12.setTextColor(
            context.adColors.blackTextColor,
          ),
        ),
      );
    }

    if ((isCancelled(widget.myBookingListItem.status ?? '') ||
            widget.myBookingListItem.status?.toUpperCase() == 'FAILED') &&
        widget.myBookingListItem.orderDetail?.pranaamDetail?.refundStatus !=
            '') {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.k_12,
          vertical: context.k_8,
        ),
        margin: EdgeInsets.only(
          top: context.k_12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_4),
          ),
          color: const Color(0xfffff7df),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          widget.myBookingListItem.orderDetail?.pranaamDetail?.refundStatus ??
              '',
          style: ADTextStyle400.size12.setTextColor(
            context.adColors.blackTextColor,
          ),
        ),
      );
    }
    return const ADSizedBox.shrink();
  }

  //todo check these through Enum
  String getServiceTitle(String status) {
    final type = status.toUpperCase();
    if (type == 'CONFIRMED') {
      return 'confirmed'.localize(context);
    } else if (type == 'FULFILLED') {
      return 'completed'.localize(context);
    } else if (type == 'PENDING') {
      return 'pending'.localize(context);
    } else if (type == 'FAILED' ||
        type == 'RESCHEDULE_FAILED' ||
        type == 'UPGRADE_FAILED') {
      return 'booking_failed'.localize(context);
    } else if (type == 'CANCELLED' || type == 'CANCELLATION_INITIATED') {
      return 'cancelled'.localize(context);
    }
    return '';
  }

  bool isCancelled(String status) =>
      status.toUpperCase() == 'CANCELLED' ||
      status.toUpperCase() == 'CANCELLATION_INITIATED' ||
      status.toUpperCase() == 'Partially Cancelled';

  String dateTimeFormatter(String dateTime, {String? format}) {
    return DateFormat(format ?? Constant.dateFormat13)
        .format(DateTime.parse(dateTime).toLocal())
        .toString();
  }

  Future<void> onBookingTap(
    BuildContext context, {
    required bool isRoundTrip,
    bool isRoundTripDeparture = false,
  }) async {
    await navigateToScreenWithRootNavigatorResult(
      context,
      myAccountView,
      argumentObject: [
        widget.myBookingListItem.orderReferenceId ?? '',
        widget.isFromMoreScreen,
        isRoundTrip,
        isRoundTripDeparture,
      ],
    ).then((value) => widget.onTap?.call());
  }
}
