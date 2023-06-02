/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/my_bookings/models/response/fields.dart';
import 'package:flutter/foundation.dart';

@immutable
class MyBookingListItem {
  const MyBookingListItem({
    this.orderReferenceId,
    required this.businessSubType,
    this.businessType,
    this.grossAmount,
    this.status,
    this.orderDetail,
    this.createdOn,
    this.modifiedOn,
    this.modifiedOnEpoch,
    this.description,
    this.cancelType,
  });

  final String? orderReferenceId;
  final BookingType businessSubType;
  final String? businessType;
  final num? grossAmount;
  final String? status;
  final Fields? orderDetail;
  final String? createdOn;
  final String? modifiedOn;
  final int? modifiedOnEpoch;
  final String? description;
  final String? cancelType;

  @override
  String toString() {
    return 'MyBookingListItem(orderReferenceId: $orderReferenceId, businessType: $businessType, businessSubType: $businessSubType, orderDetail: $orderDetail, grossAmount : $grossAmount, status : $status, createdOn: $createdOn, description : $description)';
  }

  factory MyBookingListItem.fromJson(Map<String, dynamic> json) =>
      MyBookingListItem(
        orderReferenceId: json['orderReferenceId'] as String?,
        businessSubType: _getBookingTYpeBasedOnSubType(
          json['businessSubType'] ?? '',
        ),
        businessType: json['businessType'] as String?,
        grossAmount: json['grossAmount'] as num?,
        status: json['status'] as String?,
        createdOn: json['createdOn'] as String?,
        modifiedOn: json['modifiedOn'] as String?,
        modifiedOnEpoch: json['modifiedOnEpoch'] as int?,
        orderDetail: Fields.fromJson(json['orderDetail']),
        description: json['description'] as String?,
        cancelType: json['cancelType'] as String?,
      );

  static BookingType _getBookingTYpeBasedOnSubType(String subType) {
    if (subType == 'FlightBooking') {
      return BookingType.flightBooking;
    } else if (subType == 'Pranaam') {
      return BookingType.pranaam;
    } else if (subType == 'DutyFree') {
      return BookingType.dutyFree;
    } else if (subType == 'CabBooking') {
      return BookingType.cabBooking;
    } else if (subType == 'Trainman') {
      return BookingType.trainman;
    } else {
      return BookingType.other;
    }
  }

  Map<String, dynamic> toJson() => {
        'orderReferenceId': orderReferenceId,
        'businessSubType': businessSubType,
        'businessType': businessType,
        'grossAmount': grossAmount,
        'status': status,
        'createdOn': createdOn,
        'modifiedOn': modifiedOn,
        'modifiedOnEpoch': modifiedOnEpoch,
        'orderDetail': orderDetail?.toJson(),
        'description': description,
        'cancelType': cancelType,
      };

  MyBookingListItem copyWith({
    String? orderReferenceId,
    BookingType? businessSubType,
    String? businessType,
    int? grossAmount,
    String? status,
    String? createdOn,
    String? modifiedOn,
    int? modifiedOnEpoch,
    Fields? orderDetail,
    String? description,
    String? cancelType,
  }) {
    return MyBookingListItem(
      orderReferenceId: orderReferenceId ?? this.orderReferenceId,
      businessSubType: businessSubType ?? this.businessSubType,
      businessType: businessType ?? this.businessType,
      grossAmount: grossAmount ?? this.grossAmount,
      status: status ?? this.status,
      createdOn: createdOn ?? this.createdOn,
      modifiedOn: modifiedOn ?? this.modifiedOn,
      modifiedOnEpoch: modifiedOnEpoch ?? this.modifiedOnEpoch,
      orderDetail: orderDetail ?? this.orderDetail,
      description: description ?? this.description,
      cancelType: cancelType ?? this.cancelType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    return other is MyBookingListItem &&
        other.orderReferenceId == orderReferenceId &&
        other.businessSubType == businessSubType &&
        other.businessType == businessType &&
        other.grossAmount == grossAmount &&
        other.status == status &&
        other.createdOn == createdOn &&
        other.modifiedOn == modifiedOn &&
        other.modifiedOnEpoch == modifiedOnEpoch &&
        other.orderDetail == orderDetail &&
        other.description == description &&
        other.cancelType == cancelType;
  }

  @override
  int get hashCode =>
      orderReferenceId.hashCode ^
      businessSubType.hashCode ^
      businessType.hashCode ^
      grossAmount.hashCode ^
      status.hashCode ^
      createdOn.hashCode ^
      modifiedOn.hashCode ^
      modifiedOnEpoch.hashCode ^
      orderDetail.hashCode ^
      description.hashCode ^
      cancelType.hashCode;
}

enum BookingType {
  flightBooking,
  pranaam,
  dutyFree,
  cabBooking,
  trainman,
  other,
}

class BookingData {
  BookingData({
    int? totalRecords,
    int? totalPages,
    int? pageSize,
    int? pageIndex,
    List<MyBookingListItem>? myBookingData,
  }) {
    _totalRecords = totalRecords;
    _totalPages = totalPages;
    _pageSize = pageSize;
    _pageIndex = pageIndex;
    _myBookingData = myBookingData;
  }

  BookingData.fromJson(Map<String, dynamic> json) {
    _totalRecords = json['count'];
    _totalPages = json['totalPages'];
    _pageSize = json['limit'];
    _pageIndex = json['page'];
    if (json['data'] != null) {
      _myBookingData = [];
      for (final object in json['data'] as List) {
        final MyBookingListItem myBookingData =
            MyBookingListItem.fromJson(object);
        _myBookingData?.add(myBookingData);
      }
    }
  }

  int? _totalRecords;
  int? _totalPages;
  int? _pageSize;
  int? _pageIndex;
  List<MyBookingListItem>? _myBookingData;

  int? get totalRecords => _totalRecords;

  int? get totalPages => _totalPages;

  int? get pageSize => _pageSize;

  int? get pageIndex => _pageIndex;

  List<MyBookingListItem>? get myBookingData => _myBookingData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _totalRecords;
    map['totalPages'] = _totalPages;
    map['limit'] = _pageSize;
    map['page'] = _pageIndex;

    if (_myBookingData != null) {
      map['bookings'] = _myBookingData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
