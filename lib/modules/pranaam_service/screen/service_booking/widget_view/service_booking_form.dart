/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/booking_screen_controller.dart';
import 'package:flutter/material.dart';

/// this class is used for Booking service in Pranaam DashBoard
class ServiceBookingForm extends StatefulWidget {
  const ServiceBookingForm({
    Key? key,
    this.showImage = true,
    this.fromDashboard = false,
    this.item,
  }) : super(key: key);

  /// used for showing close image default value is true.
  final bool showImage;
  final bool fromDashboard;

  /// dashboard item currently used for setting padding.
  final pranaam_dashboard.DashboardItem? item;
  @override
  BookingScreenController createState() => BookingScreenController();
}
