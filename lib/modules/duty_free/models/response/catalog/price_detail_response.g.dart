// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceDetailResponse _$$_PriceDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PriceDetailResponse(
      amount: json['amount'] as num? ?? 0,
      currency: json['currency'] as String? ?? '',
      percentageDiscount: json['percentageDiscount'] as num? ?? 0,
      preOrderDiscountTime: json['preOrderDiscountTime'] as String? ?? '',
    );

Map<String, dynamic> _$$_PriceDetailResponseToJson(
        _$_PriceDetailResponse instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'percentageDiscount': instance.percentageDiscount,
      'preOrderDiscountTime': instance.preOrderDiscountTime,
    };
