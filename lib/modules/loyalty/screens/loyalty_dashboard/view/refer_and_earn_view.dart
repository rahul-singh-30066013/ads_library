/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to provide refer and earn banner section view on loyalty dashboard
class ReferAndEarnView extends StatelessWidget {
  final DashboardItem dashboardItem;
  final LoyaltyStateManagement loyaltyHistoryProvider;
  const ReferAndEarnView({
    Key? key,
    required this.dashboardItem,
    required this.loyaltyHistoryProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///local varibales
    final double circlePositionFromLeft = -70.sp;
    final double purpleCircleHeight = 184.sp;
    final double k_114 = 114.sp;
    final double _k_156 = 156.sp;
    const double opacityValue = 0.3;
    const double lineSpacing = 1.4;

    ///Todo add to styles
    const _cardColor = Color(0xff4b2885);
    const _oragngeTextColor = Color(0xfffbcf42);

    return Stack(
      children: [
        Positioned(
          left: circlePositionFromLeft,
          top: context.k_20,
          child: Image.asset(
            'lib/assets/images/loyalty/dot_cirlce.png',
            height: purpleCircleHeight,
            color: _cardColor,
          ),
        ),
        Positioned(
          right: -context.k_60,
          top: _k_156,
          child: SvgPicture.asset(
            'lib/assets/images/svg/icons/loyalty/rectangle_dot.svg',
            height: k_114,
            color: _cardColor.withOpacity(
              opacityValue,
            ),
          ),
        ),
        Column(
          children: [
            ADSizedBox(
              height: context.k_60,
            ),
            TouchableOpacity(
              onTap: () => navigateToReferScreen(context),
              child: Stack(
                children: [
                  Image.network(
                    dashboardItem.widgetItems.first.mobileImage,
                    fit: BoxFit.cover,
                    // height: _referBannerHeight,
                    // width: context.widthOfScreen,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ADSizedBox(
                        height: context.k_24,
                      ),
                      Text(
                        dashboardItem.widgetItems.first.title,
                        style: ADTextStyle600.size18.setTextColor(
                          _oragngeTextColor,
                        ),
                      ),
                      ADSizedBox(
                        height: context.k_10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          dashboardItem.widgetItems.first.descriptionApp
                              .replaceAll(r'\n', '\n'),
                          textAlign: TextAlign.left,
                          style: ADTextStyle400.size14
                              .setTextColor(
                                context.adColors.whiteTextColor,
                              )
                              .copyWith(
                                height: lineSpacing,
                              ),
                        ),
                      ),
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      Container(
                        width: k_114,
                        //  height: _referButtonHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              context.k_18,
                            ),
                          ),
                          color: context.adColors.whiteTextColor,
                        ),
                        child: Center(
                          child: Text(
                            dashboardItem.widgetItems.first.ctaText,
                            style: ADTextStyle600.size14.setTextColor(
                              context.adColors.blackColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ).paddingAllSide(
                          context.k_12,
                        ),
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_16,
                  ),
                ],
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
                bottom: context.k_60,
              ),
            ),
            // const FAQView(),
          ],
        ),
      ],
    );
  }

  void navigateToReferScreen(
    BuildContext context,
  ) {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      navigateToScreenUsingNamedRoute(
        context,
        loyaltyReferEarn,
      );
      // if (showPopup) {
      //   Future.delayed(
      //     const Duration(milliseconds: 10),
      //     () => LoyaltyDiaglogScreen.showLoadingDialog(context, noButton: true),
      //   );
      // }
    } else {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          isLoginStatusTap: (value) =>
              value ? navigateWithLogin(context) : null,
          popUpRequired: true,
          isNotFromSplash: true,
        ),
      );
    }
  }

  /// GA event method
  void gaEvents() {
    final map = {
      Parameters.category.name: 'rewards',
      Parameters.sub_category.name: 'referral',
      Parameters.label.name: dashboardItem.widgetItems.first.title,
      Parameters.type.name: '',
      Parameters.banner_category.name: 'Refer Now',
    };
    ClickEvents.view_banner.logEvent(parameters: map);
  }

  void navigateWithLogin(BuildContext context) {
    loyaltyHistoryProvider.getBalance();
    Future.delayed(
      const Duration(milliseconds: 5),
      () => navigateToReferScreen(context),
    );
  }
}
