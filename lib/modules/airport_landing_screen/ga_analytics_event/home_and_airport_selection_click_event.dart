/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/analytics/user_property.dart';

///This class for Home and Airports selection click events calling.
class HomeAndAirportSelectionClickEvent {
  void airportSelectionAnalyticsData(String airportName, String label) {
    final airportSelectionObject = <String, Object?>{
      HomeAndAirportSelectionParameters.category.name: 'home_page',
      HomeAndAirportSelectionParameters.sub_category.name: 'airport_selection',
      HomeAndAirportSelectionParameters.business_unit.name: airportName,
      HomeAndAirportSelectionParameters.label.name: label,
    };
    HomeAndAirportSelectionClickEvents.airport_selection
        .logEvent(parameters: airportSelectionObject);

    final userProperty = <String, Object?>{
      HomeAndAirportSelectionParameters.business_unit.name: airportName,
    };
    UserProperty.user_property.set(value: userProperty);
  }

  void lobSelectionAnalyticsData(String lob) {
    final lobSelectionObject = <String, Object?>{
      HomeAndAirportSelectionParameters.category.name: 'home_page',
      HomeAndAirportSelectionParameters.sub_category.name: lob,
    };
    HomeAndAirportSelectionClickEvents.lob_selection
        .logEvent(parameters: lobSelectionObject);
  }

  void viewBannerSelectionAnalyticsData(
    String label,
    String bannerCategory,
  ) {
    final viewBannerSelectionObject = <String, Object?>{
      HomeAndAirportSelectionParameters.category.name: 'home_page',
      HomeAndAirportSelectionParameters.label.name: label,
      HomeAndAirportSelectionParameters.banner_category.name: bannerCategory,
    };
    HomeAndAirportSelectionClickEvents.view_banner
        .logEvent(parameters: viewBannerSelectionObject);
  }

  void viewBottomTilesSelectionAnalyticsData(
    String subCategory,
    String label,
  ) {
    final viewBottomTilesSelectionObject = <String, Object?>{
      HomeAndAirportSelectionParameters.category.name: 'home_page',
      HomeAndAirportSelectionParameters.sub_category.name: subCategory,
      HomeAndAirportSelectionParameters.label.name: label,
    };
    HomeAndAirportSelectionClickEvents.view_bottom_tiles
        .logEvent(parameters: viewBottomTilesSelectionObject);
  }
}
