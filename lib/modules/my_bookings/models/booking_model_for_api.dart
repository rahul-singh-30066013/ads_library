/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/modules/my_bookings/utils/booking_tab_type.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';

class BookingModelForApi {
  BookingHistory? allHistory;
  BookingHistory? shoppingHistory;
  BookingHistory? flightBookingHistory;

  BookingModelForApi({
    this.allHistory,
    this.shoppingHistory,
    this.flightBookingHistory,
  });
}

class BookingHistory extends ADBaseViewModel {
  BookingTabType? typeOfHistory;
  int? pageSize;
  bool? isReload = false;
  int? pageIndex;
  String? tabType;
  List<MyBookingListItem>? history;
  int? totalRecords;
  BookingHistory({
    this.typeOfHistory,
    this.pageSize,
    this.isReload,
    this.tabType,
    this.pageIndex,
    this.history,
    this.totalRecords,
  });

  void setValueForReload({required bool value}) {
    isReload = value;
    notifyListeners();
  }

  String bookingType(BookingTabType bookingTabType) {
    if (bookingTabType == BookingTabType.all) {
      return 'All';
    } else if (bookingTabType == BookingTabType.booking) {
      return 'Booking';
    } else {
      return 'Shopping';
    }
  }
}
