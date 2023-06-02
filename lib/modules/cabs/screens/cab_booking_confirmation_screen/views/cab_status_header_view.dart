/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_live_tracking_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/cab_util.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/cab_booking_order_status.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class CabStatusHeaderView extends StatelessWidget {
  const CabStatusHeaderView({
    Key? key,
    required this.otp,
    required this.isKiosk,
  }) : super(key: key);

  final String otp;
  final bool isKiosk;

  @override
  Widget build(BuildContext context) {
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

    const double imageOpacity = 0.15;
    final double rideStartedWidth = 200.sp;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(imageOpacity),
            BlendMode.dstATop,
          ),
          image: const AssetImage(
            'lib/assets/images/cab_booking/map.png',
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            bottom: false,
            child: SizedBox(
              height: AppBar().preferredSize.height + context.k_20,
            ),
          ),
          Text(
            cabBookingOrderStatus == CabBookingOrderStatus.scheduled
                ? '${'scheduled_for'.localize(context)} $date'
                : cabBookingOrderStatus == CabBookingOrderStatus.ontheway
                    ? '${'ride_started'.localize(context)} $date'
                    : cabBookingOrderStatus == CabBookingOrderStatus.pending
                        ? 'cab_booking_pending'.localize(context)
                        : cabBookingOrderStatus == CabBookingOrderStatus.failed
                            ? 'booking_failed!'.localize(context)
                            : date,
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.blackTextColor),
          ),
          if ((cabBookingConfirmationState
                      .commonOrderDetailBaseResponse?.orderReferenceId ??
                  '')
              .isNotEmpty)
            Text(
              '${'booking_id'.localize(context)} ${cabBookingConfirmationState.commonOrderDetailBaseResponse?.orderReferenceId ?? ''}',
              style: ADTextStyle400.size14.setTextColor(
                context.adColors.blackTextColor,
              ),
            ).paddingBySide(top: context.k_6),
          if (cabBookingOrderStatus == CabBookingOrderStatus.cancelled &&
              (cabBookingConfirmationState.cabOrderDetailResponseModel
                      ?.bookingInfo?.isAutoCancelled ??
                  false))
            Column(
              children: [
                Text(
                  '${'your'.localize(context)} ${'cab_has_been_auto_cancelled_as_ride_didnt_start_within'.localize(context)}${cabBookingConfirmationState.cabOrderDetailResponseModel?.bookingInfo?.autoCancelledTime}',
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
              ],
            ).paddingBySide(top: context.k_10),
          if ((cabBookingOrderStatus == CabBookingOrderStatus.scheduled ||
                  cabBookingOrderStatus == CabBookingOrderStatus.confirmed) &&
              otp.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((cabBookingOrderStatus == CabBookingOrderStatus.scheduled ||
                        cabBookingOrderStatus ==
                            CabBookingOrderStatus.confirmed) &&
                    otp.isNotEmpty)
                  Text(
                    (isKiosk
                            ? 'otp_for_this_booking'
                            : 'share_otp_with_the_driver_to_start_the_trip')
                        .localize(context),
                    style: ADTextStyle400.size14.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ).paddingBySide(bottom: context.k_15),
                SizedBox(
                  height: context.k_40,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: context.k_8,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: otp.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
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
                                style: ADTextStyle700.size22.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ).paddingBySide(top: context.k_26),
          if (cabBookingOrderStatus == CabBookingOrderStatus.ontheway)
            InkWell(
              onTap: () => navigateToScreenUsingNamedRouteWithArguments(
                context,
                cabLiveTracking,
                argumentObject: CabLiveTrackingNavigateModel(
                  orderReferenceId: cabBookingConfirmationState
                      .commonOrderDetailBaseResponse?.orderReferenceId,
                  cabOrderDetailResponseModel:
                      cabBookingConfirmationState.cabOrderDetailResponseModel,
                  filteredVendorDataResponseModel: cabBookingConfirmationState
                      .filteredVendorDataResponseModel,
                ),
              ),
              child: Container(
                width: rideStartedWidth,
                height: context.k_48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(context.k_24),
                  ),
                  border: Border.all(
                    color: context.adColors.blackTextColor,
                  ),
                  color: const Color(0xffffffff),
                ),
                child: Center(
                  child: Text(
                    'view_ride_details'.localize(context),
                    style: ADTextStyle500.size16.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                ),
              ).paddingBySide(top: context.k_26),
            ),
          /*  SizedBox(
            height: context.k_24,
          ),*/
        ],
      ),
    );
  }
}
