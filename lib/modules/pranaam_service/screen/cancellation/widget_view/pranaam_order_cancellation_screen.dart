/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/cancellation_data.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/widget_view/pranaam_order_cancellation_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/widget_view/pranaam_order_cancellation_widget_view.dart';
import 'package:flutter/material.dart';

///
///This is the entry point of pranaam cancellation screen which further redirects to [PranaamOrderCancellationController]
///Widget View is implemented to separate business logic and layout.
///Business Logic is in [PranaamOrderCancellationController]
///Layout is in [PranaamOrderCancellationWidgetView]
///

class PranaamOrderCancellationScreen extends StatefulWidget {
  final bool isFromBottomSheet;
  final CancellationData? cancellationData;
  final String? bookingID;
  final bool isRoundTrip;

  const PranaamOrderCancellationScreen({
    Key? key,
    this.cancellationData,
    this.bookingID,
    this.isFromBottomSheet = true,
    this.isRoundTrip = false,
  }) : super(key: key);

  @override
  PranaamOrderCancellationController createState() =>
      PranaamOrderCancellationController();
}
