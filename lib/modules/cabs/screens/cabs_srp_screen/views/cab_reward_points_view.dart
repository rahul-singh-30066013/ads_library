/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/tooltip_view/tooltip_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const lineHeight = 1.5;

class CabRewardPointsView extends StatelessWidget {
  final num? loyaltyPoints;
  final String? loyaltyPercentage;
  final bool? isFromConfirmation;
  final bool? isEarnPointsLoading;
  final bool? isRewardEarned;

  const CabRewardPointsView({
    Key? key,
    this.loyaltyPercentage,
    this.loyaltyPoints,
    this.isFromConfirmation = false,
    this.isEarnPointsLoading = false,
    this.isRewardEarned = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const badgeColor = Color(0xffF6F1FF);

    return isEarnPointsLoading ?? false
        ? ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            width: context.widthOfScreen,
            height: context.k_48,
          )
        : Container(
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  context.k_4,
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
                  'lib/assets/images/loyalty/reward_point.json',
                  width: context.k_28,
                  fit: BoxFit.fitWidth,
                ),
                ADSizedBox(
                  width: context.k_8,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: RichText(
                          text: isFromConfirmation ?? false
                              ? isRewardEarned ?? false
                                  ? TextSpan(
                                      text: 'you_have_earned'.localize(context),
                                      style: ADTextStyle400.size14.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: ADSizedBox(
                                            width: context.k_4,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${loyaltyPercentage ?? loyaltyPoints} ${'reward_points'.localize(context)}!',
                                          style: ADTextStyle600.size14
                                              .setTextColor(
                                            context.adColors.blackTextColor,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: ADSizedBox(
                                            width: context.k_8,
                                          ),
                                        ),
                                      ],
                                    )
                                  : TextSpan(
                            text:
                                          '${loyaltyPercentage ?? loyaltyPoints} ${'reward_points'.localize(context)}',
                                      style: ADTextStyle600.size14.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: ADSizedBox(
                                            width: context.k_4,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'are_on_its_way'
                                              .localize(context),
                                          style: ADTextStyle400.size14
                                              .setTextColor(
                                            context.adColors.blackTextColor,
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: ADSizedBox(
                                            width: context.k_8,
                                          ),
                                        ),
                                      ],
                                    )
                              : TextSpan(
                            text: 'earn'.localize(context),
                                  style: ADTextStyle400.size14.setTextColor(
                                    context.adColors.blackTextColor,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: ADSizedBox(
                                        width: context.k_4,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${loyaltyPercentage ?? loyaltyPoints} ${'reward_points'.localize(context)}',
                                      style: ADTextStyle600.size14.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'transaction_points_ii'
                                          .localize(context),
                                      style: ADTextStyle400.size14.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      if (isFromConfirmation ?? false)
                        if (!(isRewardEarned ?? false))
                          TooltipScreen(
                              richTextMessage:
                                'reward_points_get_credited_after_completion_of_ride'
                                    .localize(context),
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
