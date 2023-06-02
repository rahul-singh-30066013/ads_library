/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/create_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_widget_view.dart';
import 'package:flutter/material.dart';

///
///This is the entry point of pranaam confirmation screen which further redirects to [PranaamConfirmationController]
///Widget View is implemented to separate business logic and layout.
///Business Logic is in [PranaamConfirmationController]
///Layout is in [PranaamConfirmationWidgetView]
///
class PranaamConfirmationScreen extends StatefulWidget {
  final CreateBookingRequestModel? createBookingModel;
  final String orderReferenceId;

  const PranaamConfirmationScreen({
    required this.createBookingModel,
    Key? key,
    required this.orderReferenceId,
  }) : super(key: key);

  @override
  PranaamConfirmationController createState() =>
      PranaamConfirmationController();
}
