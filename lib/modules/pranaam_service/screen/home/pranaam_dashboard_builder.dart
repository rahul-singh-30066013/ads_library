/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/about_pranaam.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/departure_service.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/footer_illustration.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/porter_service.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/pranaam_home_tiles_item.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/straight_heart_service.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/video_card_service.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/ad_carousel_slider_with_button.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/ad_tab_view_pranaam.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/circle_with_left_notification.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/how_it_works.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/guest_package.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/service_booking_form.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
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
const kStraightHeart = 'straightHeart';
const kVideoCard = 'videoCard';
const kCovidBanner = 'covidBanner';
const kHomeTileWidget = 'homeTileWidget';
const kFooterIllustration = 'footerIllustration'; //about pranaam
const kFlightBanner = 'flightBanner'; //bottomBanner

///this class is used to handle view of different type on dashboard
class PranaamDashboardBuilder extends StatelessWidget {
  const PranaamDashboardBuilder({
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
      case kStraightHeart:
        return WidgetType.straightHeart;
      case kVideoCard:
        return WidgetType.videoCard;
      case kCovidBanner:
        return WidgetType.pranaamCovidBanner;
      case kHowItWorksSteps:
        return WidgetType.howItWorkSteps;
      case kFooterIllustration:
        return WidgetType.aboutPranaam;
      case kHomeTileWidget:
        return WidgetType.homeTileWidget;
      case kFlightBanner:
        return WidgetType.pranaamFooterIllustration;
      default:
        return WidgetType.notAvailable;
    }
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);

    final widgetType = getWidgetType(dashBoardItem.widgetType);
    adLog('Widget widgetType $widgetType', className: this);
    switch (widgetType) {
      case WidgetType.pranaamPackage:
        return GuestPackage(
          item: dashBoardItem,
          onTapHandler: onTapHandler,
        );
      case WidgetType.carousel_1dot2:
        //return ADCarousel(item: dashBoardItem, onTapHandler: onTapHandler);
        return ADCarouselSliderWithButton(
          item: dashBoardItem,
          onTapHandler: carouselTap,
        );
      case WidgetType.serviceBookingForm:
        return ServiceBookingForm(
          item: dashBoardItem,
          showImage: false,
        );

      // case WidgetType.pranaamCovidBanner:
      //   return PranaamCovidBanner(
      //     contentData: dashBoardItem,
      //     onTapHandler: onTapHandler,
      //   );
      case WidgetType.porterService:
        return PorterService(
          item: dashBoardItem,
          onTapHandler: onTapHandler,
        );

      case WidgetType.departureService:
        return DepartureService(
          item: dashBoardItem,
          onTapHandler: onTapHandler,
        );
      case WidgetType.straightHeart:
        return StraightHeartService(
          item: dashBoardItem,
          onTapHandler: onTapHandler,
        );

      case WidgetType.videoCard:
        return VideoCardService(
          item: dashBoardItem,
          onTapHandler: onTapHandler,
        );
      /*case WidgetType.addOnsService:
        return AddService(
          item: dashBoardItem,
          onTapHandler: onTapHandler,
        );*/

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

      case WidgetType.howItWorkSteps:
        return ADTabViewPranaam(
          pranaamDashboardItem: dashBoardItem,
        );

      case WidgetType.pranaamFooterIllustration:
        return FooterIllustration(
          contentData: dashBoardItem,
        );

      case WidgetType.homeTileWidget:
        return PranaamHomeTilesItem(
          data: dashBoardItem,
          onTapHandler: (widgetItem) =>
              homeTileOnTapHandler(widgetItem, context),
        );
      case WidgetType.aboutPranaam:
        return AboutPranaam(item: dashBoardItem);
      default:
        return const SizedBox.shrink();
    }
  }

/*void _onHowItWorksTapHandler(Item data) {
    final detail = TapDetail(
      objectID: data.actionId ?? 0,
      name: dashBoardItem.widgetType ?? '',
      subItem: data,
    );
    onTapHandler != null ? onTapHandler?.call(detail) : _onTapHandler();
  }*/

/*void _onTapHandler() {
    ///TODO
  }*/

  void homeTileOnTapHandler(widgetItem, BuildContext context) {
    const String helpAndSupport = '1001';
    const String feedback = '1002';
    const String rateUs = '1003';

    if (widgetItem != null) {
      final data = widgetItem as pranaam_dashboard.WidgetItem;
      switch (data.uniqueId) {
        case helpAndSupport:
          Utils.helpBottomSheet(context, data.contactDetail);
          break;
        case feedback:
          navigateToScreenUsingNamedRoute(
            context,
            customerFeedback,
          );
          break;
        case rateUs:
          Utils.openStore();
          break;
        default:
          adLog('Undefined Home Tile');
      }
    }
  }
  void carouselTap(pranaam_dashboard.DashboardItem item,BuildContext context,int index) {
    if (item.widgetItems[index].ctaText == 'Book Now') {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        serviceBookingScreen,
        argumentObject: [true, true],
      );
    }
    if (item.widgetItems[index].ctaText == 'How it Works') {
      openWebViewWithPranaamBook(
        context: context,
        title: 'how_it_works_pranaam'.localize(context),
        url: (item.widgetItems[index].ctaLink) + ('?isApp=true'),
      );
    }
    adLog('click event perform');
  }
}
