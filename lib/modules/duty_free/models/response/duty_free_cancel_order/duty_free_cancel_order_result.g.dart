// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_cancel_order_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeCancelOrderResult _$$_DutyFreeCancelOrderResultFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeCancelOrderResult(
      skuDetail: (json['skuDetail'] as List<dynamic>?)
              ?.map((e) => DutyFreeCancelOrderSKUDetails.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      passengerDetail: (json['passengerDetail'] as List<dynamic>?)
              ?.map((e) =>
                  PassengerDetailsResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      promoCoupon: json['promoCoupon'] == null
          ? const PromoCodeResponse()
          : PromoCodeResponse.fromJson(
              json['promoCoupon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DutyFreeCancelOrderResultToJson(
        _$_DutyFreeCancelOrderResult instance) =>
    <String, dynamic>{
      'skuDetail': instance.skuDetail,
      'passengerDetail': instance.passengerDetail,
      'promoCoupon': instance.promoCoupon,
    };
