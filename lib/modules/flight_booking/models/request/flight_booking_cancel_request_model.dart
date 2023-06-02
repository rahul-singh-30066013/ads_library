/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/ticket_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancel_reason.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';

//this model class is used for flight book request model
class FlightBookingCancelRequestModel {
  CancelReason? _cancelReason;
  String? _reasonCode;
  String? _offerValue;
  String? _orderReferenceId;
  List<int>? _sequenceNumber;
  FlightBookingCancelRequestModel({
    CancelReason? cancelReason,
    String? orderReferenceId,
    String? reasonCode,
    List<int>? sequenceNumber,
    String? offerValue,
  }) {
    _cancelReason = cancelReason;
    _orderReferenceId = orderReferenceId;
    _reasonCode = reasonCode;
    _sequenceNumber = sequenceNumber;
    _offerValue=offerValue;
  }

  FlightBookingCancelRequestModel copyWith({
    CancelReason? cancelReason,
    String? reasonCode,
    String? offerValue,
    String? orderReferenceId,
    List<int>? sequenceNumber,
  }) {
    return FlightBookingCancelRequestModel(
      orderReferenceId: orderReferenceId ?? _orderReferenceId,
      reasonCode: reasonCode ?? _reasonCode,
      sequenceNumber: sequenceNumber ?? _sequenceNumber,
      cancelReason: cancelReason ?? _cancelReason,
      offerValue: offerValue??_offerValue,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderReferenceId'] = _orderReferenceId;
    if (_sequenceNumber != null) {
      map['sequenceNumber'] = _sequenceNumber?.map((v) => v).toList();
    }
    if (_cancelReason != null) {
      map['cancelReason'] = _cancelReason;
    }
    if (_reasonCode != null) {
      map['reasonCode'] = _reasonCode;
    }
    if (_offerValue != null) {
      map['offerValue'] = _offerValue;
    }
    return map;
  }

  FlightBookingCancelRequestModel.fromJson(Map<String, dynamic> json) {
    _orderReferenceId = json['orderReferenceId'];
    _reasonCode = json['reasonCode'];
    if (json['sequenceNumber'] != null) {
      _sequenceNumber = [];
      final objectToAdd = json['sequenceNumber'] as List
        ..forEach((element) {
          _sequenceNumber?.add(element);
        });
      adLog('checkObj$objectToAdd');
    }
    _cancelReason = json['cancelReason'] != null
        ? CancelReason.fromJson(json['cancelReason'])
        : null;
  }

  ///create Booking RequestBody string param prepare
  String createBookingCancelRequestBody(
    SelectedPaxTripToCancel selectedPaxTripToCancel,
  ) {
    final List<int> seqToCancel = [];
    final List<PassengerListInJourney> listInJourney =
        selectedPaxTripToCancel.passengerListInJourneyList;
    for (int listJourney = 0;
        listJourney < listInJourney.length;
        listJourney++) {
      final PassengerListInJourney passengerListInJourney =
          listInJourney[listJourney];
      final List<PassengerTicketInfo> paxInfoList =
          passengerListInJourney.cancellablePaxInfoList ?? [];
      for (int pax = 0; pax < paxInfoList.length; pax++) {
        final bool selectedStatus =
            paxInfoList[pax].cancellablePaxInfoList?.status ?? false;
        if (selectedStatus) {
          final List<TicketInfo?> ticketInfoList =
              paxInfoList[pax].ticketInfo ?? [];
          for (int ticket = 0; ticket < ticketInfoList.length; ticket++) {
            final TicketInfo? ticketInfo = ticketInfoList[ticket];
            seqToCancel.add(ticketInfo?.id ?? 0);
          }
        }
      }
    }

    final FlightBookingCancelRequestModel flightBookingCancelRequestModel =
        FlightBookingCancelRequestModel().copyWith(
          orderReferenceId: selectedPaxTripToCancel.orderReferenceId,
      cancelReason: selectedPaxTripToCancel.cancelReason,
      sequenceNumber: seqToCancel,
      reasonCode: selectedPaxTripToCancel.cancelReason?.code, offerValue: '0',
    );

    return jsonEncode(flightBookingCancelRequestModel);
  }
}

class SelectedPaxTripToCancel {
  String orderReferenceId;
  List<PassengerListInJourney> passengerListInJourneyList;
  CancelReason? cancelReason;
  SelectedPaxTripToCancel({
    required this.orderReferenceId,
    required this.passengerListInJourneyList,
    this.cancelReason,
  });
}
