/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/payment_summary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'duty_payment_confirmation.g.dart';

@JsonSerializable()
class DutyPaymentConfirmation {
  @JsonKey(name: 'adaniBalance')
  String? adaniBalance;

  @JsonKey(name: 'totalAmount')
  String? totalAmount;

  @JsonKey(name: 'rewardPoints')
  String? rewardPoints;

  @JsonKey(name: 'payment_options')
  List<PaymentOptions>? paymentOptions;

  @JsonKey(name: 'price_list')
  List<PriceDetails>? priceList;

  DutyPaymentConfirmation({this.priceList});

  factory DutyPaymentConfirmation.fromJson(Map<String, dynamic> json) =>
      _$DutyPaymentConfirmationFromJson(json);

  Map<String, dynamic> toJson() => _$DutyPaymentConfirmationToJson(this);
}
