/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cancellation_screen_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabCancelView extends StatelessWidget {
  const CabCancelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cabBookingConfirmationState =
        context.read<CabBookingConfirmationState>();
    return InkWell(
      onTap: () => {
        CabGoogleAnalytics().sendGAParametersCabBookingCancelButton(
          cabBookingConfirmationState,
        ),
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          cabBookingCancellationScreen,
          argumentObject: CancellationScreenNavigateModel(
            successCallBack: () => {
              context.read<CabBookingConfirmationState>().isFromPayment = true,
              cabBookingConfirmationState.getCabBookingOrderDetails(
                context: context,
              ),
            },
            infoDetails: cabBookingConfirmationState
                .filteredVendorDataResponseModel?.result?.infoDetails,
            orderReferenceId: cabBookingConfirmationState
                    .commonOrderDetailBaseResponse?.orderReferenceId ??
                '',
            cabOrderDetailResponseModel:
                cabBookingConfirmationState.cabOrderDetailResponseModel,
            currencyCode: cabBookingConfirmationState
                .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
          ),
        ),
      },
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                SvgAssets.cancelDutyFree,
                color: context.adColors.greyTextColor,
                height: context.k_16,
                width: context.k_16,
              ).paddingBySide(left: context.k_2),
              SizedBox(
                width: context.k_12,
              ),
              Text(
                'cancel'.localize(context),
                style: ADTextStyle500.size16.setTextColor(
                  context.adColors.blackTextColor,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: context.k_18,
              ),
            ],
          ).paddingBySide(top: context.k_16, bottom: context.k_16),
          Divider(
            color: context.adColors.tileBorderColor,
            height: 1.sp,
            thickness: 1.sp,
          ),
        ],
      ),
    );
  }
}
