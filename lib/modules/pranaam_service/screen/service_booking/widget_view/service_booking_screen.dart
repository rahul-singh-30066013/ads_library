/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/pranaam_dashboard_animation.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/service_booking_form.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceBookingScreen extends StatelessWidget {
  const ServiceBookingScreen({
    Key? key,
    this.item,
    this.showCross = true,
    this.fromDashboard = false,
  }) : super(key: key);

  /// dashboard item currently used for setting padding.
  final pranaam_dashboard.DashboardItem? item;
  final bool showCross;
  final bool fromDashboard;

  @override
  Widget build(BuildContext context) {
    return Selector<PranaamAppDataStateManagement, bool>(
      selector: (context, model) => model.isAnimationLoading,
      builder: (context, value, child) {
        return Stack(
          children: [
            Scaffold(
              body: ServiceBookingForm(
                item: item,
                showImage: showCross,
                fromDashboard: fromDashboard,
              ),
            ),
            if (value) const PranaamDashboardAnimation(),
          ],
        );
      },
    );
  }
}
