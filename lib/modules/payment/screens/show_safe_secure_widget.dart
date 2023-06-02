/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ShowSafeSecureWidget extends StatelessWidget {
  final PaymentMethodState paymentMethodViewModel;

  const ShowSafeSecureWidget({
    Key? key,
    required this.paymentMethodViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconFromAsset(
          iconPath: 'lib/assets/images/svg/icons/flight/safe-secure.svg',
          width: context.k_24,
          height: context.k_30,
        ).paddingBySide(
          right: context.k_12,
        ),
        Text(
          'safe_and_secure_payments'.localize(context),
          style: ADTextStyle500.size14.setTextColor(
            context.adColors.greyTextColor,
          ),
        ),
      ],
    ).paddingBySide(
      top: ((paymentMethodViewModel.isRedeemPointsChecked) &&
                  ((paymentMethodViewModel.checkLoyalityPoint) > 0) ||
              (!paymentMethodViewModel.isRedeemPointsChecked &&
                  ((paymentMethodViewModel.unCheckLoyalityPoint) > 0)))
          ? context.k_24
          : context.k_24,
      bottom: context.k_24,
    );
  }
}
