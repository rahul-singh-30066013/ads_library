/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/currency_exchange/corporate_emp_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/adani_rewards_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/airport_services_list.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/animated_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/duty_free_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/faq_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/loyalty_dashboard_header.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/loyalty_terminal_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/refer_and_earn_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/constants.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to handle view of different type of pranaam screen.
const String loyaltyBannerLogIn = 'loyaltyHeroBanner';
const String loyaltyBannerNonLogIn = 'loyaltyHeroBannerloggedOutUser';
const String rewardJourneyLogIn = 'loyaltyRewardJurneyUser';
const String rewardJourneyNonLogIn = 'loyaltyRewardJurneyNewUser';
const String earn2X = 'loyaltyEarnR2X';
const String popularcategories = 'popularcategories';
const String terminals = 'Terminals';
const String referFriend = 'loyaltyReferFriend';
const String loyaltyFaq = 'LoyaltyFAQ';
const String giftVoucher = 'giftVoucher';

///this class is used to handle view of different type on dashboard
class LoyaltyDashboardBuilder extends StatelessWidget {
  LoyaltyDashboardBuilder({
    Key? key,
    required this.title,
    required this.dashBoardItem,
    required this.loyaltyHistoryProvider,
  }) : super(key: key);

  final Fields dashBoardItem;
  final String title;
  final LoyaltyStateManagement loyaltyHistoryProvider;

  WidgetTypeEnum getWidgetType(String value) {
    switch (value) {
      case loyaltyBannerLogIn:
        return WidgetTypeEnum.loyaltyBannerLogIn;
      case loyaltyBannerNonLogIn:
        return WidgetTypeEnum.loyaltyBannerNonLogIn;
      case rewardJourneyLogIn:
        return WidgetTypeEnum.rewardJourneyLogIn;
      case rewardJourneyNonLogIn:
        return WidgetTypeEnum.rewardJourneyNonLogIn;
      case earn2X:
        return WidgetTypeEnum.earn2X;
      case terminals:
        return WidgetTypeEnum.Terminals;
      case giftVoucher:
        return WidgetTypeEnum.giftVoucher;
      case referFriend:
        return WidgetTypeEnum.referFriend;
      case loyaltyFaq:
        return WidgetTypeEnum.loyaltyFaq;
      case popularcategories:
        return WidgetTypeEnum.popularcategories;
      default:
        return WidgetTypeEnum.notAvailable;
    }
  }

  final double stackHeight = 430.sp;
  final double opacityValue = 0.3;
  final double listHeight = 506.sp;
  final double dutyFreeListHeight = 530.sp;

  ///TODO add in style
  // static const _cardColor = Color(0xff4b2885);
  static const _purpleShadeDark = Color(0xff371967);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final widgetType = getWidgetType(title);

