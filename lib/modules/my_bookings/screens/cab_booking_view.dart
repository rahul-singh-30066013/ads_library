/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_booking_confirmation_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/cab_booking_order_status.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/booking_model_for_api.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/cab_booking/cab_booking.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/booking_status_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
class CabBookingView extends StatefulWidget {
  static const double borderWidth = 0.5;
  static double boxHeight = 66.sp;
  final ADTapCallback? onTap;

  final MyBookingListItem myBookingListItem;
  final bool isFromMoreScreen;
  final BookingHistory? bookingHistory;

  const CabBookingView({
    required this.myBookingListItem,
    Key? key,
    this.isFromMoreScreen = false,
    this.onTap,
    this.bookingHistory,
  }) : super(key: key);

  @override
  State<CabBookingView> createState() => _CabBookingViewState();
}

class _CabBookingViewState extends State<CabBookingView> {
  @override
  void initState() {
    super.initState();
    ProfileGaAnalytics().selectOrderAndBookingAnalyticsData(
      type: widget.bookingHistory?.tabType,
      label: 'cab',
      date: widget.bookingHistory?.history?.first.createdOn,
      transactionId: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final CabBooking? bookings =
        widget.myBookingListItem.orderDetail?.cabDetail;
    final pickupDate = widget.myBookingListItem.createdOn ?? '';
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      DateTime.parse(pickupDate).toLocal().millisecondsSinceEpoch,
    );
    final date = DateFormat('dd MMM yyyy').format(dateTime);
    final time = DateFormat('hh:mm a').format(dateTime);
    return InkWell(
      onTap: () => onBookingTap(context),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: CabBookingView.boxHeight,
              height: CabBookingView.boxHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(context.k_4),
                ),
                border: Border.all(
                  color: context.adColors.tileBorderColor,
                  width: CabBookingView.borderWidth,
                ),
                color: context.adColors.whiteTextColor,
              ),
              child: SvgPicture.asset(
                SvgAssets.taxiIcon,
                color: context.adColors.darkGreyTextColor,
                width: context.k_22,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookings?.vehicleType ?? '',
                    style: ADTextStyle700.size14
                        .setTextColor(context.adColors.blackTextColor)
                        .copyWith(
                          letterSpacing: 0,
                        ),
                  ),
                  ADSizedBox(
                    height: context.k_10,
                  ),
                  Row(
                    children: [
                      Text(
                        date,
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                      // Oval
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: context.k_6),
                        width: context.k_4,
                        height: context.k_4,
                        decoration: BoxDecoration(
                          color: context.adColors.circleGreyTextColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(context.k_4),
                          ),
                        ),
                      ),
                      Text(
                        time,
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.k_10,
                  ),
                  Text(
                    'To ${bookings?.locationCode ?? ''}',
                    style: ADTextStyle400.size14
                        .setTextColor(
                          context.adColors.neutralInfoMsg,
                        )
                        .copyWith(overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: context.k_10,
                  ),
                  Text(
                    CabBookingOrderStatus.values
                        .byName(
                          (widget.myBookingListItem.status ?? '').toLowerCase(),
                        )
                        .name
                        .toLowerCase()
                        .capitalizeFirstChar(),
                    style: ADTextStyle600.size14.setTextColor(
                      setColor(
                        context,
                        widget.myBookingListItem.status ?? '',
                      ),
                    ),
                  ),
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
      ),
    );
  }

  Future<void> onBookingTap(BuildContext context) async {
    await navigateToScreenWithRootNavigatorResult(
      context,
      cabBookingConfirmationScreen,
      argumentObject: CabBookingConfirmationNavigateModel(
        orderReferenceId: widget.myBookingListItem.orderReferenceId ?? '',
      ),
    ).then(
      (value) {
        context.read<AppSessionState>().updateValueOfBooking(
              updateValue: true,
            );
        widget.onTap?.call();
      },
    );
  }

  Color setColor(
    BuildContext context,
    String status,
  ) {
    if (status == 'Completed') {
      return context.adColors.greenColor;
    } else if (status.toLowerCase() == 'Cancelled'.toLowerCase() ||
        status.toLowerCase() == 'failed'.toLowerCase()) {
      return redColor;
    } else if (status == 'Partially Reschedule' ||
        status == 'PartiallyReschedule' ||
        status == 'PartiallyCancelled' ||
        status == 'Partially Cancelled' ||
        status.toLowerCase() == 'pending'.toLowerCase()) {
      return orangeColor;
    }
    return context.adColors.greenColor;
  }
}
