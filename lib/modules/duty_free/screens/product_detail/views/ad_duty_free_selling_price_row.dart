/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

///[ADDutyFreeSellingPriceRow] is used for item Selling Price
class ADDutyFreeSellingPriceRow extends StatelessWidget {
  static const opacity = 0.699999988079071;

  const ADDutyFreeSellingPriceRow({
    Key? key,
    required this.productSellingPrice,
    required this.off,
    required this.context,
    required this.inStock,
  }) : super(key: key);

  final num productSellingPrice;
  final int off;
  final BuildContext context;
  final bool inStock;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: inStock ? 1 : opacity,
      child: Row(
        children: [
          if (productSellingPrice > 0)
            Text(
              FlightUtils.getPriceFormatWithSymbol(
                price: productSellingPrice.toDouble(),
              ),
              key: const Key(
                DutyFreeCartAutomationKeys.dutyFreeSellingPrice,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ADTextStyle700.size16,
              textAlign: TextAlign.left,
            )
          else
            const SizedBox.shrink(),
          SizedBox(
            width: context.k_6,
          ),
          if (off > 0)
            Text(
              '$off${'offLabel'.localize(context)}',
              key: const Key(
                DutyFreeCartAutomationKeys.dutyFreeSellingOfferPrice,
              ),
              style: ADTextStyle600.size12
                  .setTextColor(context.adColors.priceOffGreen),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
