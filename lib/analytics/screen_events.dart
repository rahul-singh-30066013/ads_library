/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: constant_identifier_names
import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:webengage_flutter/webengage_flutter.dart';

///These values will be used to send as screen names to analytics tool.
enum ScreenEvents {
  ///Screen Routes
  flight_listing_screen,
  traveller_details,
  payments,
  login_screen,
  otp_verification,
  review_flight_details,
  flight_booking_screen,
  home_page,
  flight_not_available,

  ///Duty free screen
  catalog_list_screen,
  product_detail_screen,
  cart_screen,
  customer_information_screen,
  order_booking_screen,
  all_order_screen,
  shopping_order_screen,
  booking_order_screen,
  order_confirmation_screen,

  ///Pranaam Screen
  booking_form_screen,
  edit_booking_screen,
  select_package_screen,
  guests_detail_screen,
  apply_coupon_screen,
  pranaam_confirmation_screen,

  ///Porter screen
  porter_confirmation_screen,

  ///Wheel chair screen
  wheel_chair_confirmation_screen,
}

extension ScreenExtension on ScreenEvents {
  void log() {
    Analytics().logScreen(screen: name);
    WebEngagePlugin.trackScreen(name);
  }
}
