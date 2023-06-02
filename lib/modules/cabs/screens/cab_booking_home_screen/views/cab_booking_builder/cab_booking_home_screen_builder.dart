/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/home_tiles_item.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/navigate_parameters_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/benefits_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/cab_booking_offer_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/faq_view_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/origin_change_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/top_video_and_title_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/video_widget_with_title.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/flight_banner_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

///this class is used to handle view of different type on dashboard
class CabBookingHomeScreenBuilder extends StatelessWidget {
  const CabBookingHomeScreenBuilder({
    Key? key,
    required this.cabBookingState,
    required this.dashBoardItem,
    required this.searchTap,
    required this.navigatorTap,
  }) : super(key: key);
  final CabBookingState cabBookingState;
  final DutyFreeDashboardItem dashBoardItem;
  final ADTapCallback searchTap;
  final ADGenericCallback<NavigateParametersModel> navigatorTap;

  WidgetType getWidgetType(String value) {
    adLog('Widget types $value');
    switch (value) {
      case kVideoWithTitleWidget:
        return WidgetType.videoWithTitleWidget;
      case kCabBenefitWidget:
        return WidgetType.cabBenefitWidget;
      case kSelectLocationDestinationWidget:
        return WidgetType.selectLocationDestinationWidget;
      case kOfferBannerWidget:
        return WidgetType.offerBannerWidget;
      case kCabVideoWidget:
        return WidgetType.cabVideoWidget;
      case kFaqWidget:
        return WidgetType.faqWidget;
      case kHomeTileWidget:
        return WidgetType.homeTileWidget;
      case kFlightBanner:
        return WidgetType.flightBanner;
      default:
        return WidgetType.image;
    }
  }

  void onHomeTileItemClicked(
    BuildContext context,
    DutyFreeItem value,
  ) {
    final model =
        context.read<CabBookingState>().selectedAirportTerminalDetailModel;
    if (model != null) {
      if (value.title == 'Cancellation') {
        CabGoogleAnalytics().sendGoogleAnalyticParameters(
          ClickEvents.cab_booking_lp_cancellation_policy,
          model,
        );
      }
      if (value.title == 'Terms and Conditions') {
        CabGoogleAnalytics().sendGoogleAnalyticParameters(
          ClickEvents.cab_booking_terms_and_condtitions,
          model,
        );
      }
    }

    navigateToScreenUsingNamedRouteWithArguments(
      context,
      webViewContainer,
      argumentObject: WebViewModel(
        title: value.title,
        url: Uri.encodeFull(value.ctaUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widgetType = getWidgetType(dashBoardItem.widgetType ?? '');
    adLog('Dashboard Rebuild');
    switch (widgetType) {
      case WidgetType.videoWithTitleWidget:
        return TopVideoAndTitleView(
          dashBoardItem: dashBoardItem,
        );
      case WidgetType.selectLocationDestinationWidget:
        return OriginChangeWidget(
          dashBoardItem: dashBoardItem,
          cabBookingState: cabBookingState,
          searchTap: searchTap,
          navigatorTap: navigatorTap,
        );
      case WidgetType.cabBenefitWidget:
        return BenefitsView(
          dashBoardItem: dashBoardItem,
        );
      case WidgetType.offerBannerWidget:
        return CabBookingOfferView(
          cabBookingState: cabBookingState,
          dutyFreeDashboardItem: dashBoardItem,
        );
      case WidgetType.cabVideoWidget:
        return VideoWidgetWithTitle(
          item: dashBoardItem,
          onTapHandler: (value) => {},
        );
      case WidgetType.faqWidget:
        return FAQViewWidget(
          data: dashBoardItem,
          onTapHandler: () => navigateToScreenUsingNamedRouteWithArguments(
            context,
            webViewContainer,
            argumentObject: WebViewModel(
              title: 'all_faq'.localize(context),
              url: Uri.encodeFull(
                dashBoardItem.actionTitle?.deeplink?.replaceAll(
                      '/faqs',
                      '${((cabBookingState.selectedAirportTerminalDetailModel?.airportPrefixName?.isNotEmpty ?? false) && (cabBookingState.selectedAirportTerminalDetailModel?.airportPrefixName != 'NA')) ? '/${cabBookingState.selectedAirportTerminalDetailModel?.airportPrefixName}' : ''}/faqs',
                    ) ??
                    '',
              ),
            ),
          ),
        );
      case WidgetType.homeTileWidget:
        return HomeTilesItem(
          data: dashBoardItem,
          onTapHandler: (value) => onHomeTileItemClicked(context, value),
        );
      case WidgetType.flightBanner:
        return FlightBannerView(
          contentData: dashBoardItem,
          onTapHandler: (value) => {},
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
