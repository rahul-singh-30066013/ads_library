/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';

class ProfileGaAnalytics {
  void viewProfileAnalyticsData() {
    final viewProfileIconObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'view',
    };
    ClickEvents.view_profile_icon.logEvent(parameters: viewProfileIconObject);
  }

  void chatBotOpenAnalyticsData({
    required String type,
  }) {
    final chatBotSelectObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'chatbot',
      Parameters.type.name: type,
    };
    ClickEvents.chat_click.logEvent(parameters: chatBotSelectObject);
  }

  void viewProfileSelectAnalyticsData({
    required String label,
    required String type,
  }) {
    final viewProfileSelectObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'select',
      Parameters.label.name: label,
      Parameters.type.name: type,
    };
    ClickEvents.view_profile_select
        .logEvent(parameters: viewProfileSelectObject);
  }

  void logOutPopUpAnalyticsData({
    required String label,
  }) {
    final logOutPopUpObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'sign_out',
      Parameters.label.name: label,
    };
    ClickEvents.logout_popup_select.logEvent(parameters: logOutPopUpObject);
  }

  void logOutAnalyticsData() {
    final logOutObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'sign_out',
    };
    ClickEvents.logout.logEvent(parameters: logOutObject);
  }

  void editProfileAnalyticsData({
    required String nationality,
    required String dateOfBirth,
  }) {
    final editProfileObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'edit_profile',
      Parameters.nationality.name: nationality,
      if(dateOfBirth.isNotEmpty)
      Parameters.date_of_birth.name: FlightUtils.eventDateYYYYMMDDFormat(dateOfBirth, Constant.dateFormat11, Constant.dateFormat21),

    };
    ClickEvents.edit_profile.logEvent(parameters: editProfileObject);
  }

  void viewOrderAndBookingAnalyticsData({required String label}) {
    final viewOrderAndBookingObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.type.name: 'orders_and_bookings',
      Parameters.label.name: label,
    };
    ClickEvents.view_order_and_bookings
        .logEvent(parameters: viewOrderAndBookingObject);
  }

  void selectOrderAndBookingAnalyticsData({
    String? type,
    String? label,
    String? date,
    String? transactionId,
  }) {
    final selectOrderAndBookingObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'orders_and_bookings',
      Parameters.type.name: type,
      Parameters.label.name: label,
      if(date != null)
        Parameters.date_of_birth.name: FlightUtils.eventDateYYYYMMDDFormat(date, Constant.dateFormat5, Constant.dateFormat21),
      Parameters.transaction_id.name: transactionId,
    };
    ClickEvents.select_order_and_bookings
        .logEvent(parameters: selectOrderAndBookingObject);
  }

  void selectStartExploringAnalyticsData({
    required String source,
  }) {
    final selectStartExploringObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'orders_and_bookings',
      Parameters.source.name: source,
    };
    ClickEvents.select_start_exploring
        .logEvent(parameters: selectStartExploringObject);
  }

  void selectReferAndInviteAnalyticsData(String count) {
    final selectReferAndInviteObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'refer',
      Parameters.count.name: count,
    };
    ClickEvents.select_refer_and_invite
        .logEvent(parameters: selectReferAndInviteObject);
  }

  void selectBackToOrderAndBookingAnalyticsData() {
    final selectBackToOrderAndBookingObject = <String, Object?>{
      Parameters.category.name: 'profile',
      Parameters.sub_category.name: 'orders_and_bookings',
    };
    ClickEvents.select_back_to_order_and_bookings
        .logEvent(parameters: selectBackToOrderAndBookingObject);
  }
}
