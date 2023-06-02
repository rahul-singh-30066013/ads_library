/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/create_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/widget_view/pranaam_order_cancellation_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/widget_view/pranaam_order_cancellation_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///this class is for buisness logic of pranaam cancellation screen
class PranaamOrderCancellationController
    extends State<PranaamOrderCancellationScreen> {
  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  BookingAndCancellationState getBookingDetailsState =
      BookingAndCancellationState();
  CreateBookingRequestModel? createBookingModel;
  SiteCoreStateManagement? siteCoreStateManagement;
  @override
  Widget build(BuildContext context) {
    return PranaamOrderCancellationWidgetView(
      this,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    getBookingDetailsState
        .getBookingDetails(
          fromInit: true,
          orderId: '',
        )
        .then((value) => adLog('getBookingDetails :$value'));
  }

  Future<bool> onBackPressed(BuildContext context) {
    widget.isFromBottomSheet
        ? Navigator.pop(context)
        : Navigator.of(context).popUntil((route) => route.isFirst);
    return Future.value(true);
  }
}
