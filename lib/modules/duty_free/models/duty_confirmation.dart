/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'duty_confirmation.g.dart';

@JsonSerializable()
class DutyConfirmation {
  @JsonKey(name: 'order_list')
  List<OrderList>? orderList;

  @JsonKey(name: 'recommended_list')
  List<RecommendedList>? recommendedList;

  @JsonKey(name: 'booking_confirmation_item')
  BookingConfirmation? bookingConfirmation;

  @JsonKey(name: 'offer_banner')
  OfferBanner? offerBanner;

  DutyConfirmation({
    this.orderList,
    this.bookingConfirmation,
    this.recommendedList,
    this.offerBanner,
  });

  factory DutyConfirmation.fromJson(Map<String, dynamic> json) =>
      _$DutyConfirmationFromJson(json);

  Map<String, dynamic> toJson() => _$DutyConfirmationToJson(this);
}

@JsonSerializable()
class OfferBanner {
  String? offerTitle;
  String? offerDescription;
  String? offerImage;
  String? email;

  OfferBanner({
    this.offerTitle,
    this.offerDescription,
    this.offerImage,
    this.email,
  });

  factory OfferBanner.fromJson(Map<String, dynamic> json) =>
      _$OfferBannerFromJson(json);

  Map<String, dynamic> toJson() => _$OfferBannerToJson(this);
}

@JsonSerializable()
class OrderList {
  String? title;
  String? actualPrice;
  String? discountedPrice;

  OrderList({this.title, this.actualPrice, this.discountedPrice});

  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}

@JsonSerializable()
class BookingConfirmation {
  String? orderID;
  String? dutyFreeName;
  String? collectionPoint;
  String? paymentDetail;

  BookingConfirmation({
    this.orderID,
    this.dutyFreeName,
    this.collectionPoint,
    this.paymentDetail,
  });

  factory BookingConfirmation.fromJson(Map<String, dynamic> json) =>
      _$BookingConfirmationFromJson(json);

  Map<String, dynamic> toJson() => _$BookingConfirmationToJson(this);
}

@JsonSerializable()
class RecommendedList {
  String? title;
  String? actualPrice;
  String? discountedPrice;
  String? image;

  RecommendedList({
    this.title,
    this.actualPrice,
    this.discountedPrice,
    this.image,
  });

  factory RecommendedList.fromJson(Map<String, dynamic> json) =>
      _$RecommendedListFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedListToJson(this);
}
