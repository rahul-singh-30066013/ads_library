/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class will used for ticket info object, that generated once booking has been made
class TicketInfo {
  TicketInfo({
    int? id,
    String? ticketNumber,
    String? directionInd,
    int? rph,
    String? seatNumber,
    String? bookingStatus,
    String? cabinType,
    String? pnr,
    String? gdspnr,
  }) {
    _id = id;
    _ticketNumber = ticketNumber;
    _directionInd = directionInd;
    _rph = rph;
    _seatNumber = seatNumber;
    _bookingStatus = bookingStatus;
    _cabinType = cabinType;
    _pnr = pnr;
    _gdspnr = gdspnr;
  }

  TicketInfo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _ticketNumber = json['ticketNumber'];
    _directionInd = json['directionInd'];
    _rph = json['rph'];
    _seatNumber = json['seatNumber'];
    _bookingStatus = json['bookingStatus'];
    _cabinType = json['cabinType'];
    _pnr = json.containsKey('pnr') && json['pnr'] != null ? json['pnr'] : '';
    _gdspnr = json['gdspnr'];
  }
  int? _id;
  String? _ticketNumber;
  String? _directionInd;
  int? _rph;
  String? _seatNumber;
  String? _bookingStatus;
  String? _cabinType;
  String? _pnr;
  String? _gdspnr;

  int? get id => _id;
  String? get ticketNumber => _ticketNumber;
  String? get directionInd => _directionInd;
  int? get rph => _rph;
  String? get seatNumber => _seatNumber;
  String? get bookingStatus => _bookingStatus;
  String? get cabinType => _cabinType;
  String? get pnr => _pnr;
  String? get gdspnr => _gdspnr;

  TicketInfo copyWith({
    int? id,
    String? ticketNumber,
    String? directionInd,
    int? rph,
    String? seatNumber,
    String? bookingStatus,
    String? cabinType,
    String? pnr,
    String? gdspnr,
  }) {
    return TicketInfo(
      id: id ?? this.id,
      ticketNumber: ticketNumber ?? this.ticketNumber,
      directionInd: directionInd ?? this.directionInd,
      rph: rph ?? this.rph,
      seatNumber: seatNumber ?? this.seatNumber,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      cabinType: cabinType ?? this.cabinType,
      pnr: pnr ?? this.pnr,
      gdspnr: gdspnr ?? this.gdspnr,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ticketNumber'] = _ticketNumber;
    map['directionInd'] = _directionInd;
    map['rph'] = _rph;
    map['seatNumber'] = _seatNumber;
    map['bookingStatus'] = _bookingStatus;
    map['cabinType'] = _cabinType;
    map['pnr'] = _pnr;
    map['gdspnr'] = _gdspnr;
    return map;
  }
}
