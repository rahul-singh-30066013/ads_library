/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/request/reschedule_order_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/reschedule_page.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///
class DutyFreeReviewDetails extends StatelessWidget {
  final SelectedFlightToPass selectedFlightToPass;
  DutyFreeReviewDetails({Key? key, required this.selectedFlightToPass})
      : super(key: key);

  /// height of status container
  static double containerHeight = 126.sp;

  /// confirm reschedule button
  final double _heightOfRescheduleButton = 54.sp;

  ////
  void submitRescheduleAction() {
    adLog('dd');
  }

  @override
  Widget build(BuildContext context) {
    final DutyFreeOrderState dutyFreeOrderState =
        context.read<DutyFreeOrderState>();

    return Consumer<DutyFreeOrderState>(
      builder: (context, model, child) => AbsorbPointer(
        absorbing: model.rescheduleStatus.viewStatus == Status.loading,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                child: Text(
                  'edit_new'.localize(context),
                  style: ADTextStyle500.size16
                      .setTextColor(
                        context.adColors.blackTextColor,
                      )
                      .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
                onPressed: () => navigatorPopScreen(context),
              ),
            ],
            elevation: 0,
            title: Text(
              'review_detail'.localize(context),
              style: ADTextStyle700.size22.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'rescheduling_title'.localize(context),
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.neutralInfoMsg,
                  ),
                ).paddingBySide(bottom: context.k_20),
                Container(
                  margin: EdgeInsets.symmetric(vertical: context.k_20),
                  height: containerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(context.k_12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'pick_up_date'.localize(context),
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                              ADSizedBox(
                                height: context.k_8,
                              ),
                              Text(
                                dutyFreeOrderState.pickupDate,
                                style: ADTextStyle500.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'pickup_time'.localize(context),
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                              ADSizedBox(
                                height: context.k_8,
                              ),
                              Text(
                                dutyFreeOrderState.pickupTimeSlot,
                                style: ADTextStyle500.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'selected_flight'.localize(context),
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                              ADSizedBox(
                                height: context.k_8,
                              ),
                              Text(
                                dutyFreeOrderState.flightNumber,
                                style: ADTextStyle500.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).paddingBySide(top: context.k_38),
                    ],
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: context.adColors.blueColor,
                    // elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.k_28),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      _heightOfRescheduleButton,
                    ), //////// HERE
                  ),
                  onPressed: () => dutyFreeOrderState.rescheduleOrder(
                    context,
                    selectedFlightToPass.context,
                    RescheduleOrderRequest(
                      orderDate: dutyFreeOrderState.pickupDate,
                      orderTime: dutyFreeOrderState.pickupTime,
                      customerID: ProfileSingleton.profileSingleton.userID,
                      orderReferenceId: dutyFreeOrderState.orderId ??
                          '',
                      reason: '',
                      flightNo: selectedFlightToPass.flightNo,
                    ),
                  ),
                  child: Selector<DutyFreeOrderState, Status?>(
                    selector: (context, state) =>
                        state.rescheduleStatus.viewStatus,
                    builder: (context, status, child) =>
                        status == Status.loading
                            ? ADDotProgressView(
                                color: context.adColors.whiteTextColor,
                              )
                            : Text(
                                'confirm_rescheduling'.localize(context),
                                style: ADTextStyle700.size16.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                  ),
                ).paddingBySide(top: context.k_26),

                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     primary: context.adColors.blueColor,
                //     // elevation: 0,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(context.k_28),
                //     ),
                //     minimumSize: Size(
                //       double.infinity,
                //       _heightOfRescheduleButton,
                //     ), //////// HERE
                //   ),
                //   onPressed: () => submitRescheduleAction(),
                //   child: Text(
                //     'confirm_rescheduling'.localize(context),
                //     style: ADTextStyle700.size18.setTextColor(
                //       context.adColors.whiteTextColor,
                //     ),
                //   ),
                // ),
              ],
            ).paddingBySide(
              top: context.k_20,
              left: context.k_16,
              right: context.k_16,
            ),
          ),
        ),
      ),
    );
  }
}
