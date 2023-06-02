/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/tooltip_shape_border.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';


class LoyaltyPointsComponent extends StatelessWidget {
   LoyaltyPointsComponent({
    Key? key,
    this.points = 0,
    this.routeThankYou = false,
    this.customTextWidget,
    this.topMargin,
    this.bottomMargin,
    this.show2xIcon = false,
    this.routeConfirmation = false,
    this.isEarnPointsLoading = false,
    this.loyaltyShowScreenType,
  }) : super(key: key);

  final num points;
  final double? topMargin;
  final double? bottomMargin;
  final bool routeThankYou;
  final bool routeConfirmation;
  final bool show2xIcon;
  final LoyaltyShowScreenType? loyaltyShowScreenType;
  final bool isEarnPointsLoading;

  /// only required if user needs to display some custom string/widget on loyalty strip - ex: Flight SRP
  /// when custom widget is given, then [points] parameter becomes of no use
  final Widget? customTextWidget;

  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    const verticalOffset = 10.0;
    const badgeColor = Color(0xffF6F1FF);
    const lineHeight = 1.5;
    const blurRadius = 2.0;
    const opacity = 0.5;
    Analytics.flightBookingGAObject?[Parameters.rewards_earned.name] = points;
    return (points > 0 || isEarnPointsLoading)
        ? isEarnPointsLoading? ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            width: context.widthOfScreen,
            height: context.k_48,
          ): Container(
            margin:
                EdgeInsets.only(top: topMargin ?? 0, bottom: bottomMargin ?? 0),
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
            // padding: EdgeInsets.fromLTRB(
            //   context.k_16,
            //   context.k_4,
            //   context.k_16,
            //   context.k_4,
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   SvgAssets.coinIcon,
                //   height: context.k_24,
                //   width: context.k_24,
                //   //  fit: BoxFit.fill,
                // ),
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
                          if (routeThankYou)
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  text: '',
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
                                    TextSpan(
                                      text: 'are on the way!',
                                      style: ADTextStyle400.size14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (routeThankYou)
                            Tooltip(
                              verticalOffset: verticalOffset,
                              triggerMode: TooltipTriggerMode.tap,
                              preferBelow: false,
                              key: tooltipKey,
                              richMessage:

                                  // TextSpan(
                                  //   text:
                                  //       'Reward Points get credited\n on completion of the transaction.',
                                  //   style: ADTextStyle400.size12
                                  //       .setTextColor(
                                  //         context.adColors.whiteTextColor,
                                  //       )
                                  //       .copyWith(
                                  //         height: lineHeight,
                                  //       ),
                                  // ),

                                  TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          loyaltyShowScreenType != null &&
                                                  loyaltyShowScreenType ==
                                                      LoyaltyShowScreenType
                                                          .flight
                                              ? 'Reward Points get credited after\n 24 hrs of completion of your trip.'
                                              : loyaltyShowScreenType != null &&
                                                      loyaltyShowScreenType ==
                                                          LoyaltyShowScreenType
                                                              .dutyFree
                                                  ? 'Reward Points get credited\n after the pick-up of your order.'
                                                  : loyaltyShowScreenType !=
                                                              null &&
                                                          loyaltyShowScreenType ==
                                                              LoyaltyShowScreenType
                                                                  .pranaam
                                                      ? 'Reward Points get credited\n after you avail the service.'
                                                      : '',
                                          style: ADTextStyle400.size12
                                              .setTextColor(
                                                context.adColors.whiteTextColor,
                                              )
                                              .copyWith(
                                                height: lineHeight,
                                              ),
                                        ),
                                        Text(
                                          loyaltyShowScreenType != null
                                              ? 'T&Cs apply'
                                              : '',
                                          style: ADTextStyle400.size12
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
                              decoration: ShapeDecoration(
                                shape: const TooltipShapeBorder(
                                  arrowArc: 0.9,
                                  arrowHeight: 0,
                                  radius: 4,
                                ),
                                color: context.adColors.blackTextColor,
                                shadows: [
                                  BoxShadow(
                                    color: context.adColors.blackColor
                                        .withOpacity(opacity),
                                    blurRadius: blurRadius,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: context.k_20,
                                vertical: context.k_8,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.k_8,
                                  vertical: context.k_8,
                                ),
                                child: GestureDetector(
                                  onTap: () => toolTipTap(),
                                  child: Image.asset(
                                    'lib/assets/images/pranaam/information.png',
                                    width: context.k_16,
                                    height: context.k_16,
                                  ),
                                ),
                              ),
                            )
                          else if (routeConfirmation)
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  text: 'You have earned',
                                  style: ADTextStyle400.size14,
                                  children: [
                                    WidgetSpan(
                                      child: ADSizedBox(
                                        width: context.k_4,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '$points Reward Points!',
                                      style: ADTextStyle600.size14,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          else
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Earn',
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
                                    TextSpan(
                                      text: 'on this transaction',
                                      style: ADTextStyle400.size14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                ),
              ],
            ),
          )
        : const ADSizedBox.shrink();
  }

  bool? toolTipTap() {
    PranaamBookingGaAnalytics().rewardToolTipAnalyticsData();
    final showToolTip = tooltipKey.currentState?.ensureTooltipVisible();
    return showToolTip;
  }
}
