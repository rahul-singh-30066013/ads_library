/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/state_management/cab_traveller_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabBookingBillingView extends StatelessWidget {
  final CabTravellerDetailState cabTravellerDetailState;
  final ADTapCallback onTap;

  const CabBookingBillingView({
    Key? key,
    required this.cabTravellerDetailState,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        color: context.adColors.transparentColor,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${cabTravellerDetailState.updateCabBookingFormBuilder?.updateTravellerForm.gstAddress.controller.text.trim() ?? ''}, ${cabTravellerDetailState.updateCabBookingFormBuilder?.updateTravellerForm.city.controller.text.trim() ?? ''}, ${cabTravellerDetailState.updateCabBookingFormBuilder?.updateTravellerForm.state.controller.text.trim() ?? ''}, ${cabTravellerDetailState.updateCabBookingFormBuilder?.updateTravellerForm.country.controller.text.trim() ?? ''}, ${cabTravellerDetailState.updateCabBookingFormBuilder?.updateTravellerForm.pinCode.controller.text.trim() ?? ''}',
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.blackTextColor),
              ).paddingBySide(right: context.k_16),
            ),
            SvgPicture.asset(
              'lib/assets/images/svg/icons/duty_free/arrow.svg',
              color: context.adColors.darkGreyTextColor,
              width: context.k_6,
              height: context.k_12,
            ),
          ],
        ).paddingBySide(top: context.k_10),
      ),
    );
  }
}
