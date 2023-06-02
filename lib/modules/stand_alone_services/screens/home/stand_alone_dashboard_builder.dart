/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/about_pranaam.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/footer_illustration.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/pranaam_home_tiles_item.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/video_card_service.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/ad_carousel_slider_with_button.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/circle_with_left_notification.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/how_it_works.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/home/views/banner_view.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/home/views/stand_alone_charges.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/home/views/stand_alone_faq.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/home/views/stand_alone_loyalty_dashboard_strip.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/home/views/stand_alone_tab.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/stand_alone_service_booking_form.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_dashboard_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

///this class is used to handle view of different type of pranaam screen.
const kCarousel = 'carousel_1dot2';
const kServiceBookingForm = 'serviceBookingForm';
const kHowItWorks = 'howItWorks';
const kHowItWorksSteps = 'howItWorkSteps';
const kPranaamPackage = 'pranaamPackage';
const kAddOnService = 'AddOnsService';
const kPorterService = 'porterService';
const kDepartureService = 'departureService';
const kVideoCard = 'videoCard';
const kCovidBanner = 'covidBanner';
const kHomeTileWidget = 'homeTileWidget';
const kFooterIllustration = 'footerIllustration'; //about pranaam
const kFlightBanner = 'flightBanner'; //bottomBanner
const kfaq = 'faqWidget';
const kLoyaltyStrip = 'loyaltyPoints';

///this class is used to handle view of different type on dashboard
class StandAloneDashboardBuilder extends StatelessWidget {
  const StandAloneDashboardBuilder({
    Key? key,
    required this.dashBoardItem,
    this.onTapHandler,
  }) : super(key: key);
  final ADTapCallbackWithValue? onTapHandler;
  final pranaam_dashboard.DashboardItem dashBoardItem;

  WidgetType getWidgetType(String value) {
    switch (value) {
      case kPranaamPackage:
        return WidgetType.pranaamPackage;
      case kCarousel:
        return WidgetType.carousel_1dot2;
      case kServiceBookingForm:
        return WidgetType.serviceBookingForm;
      case kPorterService:
        return WidgetType.porterService;
      case kDepartureService:
        return WidgetType.departureService;
      case kHowItWorks:
        return WidgetType.howItWorks;
      case kAddOnService:
        return WidgetType.addOnsService;
      case kVideoCard:
        return WidgetType.videoCard;
      case kCovidBanner:
        return WidgetType.covidBanner;
      case kHowItWorksSteps:
        return WidgetType.howItWorkSteps;
      case kFooterIllustration:
        return WidgetType.aboutPranaam;
      case kHomeTileWidget:
        return WidgetType.homeTileWidget;
      case kFlightBanner:
        return WidgetType.pranaamFooterIllustration;
      case kfaq:
        return WidgetType.faqWidget;
      case kLoyaltyStrip:
        return WidgetType.loyaltyStrip;
      default:
        return WidgetType.notAvailable;
    }
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final dashBoardState = context.read<StandAloneDashboardStateManagement>();
    final widgetType = getWidgetType(dashBoardItem.widgetType);
    adLog('Widget widgetType $widgetType', className: this);
    switch (widgetType) {
      case WidgetType.carousel_1dot2:
        return ADCarouselSliderWithButton(
          autoPlay: false,
          item: dashBoardItem,
          onTapHandler: dashBoardState.carouselOnTapHandler,
        );
      case WidgetType.serviceBookingForm:
        return StandAloneServiceBookingForm(
          item: dashBoardItem,
        );

      case WidgetType.howItWorkSteps:
        return StandAloneTab(
          pranaamDashboardItem: dashBoardItem,
        );

      case WidgetType.pranaamPackage:
        return StandAloneCharges(
          item: dashBoardItem,
        );

      case WidgetType.covidBanner:
        return BannerView(
          item: dashBoardItem,
        );

      case WidgetType.videoCard:
        return VideoCardService(
          item: dashBoardItem,
          onTapHandler: onTapHandler,
        );

      case WidgetType.howItWorks:
        return HowItWorks(
          contentData: dashBoardItem,
          children: (dashBoardItem.widgetItems).map((data) {
            return CircleWithLeftNotification(
              aspectRatio: dashBoardItem.aspectRatio,
              item: data,
              adTapCallback: () => {},
              //adTapCallback: () => _onHowItWorksTapHandler(data),
            );
          }).toList(),
        );
      case WidgetType.faqWidget:
        return StandAloneFaq(data: dashBoardItem);

      case WidgetType.pranaamFooterIllustration:
        return FooterIllustration(
          contentData: dashBoardItem,
        );

      case WidgetType.homeTileWidget:
        return PranaamHomeTilesItem(
          data: dashBoardItem,
          onTapHandler: (widgetItem) =>
              dashBoardState.homeTileOnTapHandler(widgetItem, context),
        );
      case WidgetType.loyaltyStrip:
        return StandAloneLoyaltyDashboardStrip(item: dashBoardItem);
      // StandAloneLoyaltyDashboardStrip(item: dashBoardItem);
      case WidgetType.aboutPranaam:
        return AboutPranaam(item: dashBoardItem);
      default:
        return const SizedBox.shrink();
    }
  }
}
