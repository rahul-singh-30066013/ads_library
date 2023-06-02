// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_payment_confirmation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DutyPaymentConfirmation _$DutyPaymentConfirmationFromJson(
        Map<String, dynamic> json) =>
    DutyPaymentConfirmation(
      priceList: (json['price_list'] as List<dynamic>?)
          ?.map((e) => PriceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..adaniBalance = json['adaniBalance'] as String?
      ..totalAmount = json['totalAmount'] as String?
      ..rewardPoints = json['rewardPoints'] as String?
      ..paymentOptions = (json['payment_options'] as List<dynamic>?)
          ?.map((e) => PaymentOptions.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DutyPaymentConfirmationToJson(
        DutyPaymentConfirmation instance) =>
    <String, dynamic>{
      'adaniBalance': instance.adaniBalance,
      'totalAmount': instance.totalAmount,
      'rewardPoints': instance.rewardPoints,
      'payment_options': instance.paymentOptions,
      'price_list': instance.priceList,
    };
