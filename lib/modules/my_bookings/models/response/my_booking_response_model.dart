/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';

class MyBookingResponseModel {
  MyBookingResponseModel({
    this.all,
    this.shopping,
    this.booking,
    this.currentOrders,
    this.totalRecord,
  });

  final List<MyBookingListItem>? all;
  final List<MyBookingListItem>? shopping;
  final List<MyBookingListItem>? booking;
  List<MyBookingListItem>? currentOrders;
  final int? totalRecord;

  @override
  String toString() {
    return 'MyBookingResponseModel(data: $all)';
  }

  factory MyBookingResponseModel.fromJson(Map<String, dynamic> json) {
    final List<MyBookingListItem> _all = [];
    final List<MyBookingListItem> _shopping = [];
    final List<MyBookingListItem> _booking = [];
    final List<MyBookingListItem> _currentOrders = [];
    int _totalRecord = 0;
    final BookingData myBookingListItem = BookingData.fromJson(json);
    _all.addAll(myBookingListItem.myBookingData ?? []);
    _totalRecord = myBookingListItem.totalRecords ?? 0;
    // if (myBookingListItem.subType == BookingType.flightBooking ||
    //     myBookingListItem.subType == BookingType.pranaam) {
    //   _booking.add(myBookingListItem);
    // } else {
    //   _shopping.add(myBookingListItem);
    // }
    // if (myBookingListItem.isUpcoming ?? false) {
    //   _currentOrders.add(myBookingListItem);
    // }
    return MyBookingResponseModel(
      all: _all,
      shopping: _shopping,
      booking: _booking,
      currentOrders: _currentOrders,
      totalRecord: _totalRecord,
    );
  }

  ///This function is used to parse the upcoming orders only
  factory MyBookingResponseModel.upcomingFromJson(Map<String, dynamic> json) {
    final List<MyBookingListItem> _currentOrders = [];
    // for (final object in json) {
    //   final MyBookingListItem myBookingListItem =
    //       MyBookingListItem.fromJson(object as Map<String, dynamic>);
    //   _currentOrders.add(myBookingListItem);
    // }

    if (json['data'] != null) {
      for (final object in json['data'] as List) {
        final MyBookingListItem myBookingListItem =
        MyBookingListItem.fromJson(object);
        _currentOrders.add(myBookingListItem);
      }
    }

    return MyBookingResponseModel(
      all: const [],
      shopping: const [],
      booking: const [],
      currentOrders: _currentOrders,
    );
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(other, this)) {
  //     return true;
  //   }
  //   return other is MyBookingResponseModel && listEquals(other.all, all);
  // }
  //
  // @override
  // int get hashCode => all.hashCode;
}
