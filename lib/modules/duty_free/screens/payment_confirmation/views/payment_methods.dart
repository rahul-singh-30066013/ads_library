/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/duty_payment_confirmation.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/payment_summary.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/expansiontile/ad_payment_option_tile.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

/// This class is used to show the all the payment methods with their corresponding child.
class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key, required this.dutyPaymentConfirmationModel})
      : super(key: key);

  final DutyPaymentConfirmation dutyPaymentConfirmationModel;

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int previousIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<PaymentOptions> dutyPaymentOptionsData =
        widget.dutyPaymentConfirmationModel.paymentOptions ?? [];
    final double expansionChildHeight = 200.sp;
    final double borderWidth = 0.3.sp;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.k_10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'paymentOptions'.localize(context),
            style: ADTextStyle700.size22,
          ),
          SizedBox(
            height: context.k_20,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.adColors.greyCircleColor,
                  width: context.scaled(borderWidth),
                ),
              ),
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              key: ValueKey(previousIndex), //attention
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dutyPaymentOptionsData.length,
              itemBuilder: (context, index) {
                return ADPaymentOptionTile(
                  isExpanded: previousIndex == index,
                  onExpandCallback: (value) => onPaymentTileClick(value, index),
                  icon: dutyPaymentOptionsData[index]
                      .images
                      .validateWithDefaultValue(),
                  paymentOptionType: dutyPaymentOptionsData[index]
                      .text
                      .validateWithDefaultValue(),
                  expansionChild: SizedBox(
                    width: double.infinity,
                    height: expansionChildHeight,
                    child: Center(
                      child: Text('hello'.localize(context)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onPaymentTileClick(value, int index) {
    if (value) {
      setState(() => previousIndex = index);
    } else {
      setState(() => previousIndex = -1);
    }
  }
}
