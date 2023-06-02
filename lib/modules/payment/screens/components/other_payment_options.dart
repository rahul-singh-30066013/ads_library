import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class OtherPaymentOptions extends StatelessWidget {
  const OtherPaymentOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: context.k_6,
          color: context.adColors.containerGreyBg,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'paymentOptions'.localize(context),
              style: ADTextStyle700.size18.setTextColor(
                context.adColors.black,
              ),
            ),
            SizedBox(
              height: context.k_30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.credit_card_sharp,
                      color: context.adColors.blackShade500,
                      size: context.k_22,
                    ),
                    SizedBox(
                      width: context.k_17,
                    ),
                    Text(
                      'pay_using_other_methods'.localize(context),
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.black,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.adColors.darkGreyTextColor,
                  size: context.k_16,
                ),
              ],
            ),
            SizedBox(
              height: context.k_4,
            ),
            Text(
              "${'coupon'.localize(context)}${'would_not_be_applicable'.localize(context)}",
              style: ADTextStyle400.size14.setTextColor(
                context.adColors.black,
              ),
            ).paddingBySide(
              left: context.k_38,
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_30,
          bottom: context.k_30,
        ),
      ],
    );
  }
}
