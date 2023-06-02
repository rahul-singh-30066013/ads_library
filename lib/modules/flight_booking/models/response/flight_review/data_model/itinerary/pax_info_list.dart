/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/ticket_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/document.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';

/// this class will used for pax info list related to itinerary
class PaxInfoList {
  PaxInfoList({
    List<TicketInfo>? ticketInfo,
    int? travelerRefNumber,
    this.personName,
    this.dateOfBirth,
    this.nationality,
    List<Document>? document,
    this.passengerTypeCode,
    this.status,
  }) {
    _ticketInfo = ticketInfo;
    _travelerRefNumber = travelerRefNumber;
    _document = document;
    // passengerTypeCode = passengerTypeCode;
  }

  PaxInfoList.fromJson(Map<String, dynamic> json,String? bookingStatus) {
    if (json.containsKey('ticketInfo') && json['ticketInfo'] != null) {
      _ticketInfo = [];
      for (final object in json['ticketInfo'] as List) {
        final TicketInfo ticketInfo = TicketInfo.fromJson(object);
        _ticketInfo?.add(ticketInfo);
      }
    }
    if(bookingStatus=='PENDING'){
      final TicketInfo pendingTicketInfo=TicketInfo(bookingStatus: 'H');
      _ticketInfo?.add(pendingTicketInfo);
    }
    else  if(bookingStatus=='FAILED'){
      final TicketInfo pendingTicketInfo=TicketInfo(bookingStatus: 'F');
      _ticketInfo?.add(pendingTicketInfo);
    }
    _travelerRefNumber = json['travelerRefNumber'];
    personName = json['personName'] != null
        ? PersonName.fromJson(json['personName'])
        : null;
    dateOfBirth = json['dateOfBirth'];
    nationality = json['nationality'];

    if (json['document'] != null) {
      _document = [];
      for (final object in json['document'] as List) {
        final Document document = Document.fromJson(object);
        _document?.add(document);
      }
    }
    passengerTypeCode = json['passengerTypeCode'];
    status = true;
  }

  PaxInfoList copyWith({
    List<TicketInfo>? ticketInfo,
    int? travelerRefNumber,
    PersonName? personName,
    String? dateOfBirth,
    String? nationality,
    List<Document>? document,
    String? passengerTypeCode,
    bool? status,
  }) {
    return PaxInfoList(
      ticketInfo: ticketInfo ?? this.ticketInfo,
      travelerRefNumber: travelerRefNumber ?? this.travelerRefNumber,
      personName: personName ?? this.personName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      nationality: nationality ?? this.nationality,
      document: document ?? this.document,
      passengerTypeCode: passengerTypeCode ?? this.passengerTypeCode,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_ticketInfo != null) {
      map['ticketInfo'] = _ticketInfo?.map((v) => v.toJson()).toList();
    }
    map['travelerRefNumber'] = _travelerRefNumber;
    if (personName != null) {
      map['personName'] = personName?.toJson();
    }
    if (dateOfBirth != null && (dateOfBirth ?? '').isNotEmpty) {
      map['dateOfBirth'] = dateOfBirth;
    }
    map['nationality'] = nationality;
    if (_document != null) {
      map['document'] = _document?.map((v) => v.toJson()).toList();
    }
    map['passengerTypeCode'] = passengerTypeCode;
    return map;
  }

  List<TicketInfo>? _ticketInfo;
  int? _travelerRefNumber;
  PersonName? personName;
  String? dateOfBirth;
  String? nationality;
  List<Document>? _document;
  String? passengerTypeCode;
  bool? status;

  List<TicketInfo>? get ticketInfo => _ticketInfo;
  int? get travelerRefNumber => _travelerRefNumber;
  List<Document>? get document => _document;
}
