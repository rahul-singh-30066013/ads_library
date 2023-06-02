/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/components/header_dialog.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Updates send to Section in Order Confirmation
class DutyFreeUpdateSend extends StatelessWidget {
  const DutyFreeUpdateSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DutyFreeOrderState>(
      builder: (BuildContext context, dutyFreeOrderState, Widget? child) {
        final countryDialCode = dutyFreeOrderState
                    .dutyFreeCancelOrderDetailsResponseModel
                    ?.orderDetail
                    ?.dutyfreeDetail
                    ?.passengerDetail
                    .first
                    .countryDialCode
                    .startsWith('+') ??
                false
            ? '${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.passengerDetail.first.countryDialCode}'
            : '+${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.passengerDetail.first.countryDialCode}';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(title: 'updates_sent_to').paddingBySide(
              bottom: context.k_20,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  SvgAssets.dutyFreeCall,
                  width: context.k_14,
                  height: context.k_12,
                ),
                ADSizedBox(
                  width: context.k_12,
                ),
                Text(
                  (dutyFreeOrderState
                                  .dutyFreeCancelOrderDetailsResponseModel
                                  ?.orderDetail
                                  ?.dutyfreeDetail
                                  ?.passengerDetail
                                  .length ??
                              0) >
                          0
                      ? '$countryDialCode-${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.passengerDetail.first.mobile}'
                      : 'NA',
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.storyViewBarFillColor,
                  ),
                ),
              ],
            ),
            ADSizedBox(
              height: context.k_10,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  SvgAssets.dutyFreeMail,
                  width: context.k_16,
                  height: context.k_10,
                ),
                ADSizedBox(
                  width: context.k_12,
                ),
                Text(
                  (dutyFreeOrderState
                                  .dutyFreeCancelOrderDetailsResponseModel
                                  ?.orderDetail
                                  ?.dutyfreeDetail
                                  ?.passengerDetail
                                  .length ??
                              0) >
                          0
                      ? '${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.passengerDetail.first.emailId}'
                      : 'NA',
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.storyViewBarFillColor,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
