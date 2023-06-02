/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_cancel_order_details_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_isolate_model.dart';

class OrderDetail {
  String? bookingId;
  String? transactionReferenceId;
  String? itineraryId;
  dynamic history;
  dynamic pickupDate;
  FlightViewTripResponseModel? flightbookingDetail;
  DutyfreeDetail? dutyfreeDetail;
  PranaamDetail? pranaamDetail;
  CabOrderDetailResponseModel? cabDetail;
  String? currencyCode;

  OrderDetail({
    this.bookingId,
    this.transactionReferenceId,
    this.itineraryId,
    this.history,
    this.pickupDate,
    this.flightbookingDetail,
    this.dutyfreeDetail,
    this.pranaamDetail,
    this.cabDetail,
    this.currencyCode,
  });

  OrderDetail.fromJson(Map<String, dynamic> json,String? status,FlightListIsolateModel model,) {
    if (json['bookingId'] is String) {
      bookingId = json['bookingId'];
    }
    if (json['itineraryId'] is String) {
      itineraryId = json['itineraryId'];
    }
    history = json['history'];
    pickupDate = json['pickupDate'];
    if (json['flightbookingDetail'] is Map) {
      flightbookingDetail = json['flightbookingDetail'] == null
          ? null
          : FlightViewTripResponseModel.fromJson(FlightListIsolateModel(
        jsonData: json['flightbookingDetail'],
        airlineInfo: model.airlineInfo,
        departureFlightCountMap: model.departureFlightCountMap,
        arrivalFlightCountMap: model.arrivalFlightCountMap,
        internationalAirportMap: model.internationalAirportMap,
      ),status,
          bookingId,);
    }
    dutyfreeDetail = json['dutyfreeDetail'] == null
        ? null
        : DutyfreeDetail.fromJson(json['dutyfreeDetail']);
    pranaamDetail = json['pranaamDetail'] == null
        ? null
        : PranaamDetail.fromJson(json['pranaamDetail']);
    cabDetail = json['cabDetail'] == null
        ? null
        : CabOrderDetailResponseModel.fromJson(json['cabDetail']);
    if (json['currencyCode'] is String) {
      currencyCode = json['currencyCode'];
    }
  }
}