    adLog('Widget widgetType $widgetType');
    switch (widgetType) {
      case WidgetTypeEnum.loyaltyBannerLogIn:
        return ProfileSingleton.profileSingleton.isLoggedIn
            ? (dashBoardItem.widget.widgetItems.isNotEmpty
                ? LoyaltyDashboardHeader(
                    data: dashBoardItem.widget.widgetItems.first,
                    loyaltyHistoryProvider: loyaltyHistoryProvider,
                  )
                : const ADSizedBox.shrink())
            : const SizedBox.shrink();
      case WidgetTypeEnum.giftVoucher:
        return ProfileSingleton.profileSingleton.isLoggedIn
            ? (dashBoardItem.widget.widgetItems.isNotEmpty
                ? CorporateEmpView(
                    widgetItem: dashBoardItem.widget.widgetItems.first,
                  ).paddingBySide(
                    top: context.k_24,
                    right: context.k_16,
                    left: context.k_16,
                  )
                : const ADSizedBox.shrink())
            : const SizedBox.shrink();
      case WidgetTypeEnum.loyaltyBannerNonLogIn:
        return ProfileSingleton.profileSingleton.isLoggedIn
            ? const SizedBox.shrink()
            : (dashBoardItem.widget.widgetItems.isNotEmpty
                ? LoyaltyDashboardHeader(
                    data: dashBoardItem.widget.widgetItems.first,
                    loyaltyHistoryProvider: loyaltyHistoryProvider,
                  )
                : const ADSizedBox.shrink());
      case WidgetTypeEnum.rewardJourneyLogIn:
        return ProfileSingleton.profileSingleton.isLoggedIn
            ? (dashBoardItem.widget.widgetItems.isNotEmpty
                ? Column(
                    children: [
                      ADSizedBox(
                        height: stackHeight,
                        child: AdaniRewardsView(
                          dashboardItem: dashBoardItem.widget,
                        ),
                      ),
                    ],
                  )
                : const ADSizedBox.shrink())
            : const SizedBox.shrink();
      case WidgetTypeEnum.rewardJourneyNonLogIn:
        return ProfileSingleton.profileSingleton.isLoggedIn
            ? const SizedBox.shrink()
            : (dashBoardItem.widget.widgetItems.isNotEmpty
                ? Column(
                    children: [
                      ADSizedBox(
                        height: stackHeight,
                        child: AdaniRewardsView(
                          dashboardItem: dashBoardItem.widget,
                        ),
                      ),
                    ],
                  )
                : const ADSizedBox.shrink());

      case WidgetTypeEnum.earn2X:
        return context.read<DutyFreeState>().terminalList.isNotEmpty
            ? Column(
                children: [
                  // ADSizedBox(
                  //   width: double.infinity,
                  //   height: context.k_4,
                  //   child: Stack(
                  //     clipBehavior: Clip.none,
                  //     alignment: Alignment.center,
                  //     children: [
                  //       // AnimatedView(
                  //       //   animationType: Constants.animationTypeLeft,
                  //       //   path: SvgAssets.zigzagIcon,
                  //       //   height: context.k_8,
                  //       //   color: _purpleShadeDark,
                  //       // ),
                  //       AnimatedView(
                  //       //   animationType: Constants.animationTypeTop,
                  //       //   path: SvgAssets.ractangleDotIcon,
                  //       //   height: context.k_56,
                  //       //   right: -context.k_30,
                  //       //   color: _cardColor.withOpacity(
                  //       //     opacityValue,
                  //       //   ),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  Stack(
                    children: [
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Text(
                      //         'earn_2x_rewards'.localize(context),
                      //         style: ADTextStyle700.size20.setTextColor(
                      //           context.adColors.blackTextColor,
                      //         ),
                      //       ),
                      //     ),
                      //     // InkWell(
                      //     //   onTap: () => adLog('button clicked'),
                      //     //   child: Text(
                      //     //     'see_all'.localize(context),
                      //     //     style: ADTextStyle400.size14
                      //     //         .setTextColor(
                      //     //           context.adColors.blackTextColor,
                      //     //         )
                      //     //         .copyWith(
                      //     //           decoration: TextDecoration.underline,
                      //     //         ),
                      //     //     textAlign: TextAlign.end,
                      //     //   ),
                      //     // ),
                      //   ],
                      // ).paddingBySide(
                      //   left: context.k_16,
                      //   right: context.k_16,
                      //   //  bottom: context.k_10,
                      // ),
                      if (dashBoardItem.widget.widgetItems.isNotEmpty)
                        ADSizedBox(
                          //height: dutyFreeListHeight,
                          width: double.infinity,
                          child: DutyFreeView(
                            dashboardItem: dashBoardItem.widget,
                          ),
                        )
                      else
                        const ADSizedBox.shrink(),
                    ],
                  ),
                ],
              )
            : const SizedBox.shrink();

      case WidgetTypeEnum.popularcategories:
        return dashBoardItem.widget.widgetItems.isNotEmpty
            ? Column(
                children: [
                  ADSizedBox(
                    height: context.k_24,
                  ),
                  ADSizedBox(
                    width: double.infinity,
                    height: context.k_10,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.centerLeft,
                      children: [
                        AnimatedView(
                          animationType: Constants.animationTypeLeft,
                          path: SvgAssets.zigzagIcon,
                          height: context.k_10,
                          color: _purpleShadeDark,
                        ),
                        // AnimatedView(
                        //   animationType: Constants.animationTypeTop,
                        //   path: SvgAssets.ractangleDotIcon,
                        //   height: context.k_56,
                        //   right: -context.k_30,
                        //   color: _cardColor.withOpacity(
                        //     opacityValue,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  AirportServicesList(
                    dashboardItem: dashBoardItem.widget,
                  ),
                ],
              )
            : const ADSizedBox.shrink();

      case WidgetTypeEnum.Terminals:
        return context.read<DutyFreeState>().terminalList.isNotEmpty
            ? (dashBoardItem.widget.widgetItems.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ADSizedBox(
                        height: context.k_40,
                      ),
                      Text(
                        'earn_2x_rewards'.localize(context),
                        style: ADTextStyle700.size22.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      LoyaltyTerminalView(
                        widgetItems: dashBoardItem.widget.widgetItems.first,
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    //  bottom: context.k_10,
                  )
                : const ADSizedBox.shrink())
            : const ADSizedBox.shrink();

      case WidgetTypeEnum.referFriend:
        return ReferAndEarnView(
          dashboardItem: dashBoardItem.widget,
          loyaltyHistoryProvider: loyaltyHistoryProvider,
        );
      case WidgetTypeEnum.loyaltyFaq:
        return FAQView(
          field: dashBoardItem,
        ).paddingBySide(
          top: context.k_36,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
