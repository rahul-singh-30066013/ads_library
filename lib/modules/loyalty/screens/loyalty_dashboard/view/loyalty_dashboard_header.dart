/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/screen_helper/automation_keys/loyalty_automation_keys.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/dashboard_header_background_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/offers_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/reward_points_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/shimmer_widget.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to show loyalty dashboard
class LoyaltyDashboardHeader extends StatefulWidget {
  const LoyaltyDashboardHeader({
    Key? key,
    required this.data,
    required this.loyaltyHistoryProvider,
  }) : super(key: key);

  final WidgetItem data;
  final LoyaltyStateManagement loyaltyHistoryProvider;

  @override
  State<LoyaltyDashboardHeader> createState() => _LoyaltyDashboardHeaderState();
}

///animation global variables used within the sub view/classes
Animation<double>? wAnimation;
AnimationController? wAnimationController;

class _LoyaltyDashboardHeaderState extends State<LoyaltyDashboardHeader>
    with TickerProviderStateMixin {
  /// local variables for size,count etc
  final int k_2 = 2;
  final double k_114 = 114.sp;
  final double k_78 = 78.sp;
  final int maxLines = 3;
  final double shimmerHeight = 140.sp;
  final double _joinButtonHeight = 40.sp;
  final double _joinButtonWidth = 116.sp;
  final double gifHeight = 440.sp;
  final double _imgHeight = 44.sp;

  ///TODO add in style
  static const _cardColor = Color(0xff4b2885);
  // static const _backColor = Color(0xfffcf6ff);
  static const _textBackColor = Color(0xffffe8e8);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            /// lottie animation view
            Stack(
              alignment: Alignment.center,
              children: [
                DashBoardHeaderBackgroundView(
                  appImageSrc: widget.data.appImageSrc,
                ),
              ],
            ),
            if (widget.loyaltyHistoryProvider.isAbsorbing)
              const ShimmerWidget(),

            if (ProfileSingleton.profileSingleton.isLoggedIn &&
                !widget.loyaltyHistoryProvider.isAbsorbing)
              ADSizedBox(
                height: context.k_10,
              ),
            RewardPointsView(
              widgetItems: widget.data,
              loyaltyHistoryProvider: widget.loyaltyHistoryProvider,
            ),
            if (!ProfileSingleton.profileSingleton.isLoggedIn)
              Container(
                // color: _backColor,
                width: double.infinity,
                padding: EdgeInsets.only(top: context.k_10),
                child: Stack(
                  children: [
                    Positioned(
                      top: context.k_48,
                      left: context.k_18,
                      child: Transform.rotate(
                        angle: Constants.rotationAngle,
                        child: SvgPicture.asset(
                          SvgAssets.icLeftCoin,
                          height: context.k_18,
                          width: context.k_16,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: context.k_30,
                      right: context.k_30,
                      child: Transform.rotate(
                        angle: Constants.rotationAngle,
                        child: SvgPicture.asset(
                          SvgAssets.icRightCoin,
                          height: context.k_18,
                          width: context.k_16,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            widget.data.title,
                            style: ADTextStyle700.size26.setTextColor(
                              _cardColor,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: maxLines,
                            overflow: TextOverflow.ellipsis,
                          ).paddingBySide(
                            left: context.k_48,
                            right: context.k_48,
                          ),
                        ),
                        ADSizedBox(
                          height: context.k_10,
                        ),
                        if (AppConstantRemote()
                                .appConstantRemoteModel
                                ?.isRewardEnabled ??
                            false)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                //TODO Use from dictionary
                                'new_users_get'.localize(context),
                                style: ADTextStyle400.size14.setTextColor(
                                  _cardColor,
                                ),
                                maxLines: maxLines,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Text(
                              //   '100',
                              //   style: ADTextStyle500.size14
                              //       .copyWith(
                              //         backgroundColor: _textBackColor,
                              //       )
                              //       .setTextColor(
                              //         _cardColor,
                              //       ),
                              //   maxLines: maxLines,
                              //   overflow: TextOverflow.ellipsis,
                              // ).paddingBySide(
                              //   left: context.k_2,
                              // ),
                              Text(
                                'welcome_points'.localize(context),
                                style: ADTextStyle400.size14
                                    .copyWith(
                                      backgroundColor: _textBackColor,
                                    )
                                    .setTextColor(
                                      _cardColor,
                                    ),
                                maxLines: maxLines,
                                overflow: TextOverflow.ellipsis,
                              ).paddingBySide(
                                right: context.k_2,
                              ),
                            ],
                          ),
                        if (AppConstantRemote()
                                .appConstantRemoteModel
                                ?.isRewardEnabled ??
                            false)
                          ADSizedBox(
                            height: context.k_22,
                          ),
                        ADSizedBox(
                          width: _joinButtonWidth,
                          height: _joinButtonHeight,
                          child: ElevatedButton(
                            key: const Key(
                              LoyaltyAutomationKeys.knowMorekey,
                            ),
                            onPressed: () => {
                              gaEvents(),
                              navigateToScreenUsingNamedRouteWithArguments(
                                context,
                                signInScreen,
                                argumentObject: SignInStatusModel(
                                  isNotFromSplash: true,
                                  popUpRequired: true,
                                  isLoginStatusTap: (value) => value
                                      ? widget.loyaltyHistoryProvider
                                          .getBalance()
                                      : null,
                                ),
                              ),
                            },
                            style: ElevatedButton.styleFrom(
                              primary: context.adColors.whiteTextColor,
                              onPrimary: context.adColors.blackColor,
                              shape: const StadiumBorder(),
                              elevation: 0,
                              onSurface: context.adColors.blackColor,
                              side: const BorderSide(
                                color: _cardColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                widget.data.ctaText,
                                style: ADTextStyle600.size14.setTextColor(
                                  _cardColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ).paddingAllSide(
                              context.k_8,
                            ),
                          ),
                        ),
                        // ADSizedBox(
                        //   height: context.k_22,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ADSizedBox(
              height: context.k_32,
            ),

            /// Earn 3% and redeem 100% view
            Row(
              children: [
                OffersView(
                  title: widget.data.rewardList.first.title,
                  subTitle: widget.data.rewardList.first.description,
                  img: widget.data.rewardList.first.standerdImageUrl,
                ),
                ADSizedBox(
                  width: context.k_12,
                ),
                OffersView(
                  title: widget.data.rewardList[1].title,
                  subTitle: widget.data.rewardList[1].description,
                  img: widget.data.rewardList[1].standerdImageUrl,
                  imgHeight: _imgHeight,
                ),
              ],
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
          ],
        ),
      ],
    );
  }

  /// GA event method
  void gaEvents() {
    final map = {
      Parameters.category.name: 'rewards',
      Parameters.sub_category.name: 'sign_in',
    };
    ClickEvents.rewards_joins_now.logEvent(parameters: map);
  }
}
