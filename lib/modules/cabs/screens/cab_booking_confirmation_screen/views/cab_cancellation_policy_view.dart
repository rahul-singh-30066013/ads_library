/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/important_information_bottom_sheet_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabCancellationPolicyView extends StatelessWidget {
  final CabBookingConfirmationState cabBookingConfirmationState;

  const CabCancellationPolicyView({
    Key? key,
    required this.cabBookingConfirmationState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.adColors.containerGreyBg,
          height: context.k_8,
          thickness: context.k_8,
        ),
        InkWell(
          onTap: () => {
            CabGoogleAnalytics()
                .sendGAParametersCabBookingCancellationPolicyView(
              cabBookingConfirmationState,
            ),
            adShowBottomSheet(
              context: context,
              childWidget: ImportantInformationBottomSheetView(
                carInfoDetail: cabBookingConfirmationState
                    .filteredVendorDataResponseModel?.result?.infoDetails,
                initialIndex: 1,
              ),
              headerTitle: 'cab_cancellation_policy'.localize(context),
            ),
          },
          child: SizedBox(
            height: context.k_64 + context.k_4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'cab_cancellation_policy'.localize(context),
                  style: ADTextStyle600.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.adColors.blackTextColor,
                  size: context.k_16,
                ),
              ],
            ),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        ),
        Divider(
          color: context.adColors.containerGreyBg,
          height: context.k_8,
          thickness: context.k_8,
        ),
      ],
    );
  }
}
