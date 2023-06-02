/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/my_bookings/models/booking_model_for_api.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/modules/my_bookings/screens/cab_booking_view.dart';
import 'package:adani_airport_mobile/modules/my_bookings/screens/duty_free_booking_view.dart';
import 'package:adani_airport_mobile/modules/my_bookings/screens/flight_booking_list_screen.dart';
import 'package:adani_airport_mobile/modules/my_bookings/screens/pranaam_booking_view.dart';
import 'package:adani_airport_mobile/modules/train/screens/train_booking_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Booking item cell for order and booking
class MyBookingsListItem extends StatelessWidget {
  final MyBookingListItem bookingItemObj;
  final Future<void> Function()? refreshCallback;
  final bool isFromMoreScreen;
  final ADTapCallback? onTapHandler;
  final BookingHistory? bookingHistory;

  const MyBookingsListItem({
    required this.bookingItemObj,
    Key? key,
    this.refreshCallback,
    this.isFromMoreScreen = false,
    this.onTapHandler,
    this.bookingHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (bookingItemObj.businessSubType) {
      case BookingType.flightBooking:
        return BookingDetail(
          myBookingListItem: bookingItemObj,
          refreshCallback: refreshCallback ?? () => null,
          bookingHistory: bookingHistory,
          onTap: () => onTapHandler?.call(),
        );
      case BookingType.pranaam:
        return PranaamBookingView(
          myBookingListItem: bookingItemObj,
          isFromMoreScreen: isFromMoreScreen,
          bookingHistory: bookingHistory,
          onTap: () => onTapHandler?.call(),
        );
      case BookingType.dutyFree:
        return DutyFreeBookingView(
          myBookingListItem: bookingItemObj,
          bookingHistory: bookingHistory,
          onTap: () => onTapHandler?.call(),
        );
      case BookingType.cabBooking:
        return CabBookingView(
          myBookingListItem: bookingItemObj,
          isFromMoreScreen: isFromMoreScreen,
          bookingHistory: bookingHistory,
          onTap: () => onTapHandler?.call(),
        );
      case BookingType.trainman:
        return  TrainBookingView(
          myBookingListItem: bookingItemObj,
          isFromMoreScreen: isFromMoreScreen,
          bookingHistory: bookingHistory,
        );
      default:
        return const ADSizedBox.shrink();
    }
  }
}
