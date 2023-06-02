/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/tooltip_view/tooltip_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const lineHeight = 1.5;

class PranaamLoyalityPoints extends StatelessWidget {
  const PranaamLoyalityPoints({
    Key? key,
    required this.points,
    this.routeThankYou = false,
    this.customTextWidget,
    this.show2xIcon = false,
  }) : super(key: key);

  final String points;
  final bool routeThankYou;
  final bool show2xIcon;

  /// only required if user needs to display some custom string/widget on loyalty strip - ex: Flight SRP
  /// when custom widget is given, then [points] parameter becomes of no use
  final Widget? customTextWidget;

  @override
  Widget build(BuildContext context) {
    const badgeColor = Color(0xffF6F1FF);
    return Container(
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            customTextWidget != null ? 0 : context.k_4,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: context.k_8,
        horizontal: context.k_10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            routeThankYou
                ? show2xIcon
                    ? 'lib/assets/images/loyalty/reward_point_2x.json'
                    : 'lib/assets/images/loyalty/reward_point_1x.json'
                : 'lib/assets/images/loyalty/reward_point.json',
            width: context.k_28,
            height: context.k_34,
            fit: BoxFit.cover,
          ),
          ADSizedBox(
            width: context.k_6,
          ),
          Expanded(
            child: customTextWidget ??
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: routeThankYou ? '' : 'Earn',
                          style: ADTextStyle400.size14,
                          children: [
                            WidgetSpan(
                              child: ADSizedBox(
                                width: context.k_4,
                              ),
                            ),
                            TextSpan(
                              text: '$points Reward Points',
                              style: ADTextStyle600.size14,
                            ),
                            WidgetSpan(
                              child: ADSizedBox(
                                width: context.k_4,
                              ),
                            ),
                            if (routeThankYou)
                              TextSpan(
                                text: 'are on the way!',
                                style: ADTextStyle400.size14,
                              )
                            else
                              TextSpan(
                                text: 'on this transaction',
                                style: ADTextStyle400.size14,
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (routeThankYou)
                      TooltipScreen(
                        richTextMessage:
                            'Reward Points get credited on completion of the transaction. T&Cs apply',
                        textStyleMessage: ADTextStyle400.size12
                            .setTextColor(
                              context.adColors.whiteTextColor,
                            )
                            .copyWith(
                              height: lineHeight,
                            ),
                      ),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}
