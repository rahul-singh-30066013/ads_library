/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_booking_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///this class is for buisness logic of pranaam confirmation screen
class PranaamConfirmationController extends State<PranaamConfirmationScreen> {
  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  BookingAndCancellationState getBookingDetailsState =
      BookingAndCancellationState();

  @override
  Widget build(BuildContext context) {
    return PranaamConfirmationWidgetView(
      this,
    );
  }

  @override
  void initState() {
    adLog('order id ------> ${widget.orderReferenceId}');
    // final CreateBookingRequestModel? createBookingRequestModel =
    //     widget.createBookingModel;
    // if (createBookingRequestModel == null) {
    //   adLog('createBookingModel is null', className: this);
    //   return;
    // }
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    super.initState();

    getBookingDetailsState
        .getBookingDetails(
      orderId: widget.orderReferenceId,
      fromInit: true,
    )
        .then((value) {
      Future.delayed(
        const Duration(milliseconds: 1000),
        () => Utils.appReviewMethod(),
      );
      final value = getBookingDetailsState.getImportantInformation(
        infoType: 'BookingConfirmation',
      );
      adLog('getBookingResponse  $value');

      context
          .read<AppSessionState>()
          .getBookings(bookType: context.read<AppSessionState>().mainTabType)
          .then((value) {
        final MyBookingResponseModel? bookingDetails = value.data;
        context.read<AppSessionState>().allOrders?.history =
            bookingDetails?.all;
        context.read<AppSessionState>().allOrders?.totalRecords =
            bookingDetails?.totalRecord;
        context.read<AppSessionState>().allOrders?.pageIndex = 1;
        context
            .read<AppSessionState>()
            .allOrders
            ?.setValueForReload(value: true);
      });
      getBookingDetailsState.getPotentialEarning();
    });
  }

  @override
  void dispose() {
    pranaamAppDataStateManagement.bookingID = '';
    // resetCartOnExit();
    super.dispose();
  }

  String getTitle(String bookingType) {
    switch (bookingType.toLowerCase()) {
      case 'upgradebooking':
        return 'Booking Upgraded,\nThank you!';
      case 'reschedulebooking':
        return 'Rescheduled\nConfirmed. Thank you!';
      default:
        return 'Booking Confirmed,\nThank you!';
    }
  }

  String getSubtitle(String bookingType) {
    switch (bookingType.toLowerCase()) {
      case 'upgradebooking':
      case 'reschedulebooking':
        return 'A confirmation email has been sent to';
      default:
        return 'Ticket emailed to';
    }
  }

  void onModifyTap() {
    PranaamBookingGaAnalytics().pranaamModifyGaEvent(
      getBookingDetailsState,
      ClickEvents.book_pranaam_modify,
    );
    const int roundTripServiceTypeId = 3;
    final CustomTabScaffold scaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    BottomBarState.currentIndex = id_2;
    scaffold.controller?.index = id_2;
    resetCartData();
    context.read<PranaamAppDataStateManagement>().resetCartData();
    context
        .read<PranaamAppDataStateManagement>()
        .updateIsFromConfirmation(value: true);
    context.read<PranaamAppDataStateManagement>().serviceBookingData =
        ServiceBookingModel();
    Navigator.of(context).popUntil((route) => route.settings.name == tabRoute);
    if (getBookingDetailsState.bookingDetailsResponse?.orderDetail
            ?.pranaamDetail?.tripDetails?.serviceTypeId !=
        roundTripServiceTypeId) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        myAccountView,
        argumentObject: [
          '${getBookingDetailsState.bookingDetailsResponse?.orderReferenceId}',
          false,
          false,
          false,
        ],
      );
    }
    context.read<AppSessionState>().getUpcomingBookings();
  }

  void resetCartData() {
    context.read<AppSessionState>().clearPranaamCartLocally();
  }

  Future<void> onCrossTap() async {
    context.read<PranaamAppDataStateManagement>().serviceBookingData =
        ServiceBookingModel();
    navigatorPopScreen(context);
  }

  void resetCartOnExit() {
    resetCartData();
    context.read<AppSessionState>().clearPranaamCartLocally();
    context.read<PranaamAppDataStateManagement>().resetCartData();
    context
        .read<PranaamAppDataStateManagement>()
        .updateIsFromConfirmation(value: true);
    context.read<PranaamAppDataStateManagement>().serviceBookingData =
        ServiceBookingModel();
    adLog(popUntil().toString());
  }
}
