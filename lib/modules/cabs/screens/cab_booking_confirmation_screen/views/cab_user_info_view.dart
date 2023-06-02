/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabUserInfoView extends StatelessWidget {
  const CabUserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cabBookingConfirmationState =
        context.read<CabBookingConfirmationState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'details_sent_to'.localize(context),
          style: ADTextStyle700.size22.setTextColor(
            context.adColors.filterBlackText,
          ),
        ),
        SizedBox(
          height: context.k_20,
        ),
        Text(
          'mobileNumber'.localize(context),
          style: ADTextStyle400.size14.setTextColor(
            context.adColors.darkGreyTextColor,
          ),
        ),
        SizedBox(
          height: context.k_4,
        ),
        Text(
          '${cabBookingConfirmationState.cabOrderDetailResponseModel?.contactDetails?.countryCode?.isNotEmpty ?? false ? '${cabBookingConfirmationState.cabOrderDetailResponseModel?.contactDetails?.countryCode} - ' : ''}${cabBookingConfirmationState.cabOrderDetailResponseModel?.contactDetails?.mobileNumber}',
          style: ADTextStyle600.size16.setTextColor(
            context.adColors.storyViewBarFillColor,
          ),
        ),
        Visibility(
          visible: (cabBookingConfirmationState
                      .cabOrderDetailResponseModel?.contactDetails?.email ??
                  '')
              .isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.k_20,
              ),
              Text(
                'emailID'.localize(context),
                style: ADTextStyle400.size14.setTextColor(
                  context.adColors.darkGreyTextColor,
                ),
              ),
              SizedBox(
                height: context.k_4,
              ),
              Text(
                cabBookingConfirmationState
                        .cabOrderDetailResponseModel?.contactDetails?.email ??
                    '',
                style: ADTextStyle600.size16.setTextColor(
                  context.adColors.storyViewBarFillColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
