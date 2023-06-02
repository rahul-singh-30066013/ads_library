/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabPaymentModeView extends StatelessWidget {
  const CabPaymentModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cabBookingConfirmationState =
        context.read<CabBookingConfirmationState>();

    return Visibility(
      visible: cabBookingConfirmationState.commonOrderDetailBaseResponse
              ?.getOrderedPaymentModes()
              .isNotEmpty ??
          false,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.k_16,
        ),
        color: const Color(0xfffbfbfb),
        height: context.k_56,
        child: InkWell(
          onTap: () => {},
          child: Row(
            children: [
              SvgPicture.asset(
                'lib/assets/images/cab_booking/cab_payment_card.svg',
                height: context.k_15,
                width: context.k_22,
                fit: BoxFit.fill,
                color: context.adColors.greyTextColor,
              ),
              SizedBox(
                width: context.k_12,
              ),
              Text(
                'Paid with ${cabBookingConfirmationState.commonOrderDetailBaseResponse?.getOrderedPaymentModes() ?? ''}',
                style: ADTextStyle600.size16.setTextColor(
                  context.adColors.blackTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
