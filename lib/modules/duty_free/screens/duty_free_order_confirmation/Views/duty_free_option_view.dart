/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Action options like download Invoice, Cancel, Reschedule
class DutyFreeOptionView extends StatelessWidget {
  const DutyFreeOptionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<DutyFreeStatusHistoryDetailsResponse> statusHistory = context
    //         .read<DutyFreeOrderState>()
    //         .dutyFreeCancelOrderDetailsResponseModel
    //         ?.overallStatus
    //         .statusHistory ??
    //     [];

    return Consumer<DutyFreeOrderState>(
      builder: (BuildContext context, dutyFreeOrderState, Widget? child) {
        final statusHistoryLength = dutyFreeOrderState
                .dutyFreeCancelOrderDetailsResponseModel
                ?.statusHistory
                ?.length ??
            0;
        String? currentOrderStatus = '';
        for (int statusCount = 0;
            statusCount < statusHistoryLength;
            statusCount++) {
          if (dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                  ?.statusHistory?[statusCount].progress
                  ?.toLowerCase() ==
              'current') {
            currentOrderStatus = dutyFreeOrderState
                .dutyFreeCancelOrderDetailsResponseModel
                ?.statusHistory?[statusCount]
                .orderStatus;
          }
        }
        final isPending = currentOrderStatus?.toLowerCase() == 'pending';
        const opacityValue = 0.1929411747876336;
        return Column(
          children: [
            // if (AppConstants.showMap)

            // if (AppConstants.showMap)

            if ((dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                            ?.statusHistory?.length ??
                        0) >
                    0 &&
                !dutyFreeOrderState.orderCancelled &&
                !dutyFreeOrderState.orderFailed) ...[
              Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Column(
                    children: [
                      Divider(
                        height: 1,
                        color: context.adColors.lightGreyGridSeparatorColor,
                      ).paddingBySide(left: context.k_16, right: context.k_16),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: context.k_16,
                          horizontal: context.k_16,
                        ),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              SvgAssets.locationDutyFree,
                              height: context.k_16,
                              width: context.k_16,
                              color: isPending
                                  ? context.adColors.darkGreyTextColor
                                      .withOpacity(opacityValue)
                                  : context.adColors.darkGreyTextColor,
                            ),
                            ADSizedBox(
                              width: context.k_12,
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: ADTextStyle400.size16.setTextColor(
                                    isPending
                                        ? context.adColors.black
                                            .withOpacity(opacityValue)
                                        : context.adColors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          '${'pick_up_location'.localize(context)} ',
                                    ),
                                    TextSpan(
                                      text: dutyFreeOrderState
                                          .dutyFreeCancelOrderDetailsResponseModel
                                          ?.orderDetail
                                          ?.dutyfreeDetail
                                          ?.store,
                                      style: ADTextStyle700.size16.setTextColor(
                                        isPending
                                            ? context.adColors.black
                                                .withOpacity(opacityValue)
                                            : context.adColors.black,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: ADSizedBox(
                                        width: context.k_4,
                                      ),
                                    ),
                                    TextSpan(
                                      text: (dutyFreeOrderState
                                                      .dutyFreeCancelOrderDetailsResponseModel
                                                      ?.orderDetail
                                                      ?.dutyfreeDetail
                                                      ?.loyaltyPotentialPoint
                                                      ?.toDouble() ??
                                                  0) >
                                              0
                                          ? dutyFreeOrderState
                                              .dutyFreeCancelOrderDetailsResponseModel
                                              ?.orderDetail
                                              ?.dutyfreeDetail
                                              ?.loyaltyPotentialPoint
                                              .toString()
                                          : '',
                                      style: ADTextStyle500.size16.setTextColor(
                                        context.adColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ADSizedBox(
                              width: context.k_10,
                            ),
                            //const ComingSoon(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            // if (!dutyFreeOrderState.orderCancelled ) ...[
            //   Divider(
            //     color: context.adColors.lightGreyGridSeparatorColor,
            //   ),
            //   Material(
            //     color: Colors.transparent,
            //     child: InkWell(
            //       child: Container(
            //         color: Colors.transparent,
            //         margin: EdgeInsets.symmetric(vertical: context.k_16),
            //         child: Row(
            //           children: [
            //             Icon(
            //               Icons.document_scanner,
            //               size: context.k_20,
            //             ),
            //             ADSizedBox(
            //               width: context.k_12,
            //             ),
            //             Text(
            //               'downloadInvoice'.localize(context),
            //               style: ADTextStyle500.size16.setTextColor(
            //                 context.adColors.black,
            //               ),
            //             ),
            //             ADSizedBox(
            //               width: context.k_10,
            //             ),
            //             const ComingSoon(),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ],
            if (Platform.isIOS && !dutyFreeOrderState.orderFailed)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: isPending
                      ? () => {}
                      : () => {
                            HapticFeedback.mediumImpact(),
                            Utils.openWallet(
                              dutyFreeOrderState
                                      .dutyFreeCancelOrderDetailsResponseModel
                                      ?.orderReferenceId ??
                                  '',
                              context,
                            ),
                          },
                  child: Column(
                    children: [
                      Divider(
                        color: context.adColors.lightGreyGridSeparatorColor,
                        height: 1,
                      ).paddingBySide(
                        left: context.k_16,
                        right: context.k_16,
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          vertical: context.k_16,
                          horizontal: context.k_16,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              SvgAssets.addSavedFlights,
                              height: context.k_16,
                              width: context.k_16,
                              color: isPending
                                  ? context.adColors.darkGreyTextColor
                                      .withOpacity(opacityValue)
                                  : context.adColors.darkGreyTextColor,
                            ),
                            ADSizedBox(
                              width: context.k_12,
                            ),
                            Text(
                              'add_to_wallet'.localize(context),
                              style: ADTextStyle400.size16.setTextColor(
                                isPending
                                    ? context.adColors.black
                                        .withOpacity(opacityValue)
                                    : context.adColors.black,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              SvgAssets.arrowRight,
                              width: context.k_6,
                              height: context.k_12,
                              color: isPending
                                  ? context.adColors.greyTextColor
                                      .withOpacity(opacityValue)
                                  : context.adColors.greyTextColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if ((dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                            ?.statusHistory?.length ??
                        0) >
                    0 &&
                !dutyFreeOrderState.orderCancelled &&
                !dutyFreeOrderState.orderFailed) ...[
              if (!dutyFreeOrderState.orderRescheduled &&
                  !(currentOrderStatus?.toLowerCase() == 'fulfilled' ||
                      currentOrderStatus?.toLowerCase() ==
                          'part_fulfilled')) ...[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: isPending
                        ? () => {}
                        : () => rescheduleAction(context, dutyFreeOrderState),
                    child: Column(
                      children: [
                        Divider(
                          height: 1,
                          color: context.adColors.lightGreyGridSeparatorColor,
                        ).paddingBySide(
                          left: context.k_16,
                          right: context.k_16,
                        ),
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            vertical: context.k_16,
                            horizontal: context.k_16,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                SvgAssets.rescheduleDutyFree,
                                height: context.k_16,
                                width: context.k_16,
                                color: isPending
                                    ? context.adColors.darkGreyTextColor
                                        .withOpacity(opacityValue)
                                    : context.adColors.darkGreyTextColor,
                              ),
                              ADSizedBox(
                                width: context.k_12,
                              ),
                              Text(
                                'reschedule'.localize(context),
                                style: ADTextStyle400.size16.setTextColor(
                                  isPending
                                      ? context.adColors.black
                                          .withOpacity(opacityValue)
                                      : context.adColors.black,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                SvgAssets.arrowRight,
                                color: isPending
                                    ? context.adColors.greyTextColor
                                        .withOpacity(opacityValue)
                                    : context.adColors.greyTextColor,
                                width: context.k_6,
                                height: context.k_12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              if (isBookedDateIslessThanBookedDatePlus30(
                    dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                            ?.statusHistory?.firstOrNull?.createdOn
                            .toString() ??
                        '',
                  ) &&
                  !(currentOrderStatus?.toLowerCase() == 'fulfilled' ||
                      currentOrderStatus?.toLowerCase() == 'part_fulfilled') &&
                  !dutyFreeOrderState.orderFailed) ...[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: isPending
                        ? () => {}
                        : () => {
                              navigateToScreenUsingNamedRoute(
                                context,
                                dutyFreeOrderCancelReason,
                              ),
                            },
                    child: Column(
                      children: [
                        Divider(
                          color: context.adColors.lightGreyGridSeparatorColor,
                          height: 1,
                        ).paddingBySide(
                          left: context.k_16,
                          right: context.k_16,
                        ),
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            vertical: context.k_16,
                            horizontal: context.k_16,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                SvgAssets.cancelDutyFree,
                                height: context.k_16,
                                width: context.k_16,
                                color: isPending
                                    ? context.adColors.darkGreyTextColor
                                        .withOpacity(opacityValue)
                                    : context.adColors.darkGreyTextColor,
                              ),
                              ADSizedBox(
                                width: context.k_12,
                              ),
                              Text(
                                'cancel'.localize(context),
                                style: ADTextStyle400.size16.setTextColor(
                                  isPending
                                      ? context.adColors.black
                                          .withOpacity(opacityValue)
                                      : context.adColors.black,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                SvgAssets.arrowRight,
                                width: context.k_6,
                                height: context.k_12,
                                color: isPending
                                    ? context.adColors.greyTextColor
                                        .withOpacity(opacityValue)
                                    : context.adColors.greyTextColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
            if (!dutyFreeOrderState.orderCancelled) ...[
              Divider(
                height: 1,
                color: context.adColors.lightGreyGridSeparatorColor,
              ).paddingBySide(left: context.k_16, right: context.k_16),
            ],
          ],
        );
      },
    );
  }

  /// user can not cancel order if booking is a month old
  bool isBookedDateIslessThanBookedDatePlus30(String dateTime) {
    final DateTime bookedDate = DateTime.parse(dateTime).toLocal();
    final newDate =
        DateTime(bookedDate.year, bookedDate.month, bookedDate.day + 30);
    return newDate.isAfter(DateTime.now());
  }

  void rescheduleAction(
    BuildContext context,
    DutyFreeOrderState dutyFreeOrderState,
  ) {
    dutyFreeOrderState.dutyFreeEventState.rescheduleStartEvent();
    navigateToScreenUsingNamedRoute(
      context,
      dutyFreeReschedule,
    );
  }

// bool isAble(
//   List<DutyFreeStatusHistoryDetailsResponse> statusHistory,
// ) {
//   bool checkType = false;
//   if (statusHistory.isNotEmpty) {
//     for (int index = 0; index < statusHistory.length; index++) {
//       final DutyFreeStatusHistoryDetailsResponse
//           dutyFreeStatusHistoryDetailsResponse = statusHistory[index];
//       if (dutyFreeStatusHistoryDetailsResponse.status ==
//               'PartiallyReschedule' ||
//           dutyFreeStatusHistoryDetailsResponse.status == 'Reschedule' ||
//           dutyFreeStatusHistoryDetailsResponse.status == 'Rescheduled') {
//         checkType = false;
//         break;
//       } else {
//         checkType = true;
//       }
//     }
//   } else {
//     checkType = true;
//   }
//   return checkType;
// }
}
