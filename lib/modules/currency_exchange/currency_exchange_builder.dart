import 'package:adani_airport_mobile/modules/currency_exchange/convert_unused_points.dart';
import 'package:adani_airport_mobile/modules/currency_exchange/currency_exchange_home_banner_tile.dart';
import 'package:adani_airport_mobile/modules/currency_exchange/currency_exchange_journey_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/faq_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to handle view of different type of pranaam screen.

const String loyaltyBannerLogIn = 'loyaltyHeroBanner';
const String loyaltyBannerNonLogIn = 'loyaltyHeroBannerloggedOutUser';
const String rewardJourneyLogIn = 'loyaltyRewardJurneyUser';
const String rewardJourneyNonLogIn = 'loyaltyRewardJurneyNewUser';
const String earn2X = 'loyaltyEarnR2X';
const String popularCategories = 'popularcategories';
const String terminals = 'Terminals';
const String referFriend = 'loyaltyReferFriend';
const String loyaltyFaq = 'LoyaltyFAQ';

class CurrencyExchangeBuilder extends StatelessWidget {
  CurrencyExchangeBuilder({
    Key? key,
    required this.title,
    required this.dashBoardItem,
  }) : super(key: key);

  final String title;
  final Fields dashBoardItem;

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

      case referFriend:
        return WidgetTypeEnum.referFriend;
      case loyaltyFaq:
        return WidgetTypeEnum.loyaltyFaq;
      case popularCategories:
        return WidgetTypeEnum.popularcategories;
      default:
        return WidgetTypeEnum.notAvailable;
    }
  }

  final double stackHeight = 430.sp;
  final double opacityValue = 0.3;
  final double listHeight = 506.sp;
  final double dutyFreeListHeight = 530.sp;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final widgetType = getWidgetType(title);
    switch (widgetType) {
      case WidgetTypeEnum.loyaltyBannerLogIn:
        return const ConvertUnUsedPoints().paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_16,
        );
      case WidgetTypeEnum.popularcategories:
        return const CurrencyExchangeHomeBannerTile().paddingBySide(
          top: context.k_48,
          left: context.k_16,
          right: context.k_16,
        );
      case WidgetTypeEnum.rewardJourneyLogIn:
        return ProfileSingleton.profileSingleton.isLoggedIn
            ? (dashBoardItem.widget.widgetItems.isNotEmpty
                ? Column(
                    children: [
                      ADSizedBox(
                        height: stackHeight,
                        child: CurrencyExchangeJourneyView(
                          dashboardItem: dashBoardItem.widget,
                        ),
                      ),
                    ],
                  )
                : const ADSizedBox.shrink())
            : const SizedBox.shrink();

      case WidgetTypeEnum.loyaltyFaq:
        return FAQView(
          field: dashBoardItem,
        ).paddingBySide(
          top: context.k_48,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
